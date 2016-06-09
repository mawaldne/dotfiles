set -o vi

export PATH=/opt/groovy-1.7.8/bin:/opt/grails-1.3.7/bin:/opt/local/bin:/usr/local/bin:$PATH
export PATH=$(brew --prefix ruby)/bin:$PATH

if [ -f ~/.aliases ]; then
    . ~/.aliases
fi

ulimit -n 1024

export GRADLE_OPTS="-Xmx2g -XX:MaxPermSize=756m"
export JAVA_OPTS="-XX:MaxPermSize=256m -Xmx3g"

export EDITOR=vim

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

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

# GO
export GOPATH="$HOME/work"
export PATH=$PATH:$GOPATH/bin

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
