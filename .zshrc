eval "$(rbenv init -)"

# Ctrl+w で､直前の / までを削除する
WORDCHARS='*?_-.[]~=&;!#$%^(){}<>'

# プロンプトの設定
setopt prompt_subst
autoload colors
colors
PROMPT="%{${fg[green]}%}[%n@%m] %(!.#.$) %{${reset_color}%}"
RPROMPT="%{${fg[green]}%}[%~]%{${reset_color}%}"

# MySQLのプロンプト
export MYSQL_PS1="${fg[red]}\u \h:\p >${fg[white]} "

export LANG=ja_JP.UTF-8
export PATH=/usr/local/sbin:/usr/local/bin:$PATH
export DISPLAY=:0.0
export SVN_EDITOR=vim
export BUNDLE_EDITOR=vim
#export EDITOR=vim
#export JAVA_HOME=/usr/local/java
#export CLASSPATH=.:$JAVA_HOME/lib/tools.jar:$JAVA_HOME/lig/dt.jar
#export GREP_COLOR='01;33'
export GREP_OPTIONS='--color=auto'
#export GREP_OPTIONS='-Ir --color=auto --exclude-dir=\.svn'
export RSPEC=true
export CLICOLOR=1
#export LS_COLORS="no=00;31:fi=00;37:di=00;36:ln=00;31:ex=00;31"
export LSCOLORS=gxfxcxdxbxegedabagacad

# これを設定しとけば、デフォルトでこのsocketを使うようになる
#export MYSQL_UNIX_PORT=/usr/local/mysql/mysql.sock

alias cp="cp -iv"
alias mv="mv -iv"
alias rm=" rm -iv"
alias vi=vim
#alias e="/Applications/Emacs.app/Contents/MacOS/Emacs"
#alias rails="rails -d mysql"
alias ack="ack --group --color"
alias c=clear
alias s=screen
alias ll="ls -hl"
#alias ll="ls -hl -v --color"
#alias du='du -s -h'
alias df='df -h'
alias ps='ps aux'
alias diff='diff -u'
#alias top='top -c'
alias fs='foreman start'
alias top='top -RFXu'
alias prove='prove -v -r --lib --timer'
alias re=refe
alias spec='spec -cfs'
alias ctags="ctags -f ~/.tags -R"
alias ucode="vim `perl -le 'print grep { -f } map { "$_/unicore/Blocks.txt" } @INC'`"
alias cpan-list="perl -MExtUtils::Installed -le 'print join \"\n\", sort ExtUtils::Installed->new->modules;'"
alias cpan-uninstall='sudo perl -MConfig -MExtUtils::Install -e '"'"'($FULLEXT=shift)=~s{-}{/}g;uninstall "$Config{sitearchexp}/auto/$FULLEXT/.packlist",1'"'"
alias cpan-history="perldoc -tT perllocal"
alias ngrep="ngrep -W byline"
alias gi=git
alias ss='./script/server'
alias -g A="| lv -c"
alias -g L="| less"
alias -g G="| grep -E"
alias commitlist="svn st | awk '\$1 == \"M\" {print \$2}' | ruby -lne 'BEGIN { \$hoge = [] }; \$hoge << \$_; END { puts \$hoge.join(\" \") }'"
#alias commitlist="svn st | awk '\$1 == \"M\" {print \$2}'"

# -R は読み込み専用。- は標準出力からの読み込み
alias -g V="| vi -R -"

setopt no_flow_control
setopt complete_aliases

# 日本語ファイル名を表示可能に
setopt print_eight_bit

# ファイル名で ~, ^, # を正規表現として扱う
setopt extendedglob

# history 関係
HISTFILE=$HOME/.zsh-history
HISTSIZE=100000
SAVEHIST=100000
setopt share_history
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_no_store
setopt hist_reduce_blanks
function history-all { history -E 1 }

# 補完機能
autoload -U compinit
compinit -u
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
setopt auto_menu
setopt auto_cd
setopt auto_pushd
setopt pushd_ignore_dups
setopt magic_equal_subst

# 補完候補を見やすくする
setopt list_types
setopt list_packed
setopt auto_list
zstyle ':completion:*:default' menu select=1
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
#eval `dircolors`
export ZLS_COLORS=$LS_COLORS

# ディレクトリにマッチした場合末尾に / を付加する
setopt mark_dirs
setopt auto_param_slash

# sudo でも補完を使いたい
zstyle ':completion:*:sudo:*' command-path /usr/local/sbin /usr/local/bin /usr/sbin /usr/bin /sbin /bin

# screen で最後に実行したコマンドをタブ名に
preexec () {
    if [ $TERM = "screen" ]; then
    	1="$1 "
        echo -ne "\ek${${(s: :)1}[0]}\e\\"
    fi
}

# 改行のない文字列でも出力する
unsetopt promptcr

# .zshrc.mine があればそれも読み込む
[ -f ~/.zshrc.mine ] && source ~/.zshrc.mine


# gitのブランチ名をPROMPTに表示する
precmd() {
    _update_rprompt;
}
chpwd() {
    _update_rprompt;
    ls;
}
_update_rprompt () {
    GIT_CURRENT_BRANCH=$( git branch &> /dev/null | grep '^\*' | cut -b 3- )

    if [ "`git ls-files 2>/dev/null`" ]; then
        RPROMPT="%{${fg[green]}%}[%~:$GIT_CURRENT_BRANCH]%}%{${reset_color}%}"
    else
        RPROMPT="%{${fg[green]}%}[%~]%{${reset_color}%}"
    fi
}


# --------------------------
#  Tips
# --------------------------
# rm *.o~hoge.o で hoge.o 以外の全ての *.o が削除される
# touch fuga{1..10} で fuga1 から fuga10 までのファイルが生成される
# Ctrl-p で過去の履歴が遡れる(反対は Ctrl-n )
# ls *.(log|aux) で *.log または *.aux のファイルを表示する
# rm **/*.swp で *.swp ファイルを再帰的に削除できる
# rm a* で Tab を押すと、a1 a2 a3 などに展開される
# repeat n echo hoge で echo hoge を n 回繰り返す

