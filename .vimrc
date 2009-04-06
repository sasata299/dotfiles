
" vi互換OFF(vimの独自拡張機能も使うため)
set nocompatible

syntax on
filetype plugin indent on

" 前回開いた場所を記憶する
if has("autocmd")
    autocmd BufReadPost *
    \ if line("'\"") > 0 && line ("'\"") <= line("$") |
    \   exe "normal! g'\"" |
    \ endif
endif

" ファイルを開くたびに、そのファイルのディレクトリに移動する
autocmd BufEnter * execute ":lcd " . expand("%:p:h")

set tags=~/.tags
set ignorecase
set wildmenu
set hidden
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=0
set smartindent
set history=50
set backspace=indent,eol,start
set hlsearch
set ambiwidth=double

augroup SkeletonAu
    autocmd!
    autocmd BufNewFile *.pl 0r $HOME/.vim/template/skel.pl
    autocmd BufNewFile *.pm 0r $HOME/.vim/template/skel.pm
    autocmd BufNewFile *.PL 0r $HOME/.vim/template/skel.PL
    autocmd BufNewFile *.PL 0r $HOME/.vim/template/skel.cgi
    autocmd BufNewFile *.t 0r $HOME/.vim/template/skel.t
    autocmd BufNewFile *.html 0r $HOME/.vim/template/skel.html
augroup END

" ruby のときはタブ幅を2にする
autocmd FileType ruby setlocal ts=2 sw=2 sts=0 

" for Java
let java_highlight_all=1
let java_highlight_function="style"
let java_allow_cpp_keywords=1

" autocomplpop.vim の設定
autocmd FileType perl :set dictionary=/usr/share/vim/vim71/syntax/perl.vim
autocmd FileType ruby :set dictionary=/usr/share/vim/vim71/syntax/ruby.vim
autocmd FileType java :set dictionary=/usr/share/vim/vim71/syntax/java.vim
autocmd FileType html :set dictionary=/usr/share/vim/vim71/syntax/html.vim
autocmd FileType javascript :set dictionary=/usr/share/vim/vim71/syntax/javascript.vim
highlight Pmenu ctermbg=7 ctermfg=7
highlight PmenuSel ctermbg=2 ctermfg=7
highlight PmenuSbar ctermbg=2

" rails.vim の設定
let g:rails_level=4
let g:rails_default_file="app/controllers/application.rb"
let g:rails_default_database="mysql"

" surround.vim の設定
let g:surround_103 = "('\r')"  " 103 = g
let g:surround_71 = "(\"\r\")" " 71 = G

" 括弧を挿入する
nmap gs cs'g
nmap gd cs"G

nmap qds cs"'
nmap qsd cs'"

" ステータスラインの設定
:set encoding=utf8
:set fileencodings=utf8,euc-jp,cp932,sjis
set laststatus=2
set statusline=%<%f\%=\%m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}[line:%l][%p%%]
hi StatusLine term=NONE cterm=NONE ctermfg=white ctermbg=red

autocmd FileType perl :map <C-n> <ESC>:!perl -cw %<CR>
autocmd FileType perl :map <C-e> <ESC>:!perl %<CR>
autocmd FileType ruby :map <C-n> <ESC>:!ruby -cW %<CR>
autocmd FileType ruby :map <C-e> <ESC>:!ruby %<CR>

" normal mode
nmap j gj
nmap k gk
nmap ; :
nmap U <C-r>
nmap T dt
nmap t ct
nmap tt yiw

" visual mode
vmap j gj
vmap k gk
vmap ; :

" 選択範囲のみ検索
vmap / /\%V
vmap ? ?\%V 

" command mode
cmap qq q!

" insert mode(CR = Enter)
imap <C-j> <C-[>
imap <C-k> <C-m>
imap { {}<LEFT>
imap [ []<LEFT>
imap ( ()<LEFT>
imap <C-l> <RIGHT>


" -------------------------------
"  Tips
" -------------------------------
" f? で特定の単語まで移動できる
" dt? で特定の単語まで削除
" 数字の上で Ctrl-a でインクリメント、Crtl-x でデクリメント
" :%s//aaa/ で最後に検索した文字を aaa に置換
" :set fenc=*** でファイルエンコードを変更
" :e ++enc=*** でファイルエンコードを変更して開き直し
" :e! でファイルを開きなおす
" w で単語単位で進む。b で単語単位で戻る。

