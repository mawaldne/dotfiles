PS1="\[\033[G\]$PS1"

export PATH=/opt/local/bin:/usr/local/bin:$PATH
export PATH=$(brew --prefix ruby)/bin:$PATH

alias l='ls'
alias ll='ls -lah'
alias rmlogs="find /web/ -regex '.*\.log\.[0-9]*$' -exec rm -vf {} \;"
alias touchlogs="find /web/ -regex '.*\.log$' -exec rm -vf {} \; -exec touch {} \;"
alias f="find . -name"

alias ecs="cd /web/git/ecs"
alias wxs="cd /web/git/wxs"
alias infra="cd /web/git/infra"
alias projects="cd ~/projects"

# MacVim
#alias vim='/Applications/MacVim.app/Contents/MacOS/Vim -g'
alias vim='echo "NO! Use Emacs"'

# emacs
alias emacs='open -a /Applications/Emacs.app $1'
alias emacsclient='/Applications/Emacs.app/Contents/MacOS/bin/emacsclient'
alias ec='emacsclient -c -a emacs $1 &'

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

export GRADLE_OPTS="-Xmx2g -XX:MaxPermSize=756m"
export JAVA_OPTS="-XX:MaxPermSize=256m -Xmx3g"


if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi

#Python
export PATH=$PATH:/usr/local/share/python
export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/Devel
export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python2.7
export VIRTUALENVWRAPPER_VIRTUALENV_ARGS='--no-site-packages'
export PIP_VIRTUALENV_BASE=$WORKON_HOME
export PIP_RESPECT_VIRTUALENV=true
if [[ -r /usr/local/bin/virtualenvwrapper.sh ]]; then
    source /usr/local/bin/virtualenvwrapper.sh
else
    echo "WARNING: Can't find virtualenvwrapper.sh"
fi

