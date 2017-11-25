export PATH=/opt/groovy-1.7.8/bin:/opt/grails-1.3.7/bin:/opt/local/bin:/usr/local/bin:$PATH
export PATH=$(brew --prefix ruby)/bin:$PATH

if [ -f ~/.aliases ]; then
    . ~/.aliases
fi

ulimit -n 1024

export GRADLE_OPTS="-Xmx2g -XX:MaxPermSize=756m"
export JAVA_OPTS="-XX:MaxPermSize=256m -Xmx3g"

export EDITOR=vim

# GO
export GOPATH="$HOME/work"
export PATH=$PATH:$GOPATH/bin

#Rust
export PATH="$HOME/.cargo/bin:$PATH"
export RUST_SRC_PATH="$(rustc --print sysroot)/lib/rustlib/src/rust/src"

