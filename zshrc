export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME='robbyrussell'

plugins=(
  git
  vi-mode
)

source $ZSH/oh-my-zsh.sh

set -i vi
export EDITOR='vim'

source ~/.bash_profile
source ~/.profile
