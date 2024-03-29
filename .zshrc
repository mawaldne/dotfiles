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

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_OPTS='--bind ctrl-f:page-down,ctrl-b:page-up'

# Brew path
export PATH=$(brew --prefix)/bin:$(brew --prefix)/sbin:$PATH

# Go path
export PATH=$PATH:$(go env GOPATH)/bin

# asdf :( - Turned off
# . /opt/homebrew/opt/asdf/libexec/asdf.sh

# fnm - node management
export PATH=/home/$USER/.fnm:$PATH
eval "$(fnm env --use-on-cd --version-file-strategy=recursive)"

# openjdk
#export PATH="/opt/homebrew/opt/openjdk@8/bin:$PATH"
export PATH="/Library/Java/JavaVirtualMachines/zulu-8.jdk/Contents/Home/bin:$PATH"

# s0
# export SHIFT_POSTGRES_DOCKER_ENABLED=true
# export SHIFT_POSTGRES_DOCKER_PORT=5435
# export SHIFT_PYTHON3_ENABLED=true

# twilio autocomplete setup
#eval
#TWILIO_AC_ZSH_SETUP_PATH=/Users/mawaldne/.twilio-cli/autocomplete/zsh_setup && test -f $TWILIO_AC_ZSH_SETUP_PATH && source $TWILIO_AC_ZSH_SETUP_PATH;

# function kget() {
#     local account=$1
#     aws sso login --profile ${account}_sso
#     export AWS_PROFILE=${account}_sso
#     local cluster_name=${account}
#     aws eks update-kubeconfig --name ${cluster_name} --kubeconfig ~/shift/${cluster_name} --alias ${cluster_name}
#     export KUBECONFIG=~/shift/${cluster_name}
# }

# Exports required for work. Not checked into zsh
source ~/.zsh_work_exports

# Terminal things for wezterm
source ~/new_dotfiles/wezterm/.config/wezterm/wezterm.sh

