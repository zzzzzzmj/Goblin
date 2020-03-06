#If you come from bash you might have to change your $PATH
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="${HOME}/.oh-my-zsh"

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME='robbyrussell'

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  vi-mode
  zsh-autosuggestions
  zsh-syntax-highlighting
  git
  z
)

set -o vi
source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export TERM=xterm-256color

# pyenv
if command -v pyenv 1>/dev/null 2>&1; then
 eval eval "$(pyenv init -)"
fi

export PYTHON_CONFIGURE_OPTS="--enable-framework"
export PATH="$PYTHON_CONFIGURE_OPTS:$HOME/.pyenv/bin:$PATH"

# go
export GOPATH="$HOME/go-base"
export PATH="${GOPATH}:${GOPATH}/bin:${GOROOT}:${GOROOT}/bin:${PATH}"
export GO111MODULE=on
export GOPROXY='https://goproxy.cn'

# fzf
[-f ~/.fzf/shell/key-bindings.zsh] && source ~/.fzf/shell/key-bindings.zsh
bindkey '^T' fzf-file-widget
export FZF_DEFAULT_COMMAND="fd --exclude={'env,.git,.vscode,.idea,node_moudles'} --type f --hidden --follow"
export FZF_DEFAULT_OPTS="--height 40% --layout=reverse --border"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# alias
[ -f ~/.aliases ] && source ~/.aliases
[ -f ~/.profile ] && source ~/.profile
[ -f ~/.bash_profile ] && source ~/.bash_profile
