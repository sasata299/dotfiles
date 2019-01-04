eval "$(rbenv init -)"
# eval "$(phpenv init -)"

# Ctrl+w で､直前の / までを削除する
WORDCHARS='*?_-.[]~=&;!#$%^(){}<>'

# プロンプトの設定
setopt prompt_subst
autoload colors
colors
PROMPT="%{${fg[green]}%}%(!.#.$) %{${reset_color}%}"
RPROMPT="%{${fg[green]}%}[%~]%{${reset_color}%}"

if [ -x "`which go`" ]; then
  export GOROOT=`go env GOROOT`
  export GOPATH=$HOME/.go
  export PATH=$PATH:$GOROOT/bin:$GOPATH/bin
fi

# MySQLのプロンプト
export MYSQL_PS1='\u \h:\p > '

export LANG=ja_JP.UTF-8
export PATH=/usr/local/sbin:/usr/local/bin:~/bin:$PATH
export PATH=$HOME/.nodebrew/current/bin:$PATH
export DISPLAY=:0.0
export EDITOR=vim
export GREP_OPTIONS='--color=auto'
export CLICOLOR=1
export LSCOLORS=gxfxcxdxbxegedabagacad

alias cp="cp -iv"
alias mv="mv -iv"
alias rm=" rm -iv"
alias vi=vim
alias gi=git
alias ack="ack --group --color"
alias c=clear
alias s=screen
alias ll="ls -hl"
#alias du='du -s -h'
alias df='df -h'
alias ps='ps aux'
alias diff='diff -u'
alias fs='foreman start'
alias top='top -RFXu'
alias prove='prove -v -r --lib --timer'
alias re=refe
alias spec='spec -cfs'
alias ctags="ctags -f ~/.tags -R"
alias ucode="vim `perl -le 'print grep { -f } map { "$_/unicore/Blocks.txt" } @INC'`"
alias ngrep="ngrep -W byline"
alias -g A="| lv -c"
alias -g L="| less"
alias -g G="| grep -E"

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

# peco + branch
alias -g B='`git branch | peco | sed -e "s/^\*[ ]*//g"`'
alias -g R='`git branch -a | peco | sed -e "s/^\*[ ]*//g"`'

# .zshrc.mine があればそれも読み込む
[ -f ~/.zshrc.mine ] && source ~/.zshrc.mine


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
