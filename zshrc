# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

#If you come from bash you might have to change your $PATH
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="${HOME}/.oh-my-zsh"
source $ZSH/oh-my-zsh.sh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
# ZSH_THEME='powerlevel10k/powerlevel10k'

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.


# zplug
export ZPLUG_HOME="/usr/local/opt/zplug"
source $ZPLUG_HOME/init.zsh

zplug "zplug/zplug", hook-build:'zplug --self-manage'
zplug "romkatv/powerlevel10k", as:theme, depth:1

zplug "plugins/vi-mode", from:oh-my-zsh
zplug "plugins/z", from:oh-my-zsh

zplug "paulirish/git-open"
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-syntax-highlighting", defer:2
zplug "b4b4r07/zsh-vimode-visual", defer:3

if ! zplug check; then
  zplug install
fi

zplug load

set -o vi
zle_highlight=(region:bg=yellow)  # highlight visual indication of the selected text

# You may need to manually set your language environment
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export TERM=xterm-256color

# pyenv
if command -v pyenv 1>/dev/null 2>&1; then
 eval eval "$(pyenv init -)"
fi

export PATH="$HOME/.pyenv/bin:$PATH"

# go
export GOPATH="$HOME/go-base"
export PATH="${GOPATH}:${GOPATH}/bin:${PATH}"
export GO111MODULE=on
export GOPROXY='https://goproxy.cn,direct'

# pipenv
export PIPENV_VERBOSITY=-1

# fzf
[ -f ~/.fzf/shell/key-bindings.zsh ] && source ~/.fzf/shell/key-bindings.zsh
bindkey '^T' fzf-file-widget
export FZF_DEFAULT_COMMAND="fd --exclude={'env,.git,.vscode,.idea,node_moudles,__pycache__'} --hidden --follow"
export FZF_DEFAULT_OPTS="--height 40% --layout=reverse --border --pointer='▶' --marker='✓' --preview-window=:70%"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND --type f"
export FZF_ALT_C_COMMAND="$FZF_DEFAULT_COMMAND --type d"
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# alias
[ -f ~/.aliases ] && source ~/.aliases
[ -f ~/.profile ] && source ~/.profile
[ -f ~/.bash_profile ] && source ~/.bash_profile

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
