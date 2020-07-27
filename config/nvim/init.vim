set nocompatible

let mapleader =" "

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
call plug#end()

" Some basics:
    set regexpengine=1
    set go=a
    set mouse=a
    set nohlsearch

    set clipboard=unnamedplus
    set clipboard+=unnamedplus

    set scrolloff=10
    set smartindent
    set breakindent
    set smartcase

    filetype plugin on
    filetype indent on
    syntax enable

    set lazyredraw

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
    nnoremap <M-]> :vsplit<CR>

    nnoremap <silent> <Leader>+ :exe "vertical resize +30"<CR>
    nnoremap <silent> <Leader>- :exe "vertical resize -30"<CR>
    let g:NERDTreeWinSize=70

    set updatetime=50
    set timeoutlen=1000
    set ttimeoutlen=0

" Tab config
	noremap <M-1> 1gt
	noremap <M-2> 2gt
	noremap <M-3> 3gt
	noremap <M-4> 4gt
	noremap <M-5> 5gt
	noremap <M-6> 6gt
	noremap <M-7> 7gt
	noremap <M-8> 8gt
	noremap <M-9> 9gt
	noremap <M-0> :tablast<cr>

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

augroup twig_ft
  au!
  autocmd BufNewFile,BufRead *.html.twig   set syntax=html
augroup END

" Triger `autoread` when files changes on disk
" https://unix.stackexchange.com/questions/149209/refresh-changed-content-of-file-opened-in-vim/383044#383044
" https://vi.stackexchange.com/questions/13692/prevent-focusgained-autocmd-running-in-command-line-editing-mode
    autocmd FocusGained,BufEnter,CursorHold,CursorHoldI * if mode() != 'c' | checktime | endif

" Notification after file change
" https://vi.stackexchange.com/questions/13091/autocmd-event-for-autoread
    autocmd FileChangedShellPost *
      \ echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None

" fzf plugin
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
                \ 'ctrl-x': 'split',
                \ 'ctrl-v': 'vsplit',
                \ 'ctrl-o': function('s:copy_results'),
                \ }

" Enable autocompletion:
	set wildmode=longest,list,full

" Disables automatic commenting on newline:
	autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Splits open at the bottom and right, which is non-retarded, unlike vim defaults.
	set splitbelow splitright

" Nerd tree
	nnoremap <M-n> :NERDTreeToggle<CR>
	nnoremap <leader>n :NERDTreeFind<CR>
	autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
    if has('nvim')
        let NERDTreeBookmarksFile = stdpath('data') . '/NERDTreeBookmarks'
    else
        let NERDTreeBookmarksFile = '~/.vim' . '/NERDTreeBookmarks'
    endif

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

" Navigating with guides
	vnoremap <leader><leader> <Esc>/<++><Enter>"_c4l
	map <leader><leader> <Esc>/<++><Enter>"_c4l

" Save file as sudo on files that require root permission
	cnoremap w!! execute 'silent! write !sudo tee % >/dev/null' <bar> edit!

" Turns off highlighting on the bits of code that are changed,
" so the line that is changed is highlighted but the actual text
" that has changed stands out on the line and is readable.
if &diff
    highlight! link DiffText MatchParen
endif

