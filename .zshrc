# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="robbyrussell"

plugins=(git)

source $ZSH/oh-my-zsh.sh
source $HOME/.profile

# Make history files large and shared over multiple sessions
export HISTFILE=~/.zsh_history
export HISTCONTROL=ignoredups:erasedups  # no duplicate entries
export HISTSIZE=100000                   # big big history
export HISTFILESIZE=100000               # big big history
setopt HISTAPPEND HIST_IGNORE_SPACE HIST_REDUCE_BLANKS HIST_VERIFY HIST_IGNORE_ALL_DUPS HIST_IGNORE_DUPS SHARE_HISTORY INC_APPEND_HISTORY EXTENDED_HISTORY


# 10ms for key sequences
export KEYTIMEOUT=1

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

#[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
source <(fzf --zsh)
export FZF_DEFAULT_OPTS='--bind ctrl-f:page-down,ctrl-b:page-up'

# Brew path
export PATH=$(brew --prefix)/bin:$(brew --prefix)/sbin:$PATH

# fnm - node management
export PATH=/home/$USER/.fnm:$PATH
eval "$(fnm env --use-on-cd --version-file-strategy=recursive)"

# Go path
export PATH=~/go/bin:$PATH

# Exports required for work. Not checked into zsh
source ~/.zsh_work_exports

# Terminal things for wezterm
source ~/dotfiles/wezterm/.config/wezterm/wezterm.sh

export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# Butler
export PATH=~/Library/Application\ Support/itch/apps/butler:$PATH

