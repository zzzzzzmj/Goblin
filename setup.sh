#! /usr/bin/ bash

set -e

echo 'Installing'

curl -fsSL https://raw.githubusercontent.com/zzzzzzmj/Goblin/master/.tmux.conf > ~/.tmux.conf 
curl -fsSL https://raw.githubusercontent.com/zzzzzzmj/Goblin/master/.profile > ~/.profile
#  curl -fsSL https://raw.githubusercontent.com/zzzzzzmj/Goblin/master/.vimrc > ~/.vimrc
curl -fsSL https://raw.githubusercontent.com/zzzzzzmj/Goblin/master/.gitconfig > ~/.gitconfig 

echo 'Install Done!'
