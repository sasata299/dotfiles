" vi互換OFF(vimの独自拡張機能も使うため)
set nocompatible

filetype plugin indent on

" https://github.com/junegunn/vim-plug
call plug#begin('~/.vim/plugged')
Plug 'Shougo/neocomplcache'
Plug 'tpope/vim-surround'
Plug 'altercation/vim-colors-solarized'
call plug#end()

" vimをsolarizedにする
syntax enable
set background=dark
colorscheme solarized

" neocomplcache
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_smart_case = 1
let g:neocomplcache_enable_underbar_completion = 1
"let g:neocomplcache_min_syntax_length = 3
highlight Pmenu ctermbg=8 ctermfg=6
highlight PmenuSel ctermbg=4 ctermfg=2
highlight PmenuSbar ctermbg=4

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
"set tabstop=4
"set shiftwidth=4
"set softtabstop=0
set smartindent
set history=50
set backspace=indent,eol,start
set hlsearch
set directory-=.

" 対応する括弧のやつが邪魔なのでこれで消しとく
let g:loaded_matchparen = 1

" 編集中のファイルのファイル名を変更
command! -nargs=1 -complete=file Rename f <args>|call delete(expand('#'))

" rails.vim の設定
let g:rails_level=4
let g:rails_default_file="app/controllers/application.rb"
let g:rails_default_database="mysql"

" surround.vim の設定
let g:surround_103 = "('\r')"  " 103 = g
let g:surround_71 = "(\"\r\")" " 71 = G

" ステータスラインの設定
set encoding=utf8
set fileencodings=utf8,euc-jp,cp932,sjis
set laststatus=2
set statusline=%<%f\%=\%m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}[line:%l][%p%%]
hi StatusLine term=NONE cterm=NONE ctermfg=white ctermbg=red

autocmd FileType xml  imap <BUFFER> << </<C-x><C-o>
"autocmd FileType html imap <BUFFER> << </<C-x><C-o>
autocmd FileType html setlocal includeexpr=substitute(v:fname,'^\\/','','') | setlocal path+=;/
autocmd FileType perl :map <C-n> <ESC>:!perl -cw %<CR>
autocmd FileType perl :map <C-e> <ESC>:!perl %<CR>
autocmd FileType ruby :map <C-n> <ESC>:!ruby -cW %<CR>
autocmd FileType ruby :map <C-e> <ESC>:!ruby %<CR>
autocmd FileType ruby :map <C-t> <ESC>:!bundle exec rake spec SPEC=%:p<CR>
autocmd FileType ruby setlocal ts=2 sw=2 sts=0

" jBuilder
au BufNewFile,BufRead *.jbuilder set filetype=ruby

" CoffeeScript
au BufRead,BufNewFile,BufReadPre *.coffee set filetype=coffee
autocmd FileType coffee setlocal sw=2 sts=2 ts=2 et

let g:indent_guides_start_level=2
let g:indent_guides_auto_colors=0
let g:indent_guides_enable_on_vim_startup=0
let g:indent_guides_color_change_percent=20
let g:indent_guides_guide_size=1
let g:indent_guides_space_guides=1

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

" tab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set smarttab
imap <C-Tab> <C-V><Tab>

" pattern match
syntax match MainTitle   '^#[^\#]*$'
syntax match HeadLine    '^##[^\#]*$'
syntax match SubTitle    '^###[^\#]*$'
syntax match Code        '^!!!command'
syntax match Code        '^!!!code'
syntax match Chart       '^!!!表.*$'
syntax match Figure      '^!!!図.*$'
syntax match Figure      '^!!!キャプチャ.*$'
syntax match Code        '^!!!TODO: '

" highlight link
highlight link MainTitle   ErrorMsg
highlight link HeadLine    LineNr
highlight link SubTitle    Title
highlight link SubSubTitle NonText
highlight link Code        Search
highlight link Chart       DiffAdd
highlight link Figure      DiffAdd

function StripTrailingWhitespaces()
  let pos = getpos(".")
  %s/\s\+$//e
  call setpos(".", pos)
endfunction
autocmd BufWritePre * :call StripTrailingWhitespaces()

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

