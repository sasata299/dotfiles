
# Ctrl+w で､直前の / までを削除する
WORDCHARS='*?_-.[]~=&;!#$%^(){}<>'

# プロンプトの設定
setopt prompt_subst
autoload colors
colors
PROMPT="%{${fg[green]}%}[%n@%m] %(!.#.$) %{${reset_color}%}"
RPROMPT="%{${fg[green]}%}[%~]%{${reset_color}%}"

export LANG=ja_JP.UTF8
export PATH=$PATH:/usr/local/mysql/bin:$HOME/bin:/usr/local/libexec:$JAVA_HOME/bin
export SVN_EDITOR=vim
export JAVA_HOME=/usr/local/java
export CLASSPATH=.:$JAVA_HOME/lib/tools.jar:$JAVA_HOME/lig/dt.jar
export GREP_COLOR='01;33'
export GREP_OPTIONS='--color=auto'
export RSPEC=true

# これを設定しとけば、デフォルトでこのsocketを使うようになる
#export MYSQL_UNIX_PORT=/usr/local/mysql/mysql.sock

alias cp="cp -iv"
alias mv="mv -iv"
alias rm="rm -iv"
alias vi=vim
alias ack="ack --group --color"
alias c=clear
alias s=screen
alias ll="ls -hl"
alias du='du -h'
alias df='df -h'
alias ps='ps aux'
alias diff='diff -u'
alias top='top -c'
alias prove='prove -v --lib'
alias re=refe
alias spec='spec -cfs'
alias ctags="ctags -f ~/.tags -R"
alias doc="perldoc -l"
alias -g L="| less"
alias -g A="| lv -c"
alias -g G="| grep -E"

# -R は読み込み専用。- は標準入力からの読み込み
alias -g V="| vi -R -"

setopt no_flow_control
setopt complete_aliases

# ファイル名で ~, ^, # を正規表現として扱う
setopt extendedglob

# history 関係
HISTFILE=$HOME/.zsh-history
HISTSIZE=100000
SAVEHIST=100000
setopt share_history
setopt HIST_IGNORE_SPACE
setopt hist_ignore_all_dups
setopt hist_no_store
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
eval `dircolors`
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
    ll;
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

