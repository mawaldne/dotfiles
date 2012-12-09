PS1="\[\033[G\]$PS1"

alias l='ls'
alias ll='ls -lah'
alias rmlogs="find /web/ -regex '.*\.log\.[0-9]*$' -exec rm -vf {} \;"
alias touchlogs="find /web/ -regex '.*\.log$' -exec rm -vf {} \; -exec touch {} \;"
alias f="find . -name"

# MacVim
export VIM_APP_DIR=/Applications/MacVim-7_3-53
alias vim='macvim'

#Emacs App
alias emacs='/Applications/MacPorts/Emacs.app/Contents/MacOS/Emacs'
alias emacsclient='/Applications/MacPorts/Emacs.app/Contents/MacOS/bin/emacsclient'

#git
alias ga='git add'
alias gpush='git push'
alias gl='git log'
alias gf='git fetch'
alias gs='git status'
alias gd='git diff'
alias gm='git commit -m'
alias gma='git commit -am'
alias gb='git branch'
alias gc='git checkout'
alias gra='git remote add'
alias grr='git remote rm'
alias gpull='git pull'
alias gcl='git clone'


#USE CONTROL L
alias clear='echo "NO!"'

ulimit -n 1024

#history increase
export HISTSIZE=10000
export HISTFILESIZE=10000

function gitclone() { git clone gblscms:/home/git/"$1" --recursive ;}

