source $VIMRUNTIME/macros/matchit.vim

" vi互換OFF(vimの独自拡張機能も使うため)
set nocompatible
filetype off

set rtp+=~/.vim/vundle.git/
call vundle#rc()

"Bundle 'thinca/vim-quickrun'
Bundle 'rails.vim'
Bundle 'surround.vim'
Bundle 'neocomplcache'
Bundle 'snippetsEmu'
Bundle 'ZenCoding.vim'
Bundle 'tpope/vim-fugitive'
Bundle 'kchmck/vim-coffee-script'
Bundle 'claco/jasmine.vim'
Bundle 'nathanaelkane/vim-indent-guides'
Bundle 'slim-template/vim-slim'

syntax on
filetype plugin indent on

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

augroup SkeletonAu
    autocmd!
    autocmd BufNewFile *.pl 0r $HOME/.vim/template/skel.pl
    autocmd BufNewFile *.PL 0r $HOME/.vim/template/skel.PL
    autocmd BufNewFile *.t 0r $HOME/.vim/template/skel.t
"    autocmd BufNewFile *.html 0r $HOME/.vim/template/skel.html
augroup END

" for Java
let java_highlight_all=1
let java_highlight_function="style"
let java_allow_cpp_keywords=1

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

" for Fugitive
nnoremap gd :<C-u>Gdiff<Enter>
nnoremap gs :<C-u>Gstatus<Enter>
nnoremap gl :<C-u>Glog<Enter>
nnoremap ga :<C-u>Gwrite<Enter>
nnoremap gc :<C-u>Gcommit<Enter>
nnoremap gC :<C-u>Git commit --amend<Enter>
nnoremap gb :<C-u>Gblame<Enter>

" pattern match
syntax match MainTitle   '^\*\*\*\*[^\*]*$'
syntax match HeadLine    '^\*\*\*[^\*]*$'
syntax match SubTitle    '^\*\*[^]*]*$'
syntax match SubSubTitle '^\*[^\*]*$'
syntax match Code        '^#code'
syntax match Chart       '^#chart'
syntax match Figure      '^#figure'
syntax match Code        '^TODO: '

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

function! RunSpec()
  let file_path = expand("%:p")
  let line_number = line(".")
  let base_path = "$HOME/.rvm/rubies/ree-1.8.7-2011.03/bin/"
  let gems_path = "$HOME/.rvm/gems/ree-1.8.7-2011.03/bin/"
  let rake_path = "$HOME/.rvm/gems/ree-1.8.7-2011.03/bin/rake"

  execute  ":! " . gems_path . "bundle exec " . rake_path ." spec SPEC='" . file_path . "'" . " SPEC_OPTS='-l " . line_number . "'"

  unlet file_path
  unlet line_number
  unlet base_path
  unlet gems_path
  unlet rake_path
endfunction

nmap gws :call RunSpec()<CR>


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

