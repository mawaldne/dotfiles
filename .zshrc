# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="robbyrussell"

# Note - hub is currently a hack...See: https://github.com/github/hub/issues/231
plugins=(git hub)

source $ZSH/oh-my-zsh.sh
source $HOME/.profile

# Make history files large and shared over multiple sessions
export HISTFILE=~/.zsh_history
export HISTCONTROL=ignoredups:erasedups  # no duplicate entries
export HISTSIZE=100000                   # big big history
export HISTFILESIZE=100000               # big big history
setopt HISTAPPEND HIST_IGNORE_SPACE HIST_REDUCE_BLANKS HIST_VERIFY HIST_IGNORE_ALL_DUPS HIST_IGNORE_DUPS SHARE_HISTORY INC_APPEND_HISTORY EXTENDED_HISTORY

# Add coloring to man pages
# Source: https://wiki.archlinux.org/index.php/man_page#Colored_man_pages
man() {
    env LESS_TERMCAP_mb=$'\E[01;31m' \
    LESS_TERMCAP_md=$'\E[01;38;5;74m' \
    LESS_TERMCAP_me=$'\E[0m' \
    LESS_TERMCAP_ue=$'\E[0m' \
    LESS_TERMCAP_us=$'\E[04;38;5;146m' \
    man "$@"
}

# How to keep git log and less output on the screen
# http://sebgoo.blogspot.ca/2014/02/how-to-keep-git-log-and-less-output-on.html
export LESS=-iXFR

bindkey '^R' history-incremental-search-backward

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting