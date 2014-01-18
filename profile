PS1="\[\033[G\]$PS1"

export PATH=/opt/local/bin:/usr/local/bin:$PATH
export PATH=$(brew --prefix ruby)/bin:$PATH

alias l='ls'
alias ll='ls -lah'
alias rmlogs="find /web/ -regex '.*\.log\.[0-9]*$' -exec rm -vf {} \;"
alias touchlogs="find /web/ -regex '.*\.log$' -exec rm -vf {} \; -exec touch {} \;"
alias f="find . -name"

alias projects="cd ~/projects"
alias rman="cd ~/Devel/git/rman"
alias vtx="cd ~/Devel/git/vtx"
alias vogogo="cd ~/Devel/git/vogogo"

# MacVim
#alias vim='/Applications/MacVim.app/Contents/MacOS/Vim -g'
alias vim='echo "NO! Use Emacs"'

# emacs

#Run command in subshell to silence job control message
e () {
      (/Applications/Emacs.app/Contents/MacOS/Emacs "$@" &) 
}
et () {
      /Applications/Emacs.app/Contents/MacOS/Emacs -nw "$@" 
}
alias emacsclient='/Applications/Emacs.app/Contents/MacOS/bin/emacsclient -n -q'
ec() {
     (emacsclient "$@" &)
}


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
export HISTFILESIZE=
export HISTSIZE=

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

