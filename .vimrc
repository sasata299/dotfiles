
" vi互換OFF(vimの独自拡張機能も使うため)
set nocompatible

"set ambiwidth=double

let g:github_user  = "sasata299"
let g:github_token = "xxxxxxxxx"

let twitvim_login = "sasata299:xxxxxxxxx"
let twitvim_count = 100

syntax on
filetype plugin indent on

" # の行で改行したときなどに # をつけないように
autocmd FileType * setlocal formatoptions-=r
autocmd FileType * setlocal formatoptions-=o

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
set smartcase
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
set directory-=.

" 対応する括弧のやつが邪魔なのでこれで消しとく
let g:loaded_matchparen = 1

" 編集中のファイルのファイル名を変更
command! -nargs=1 -complete=file Rename f <args>|call delete(expand('#'))

augroup SkeletonAu
    autocmd!
    autocmd BufNewFile *.pl 0r $HOME/.vim/template/skel.pl
    autocmd BufNewFile *.PL 0r $HOME/.vim/template/skel.PL
    autocmd BufNewFile *.t 0r $HOME/.vim/template/skel.t
    autocmd BufNewFile *.html 0r $HOME/.vim/template/skel.html
augroup END

" for Java
let java_highlight_all=1
let java_highlight_function="style"
let java_allow_cpp_keywords=1

" autocomplpop.vim の設定
autocmd FileType perl :set dictionary=/usr/share/vim/vim72/syntax/perl.vim
autocmd FileType ruby :set dictionary=/usr/share/vim/vim72/syntax/ruby.vim
autocmd FileType java :set dictionary=/usr/share/vim/vim72/syntax/java.vim
autocmd FileType html :set dictionary=/usr/share/vim/vim72/syntax/html.vim
autocmd FileType javascript :set dictionary=/usr/share/vim/vim71/syntax/javascript.vim
highlight Pmenu ctermbg=8 ctermfg=6
highlight PmenuSel ctermbg=4 ctermfg=2
highlight PmenuSbar ctermbg=4
"highlight Pmenu ctermbg=7 ctermfg=7
"highlight PmenuSel ctermbg=2 ctermfg=7
"highlight PmenuSbar ctermbg=2


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
set encoding=utf8
set fileencodings=utf8,euc-jp,cp932,sjis
set laststatus=2
set statusline=%<%f\%=\%m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}[line:%l][%p%%]
hi StatusLine term=NONE cterm=NONE ctermfg=white ctermbg=red

autocmd FileType xml  imap <BUFFER> << </<C-x><C-o>
autocmd FileType html imap <BUFFER> << </<C-x><C-o>
autocmd FileType perl :map <C-n> <ESC>:!perl -cw %<CR>
autocmd FileType perl :map <C-e> <ESC>:!perl %<CR>
autocmd FileType ruby :map <C-n> <ESC>:!ruby -cW %<CR>
autocmd FileType ruby :map <C-e> <ESC>:!ruby %<CR>
autocmd FileType ruby setlocal ts=2 sw=2 sts=0 

" 画面分割したときに、サイズを自動調整
nmap <C-w>w <C-w>w:call <SID>good_width()<CR>
function! s:good_width()
  "if winheight(0) < 40
  "  resize 40
  if winwidth(0) < 80
    vertical resize 80
  endif
endfunction

" normal mode
nmap j gj
nmap k gk
nmap ; :
nmap U <C-r>
nmap T dt
nmap t ct
nmap tt yiw
nmap O :<C-u>call append(expand('.'), '')<CR>j
nmap <space>, :<C-u>edit $MYVIMRC<CR>
nmap <C-p> q:k<CR>
nmap Y y$

" visual mode
vmap j gj
vmap k gk
vmap ; :

" 選択範囲のみ検索
vmap / /\%V
vmap ? ?\%V 

" command mode
cmap qq q!
cmap AA Align=

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

