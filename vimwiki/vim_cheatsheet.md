* nnoremap <M-]> :vsplit<CR>
* nnoremap <silent> <Leader>= :exe "vertical resize +5"<CR>
* nnoremap <silent> <Leader>- :exe "vertical resize -5"<CR>
* map <M-P> :FZF<CR>
* map <M-f> :Goyo \| set bg=light \| set linebreak<CR>
* html inoremap ,b <b></b><Space><++><Esc>FbT>i
* html inoremap ,it <em></em><Space><++><Esc>FeT>i
* html inoremap ,1 <h1></h1><Enter><Enter><++><Esc>2kf<i
* html inoremap ,2 <h2></h2><Enter><Enter><++><Esc>2kf<i
* html inoremap ,3 <h3></h3><Enter><Enter><++><Esc>2kf<i
* html inoremap ,p <p></p><Enter><Enter><++><Esc>02kf>a
* html inoremap ,a <a<Space>href=""><++></a><Space><++><Esc>14hi
* html inoremap ,e <a<Space>target="_blank"<Space>href=""><++></a><Space><++><Esc>14hi
* html inoremap ,ul <ul><Enter><li></li><Enter></ul><Enter><Enter><++><Esc>03kf<i
* html inoremap ,li <Esc>o<li></li><Esc>F>a
* html inoremap ,ol <ol><Enter><li></li><Enter></ol><Enter><Enter><++><Esc>03kf<i
* html inoremap ,im <img src="" alt="<++>"><++><esc>Fcf"a
* html inoremap ,td <td></td><++><Esc>Fdcit
* html inoremap ,tr <tr></tr><Enter><++><Esc>kf<i
* html inoremap ,th <th></th><++><Esc>Fhcit
* html inoremap ,tab <table><Enter></table><Esc>O
* html inoremap ,gr <font color="green"></font><Esc>F>a
* html inoremap ,rd <font color="red"></font><Esc>F>a
* html inoremap ,yl <font color="yellow"></font><Esc>F>a
* html inoremap ,dt <dt></dt><Enter><dd><++></dd><Enter><++><esc>2kcit
* html inoremap ,dl <dl><Enter><Enter></dl><enter><enter><++><esc>3kcc
* html inoremap &<space> &amp;<space>
* html inoremap á &aacute;
* html inoremap é &eacute;
* html inoremap í &iacute;
* html inoremap ó &oacute;
* html inoremap ú &uacute;
* html inoremap ä &auml;
* html inoremap ë &euml;
* html inoremap ï &iuml;
* html inoremap ö &ouml;
* html inoremap ü &uuml;
* html inoremap ã &atilde;
* html inoremap ẽ &etilde;
* html inoremap ĩ &itilde;
* html inoremap õ &otilde;
* html inoremap ũ &utilde;
* html inoremap ñ &ntilde;
* html inoremap à &agrave;
* html inoremap è &egrave;
* html inoremap ì &igrave;
* html inoremap ò &ograve;
* html inoremap ù &ugrave;

Surround.vim is all about "surroundings": parentheses, brackets, quotes,
XML tags, and more.  The plugin provides mappings to easily delete,
change and add such surroundings in pairs.

It's easiest to explain with examples.  Press `cs"'` inside

"Hello world!" to change it to 'Hello world!'

Now press `cs'<q>` to change it to <q>Hello world!</q>

To go full circle, press `cst"` to get "Hello world!"

To remove the delimiters entirely, press s"`. Hello world!

Now with the cursor on "Hello", press `ysiw]` (ìwìs a text object). [Hello] world!

Letś make that braces and add some space (use `}ìnstead of `{`for no space): `cs]{` { Hello } world!

Now wrap the entire line in parentheses with `yssbòr `yss)`. ({ Hello } world!)

Revert to the original text: s{ds)` Hello world!

Emphasize hello: `ysiw<em>`

<em>Hello</em> world!

Finally, let's try out visual mode. Press a capital V (for linewise visual mode) followed by `S<p class="important">`.

<p class="important">
<em>Hello</em> world!
</p>
