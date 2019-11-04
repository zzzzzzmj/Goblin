# pyenv
if command -v pyenv 1>/dev/null 2>&1; then
 eval eval "$(pyenv init -)"
fi

export PYTHON_CONFIGURE_OPTS="--enable-framework"
export PATH="$PYTHON_CONFIGURE_OPTS:$HOME/.pyenv/bin:$PATH"

# GO
export GOPATH="$HOME/go"
export PATH="$PATH:$GOROOT/bin:$GOPATH/bin"

export GO111MODULE=on
export GOPROXY=https://goproxy.cn
