PS1="\[\033[G\]$PS1"

export PATH=/opt/local/bin:/usr/local/bin:$PATH
export PATH=$(brew --prefix ruby)/bin:$PATH

if [ -f ~/.aliases ]; then
    . ~/.aliases
fi

ulimit -n 1024

#history increase
export HISTFILESIZE=
export HISTSIZE=

export GRADLE_OPTS="-Xmx2g -XX:MaxPermSize=756m"
export JAVA_OPTS="-XX:MaxPermSize=256m -Xmx3g"
export ANDROID_SDK_ROOT="/usr/local/Cellar/android-sdk/22.3"


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

source /Users/mawaldne/.rvm/scripts/rvm
