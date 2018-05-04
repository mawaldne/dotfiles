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

export PATH=$(brew --prefix)/bin:$PATH

eval "$(rbenv init -)"

# nvm
# NVM is very slow to load and makes opening bash terminals painful.
# Lazy load on the first run of node or npm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" --no-use # This loads nvm

alias node='unalias node ; unalias npm ; nvm use default ; node $@'
alias npm='unalias node ; unalias npm ; nvm use default ; npm $@'
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/mawaldne/google-cloud-sdk/path.zsh.inc' ]; then source '/Users/mawaldne/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/mawaldne/google-cloud-sdk/completion.zsh.inc' ]; then source '/Users/mawaldne/google-cloud-sdk/completion.zsh.inc'; fi

export PATH="~/.pyenv/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

