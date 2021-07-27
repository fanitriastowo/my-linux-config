
" Note: Make sure the function is defined before `vim-buffet` is loaded.
function! g:BuffetSetCustomColors()
  hi! BuffetCurrentBuffer cterm=NONE ctermbg=1 ctermfg=4 guibg=#00FF00 guifg=#000000
endfunction

set nocompatible

let mapleader=" "
if ! filereadable(expand('~/.config/nvim/autoload/plug.vim'))
	echo "Downloading junegunn/vim-plug to manage plugins..."
	silent !mkdir -p ~/.config/nvim/autoload/
    silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ~/.config/nvim/autoload/plug.vim
	autocmd VimEnter * PlugInstall
endif

call plug#begin('~/.config/nvim/plugged')
Plug 'tpope/vim-surround'
Plug 'scrooloose/nerdtree'
Plug 'vimwiki/vimwiki'
Plug 'bling/vim-airline'
Plug 'tpope/vim-commentary'
Plug 'kovetskiy/sxhkd-vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'chaoren/vim-wordmotion'
Plug 'mkitt/tabline.vim'
Plug 'sheerun/vim-polyglot'
Plug 'easymotion/vim-easymotion'
Plug 'bagrat/vim-buffet'
Plug 'maxboisvert/vim-simple-complete'
Plug 'morhetz/gruvbox'
call plug#end()

" Some basics:

    set bg=dark
    " colorscheme torte
    autocmd vimenter * ++nested colorscheme gruvbox
    " set regexpengine=1
    set re=0

    set mouse=n
    set nohlsearch

    set clipboard=unnamedplus
    set clipboard+=unnamedplus

    set scrolloff=10
    set sidescrolloff=20
    set smartindent
    set breakindent
    set smartcase

    filetype plugin on
    filetype indent on
    syntax enable

    set lazyredraw
    let g:loaded_matchparen=1

    set encoding=utf-8
    set tabstop=2
    set softtabstop=0 expandtab
    set shiftwidth=2
    set smarttab
    set number
    set ignorecase
    set autoread
    set autoindent
    set copyindent
    set wildmenu
    set ttyfast

    nnoremap c "_c
    nnoremap <M-W> :w! <bar> mksession! ~/.config/nvim/Session.vim<CR>
    nnoremap <M-w> :wall<CR>
    nnoremap <M-\> :split<CR>

    nnoremap <silent> <Leader>+ :exe "vertical resize +30"<CR>
    nnoremap <silent> <Leader>- :exe "vertical resize -30"<CR>

    let g:NERDTreeWinSize=50
    let g:NERDTreeWinPos = "right"
		nnoremap <M-n> :NERDTreeToggle<CR>

    set updatetime=50
    set timeoutlen=1000
    set ttimeoutlen=0

    " inoremap " ""<left>
    " inoremap ' ''<left>
    " inoremap ` ``<left>
    " inoremap ( ()<left>
    " inoremap [ []<left>
    " inoremap { {}<left>
    " inoremap {<CR> {<CR>}<ESC>O
    " inoremap {;<CR> {<CR>};<ESC>O

    set nocursorcolumn
    set nocursorline
    set norelativenumber
    syntax sync minlines=256
    set nowrap

    " Tab config
    " noremap <M-1> 1gt
    " noremap <M-2> 2gt
    " noremap <M-3> 3gt
    " noremap <M-4> 4gt
    " noremap <M-5> 5gt
    " noremap <M-6> 6gt
    " noremap <M-7> 7gt
    " noremap <M-8> 8gt
    " noremap <M-9> 9gt
    " noremap <M-0> :tablast<cr>

		" Vim buffer (Vim Tab Plugin)
		let g:buffet_show_index=1
    nmap <M-1> <Plug>BuffetSwitch(1)
		nmap <M-2> <Plug>BuffetSwitch(2)
		nmap <M-3> <Plug>BuffetSwitch(3)
		nmap <M-4> <Plug>BuffetSwitch(4)
		nmap <M-5> <Plug>BuffetSwitch(5)
		nmap <M-6> <Plug>BuffetSwitch(6)
		nmap <M-7> <Plug>BuffetSwitch(7)
		nmap <M-8> <Plug>BuffetSwitch(8)
		nmap <M-9> <Plug>BuffetSwitch(9)
		nmap <M-0> <Plug>BuffetSwitch(10)
		nmap <leader>z :Bw<CR>
		nmap <leader>Z :Bonly<CR>
		" nmap <C-PageUp> :bp<CR>
		" nmap <C-PageDown> :bn<CR>
		nnoremap <M-[> :bp<CR>
		nnoremap <M-]> :bn<CR>

		" Format using prettier NPM package
    nnoremap <silent> <Leader>= :!prettier --single-quote --trailing-comma all --no-semi --jsx-single-quote --write %<CR>
    nnoremap <silent> <Leader>+ :exe "vertical resize +30"<CR>

    set hidden
    set backspace=indent,eol,start " allow backspacing over everything in insert mode

    " Some servers have issues with backup files, see #649.
    set nobackup
    set nowritebackup
    set undodir=~/.config/nvim/undodir
    set undofile
    set noswapfile

    " Give more space for displaying messages.
    set cmdheight=1

    " Don't pass messages to |ins-completion-menu|.
    set shortmess+=c

		" Vim surround
		" use block words `S + -- ' | " | ( | [ | { --`
		" Triger `autoread` when files changes on disk
		" https://unix.stackexchange.com/questions/149209/refresh-changed-content-of-file-opened-in-vim/383044#383044
		" https://vi.stackexchange.com/questions/13692/prevent-focusgained-autocmd-running-in-command-line-editing-mode
    autocmd FocusGained,BufEnter,CursorHold,CursorHoldI * if mode() != 'c' | checktime | endif

		" Notification after file change
		" https://vi.stackexchange.com/questions/13091/autocmd-event-for-autoread
    autocmd FileChangedShellPost *
      \ echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None

		" fzf plugin
		let $FZF_DEFAULT_COMMAND = 'ag -g ""'
		nnoremap <M-P> :Ag<CR>
		" nnoremap <M-p> :GFiles --exclude-standard --cached --others<CR>
		nnoremap <M-p> :Files<CR>
			function! s:copy_results(lines)
					let joined_lines = join(a:lines, "\n")
					if len(a:lines) > 1
							let joined_lines .= "\n"
					endif
					let @+ = joined_lines
			endfunction
			let g:fzf_action = {
									\ 'ctrl-t': 'tab split',
									\ 'ctrl-s': 'split',
									\ 'ctrl-v': 'vsplit',
									\ 'ctrl-o': function('s:copy_results'),
									\ }

" Enable autocompletion:
	set wildmode=longest,list,full

" Disables automatic commenting on newline:
	autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Splits open at the bottom and right, which is non-retarded, unlike vim defaults.
	set splitbelow splitright


" Shortcutting split navigation, saving a keypress:
	map <C-h> <C-w>h
	map <C-j> <C-w>j
	map <C-k> <C-w>k
	map <C-l> <C-w>l

" Replace all is aliased to S.
	nnoremap S :%s//g<Left><Left>

" Ensure files are read as what I want:
	let g:vimwiki_ext2syntax = {'.Rmd': 'markdown', '.rmd': 'markdown','.md': 'markdown', '.markdown': 'markdown', '.mdown': 'markdown'}
	let g:vimwiki_list = [{'path': '~/vimwiki', 'syntax': 'markdown', 'ext': '.md'}]
	autocmd BufRead,BufNewFile /tmp/calcurse*,~/.calcurse/notes/* set filetype=markdown
	autocmd BufRead,BufNewFile *.ms,*.me,*.mom,*.man set filetype=groff
	autocmd BufRead,BufNewFile *.tex set filetype=tex

" Automatically deletes all trailing whitespace on save.
	autocmd BufWritePre * %s/\s\+$//e

" When shortcut files are updated, renew bash and vifm configs with new material:
	autocmd BufWritePost ~/.config/bmdirs,~/.config/bmfiles !shortcuts

" Update binds when sxhkdrc is updated.
	autocmd BufWritePost *sxhkdrc !pkill -USR1 sxhkd

" Run xrdb whenever Xdefaults or Xresources are updated.
	autocmd BufWritePost *Xresources,*Xdefaults !xrdb %

" == AUTOCMD ================================
" by default .ts file are not identified as typescript and .tsx files are not
" identified as typescript react file, so add following
au BufNewFile,BufRead *.ts setlocal filetype=typescript
au BufNewFile,BufRead *.tsx setlocal filetype=typescript.tsx
" == AUTOCMD END ================================

" Navigating with guides
	" vnoremap <leader><leader> <Esc>/<++><Enter>"_c4l
	" map <leader><leader> <Esc>/<++><Enter>"_c4l

" Save file as sudo on files that require root permission
	cnoremap w!! execute 'silent! write !sudo tee % >/dev/null' <bar> edit!

" Turns off highlighting on the bits of code that are changed,
" so the line that is changed is highlighted but the actual text
" that has changed stands out on the line and is readable.
if &diff
    highlight! link DiffText MatchParen
endif

" Easymotion
let g:EasyMotion_do_mapping = 0 " Disable default mappings
hi link EasyMotionTarget ErrorMsg
hi link EasyMotionShade  Comment

" Jump to anywhere you want with minimal keystrokes, with just one key binding.
" `s{char}{label}`
nmap <Leader><Leader>s <Plug>(easymotion-overwin-f2)
nmap <Leader><Leader>/ <Plug>(easymotion-sn)
nmap <Leader>j <Plug>(easymotion-j)
nmap <Leader>k <Plug>(easymotion-k)


" Turn on case-insensitive feature
let g:EasyMotion_smartcase = 1

let g:yats_host_keyword = 1
