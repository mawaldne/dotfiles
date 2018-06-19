if [ -f ~/.aliases ]; then
    . ~/.aliases
fi

ulimit -n 1024

#export GRADLE_OPTS="-Xmx2g -XX:MaxPermSize=756m"
#export JAVA_OPTS="-XX:MaxPermSize=256m -Xmx3g"
export JAVA_HOME="/Library/Java/JavaVirtualMachines/jdk1.8.0_112.jdk/Contents/Home"

export EDITOR=vim

# GO
export GOPATH=$HOME/go
export GOBIN=$HOME/go/bin
export PATH=$PATH:$GOPATH/bin

export PATH="$HOME/.cargo/bin:$PATH"
