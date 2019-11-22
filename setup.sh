#! /usr/bin/ bash

set -e

echo 'Installing'

curl -fsSL https://raw.githubusercontent.com/zzzzzzmj/Goblin/master/zshrc > ~/.zshrc
curl -fsSL https://raw.githubusercontent.com/zzzzzzmj/Goblin/master/tmux.conf > ~/.tmux.conf
curl -fsSL https://raw.githubusercontent.com/zzzzzzmj/Goblin/master/profile > ~/.profile
curl -fsSL https://raw.githubusercontent.com/zzzzzzmj/Goblin/master/bash_profile > ~/.bash_profile
curl -fsSL https://raw.githubusercontent.com/zzzzzzmj/Goblin/master/gitconfig > ~/.gitconfig

curl -fsSL https://raw.githubusercontent.com/zzzzzzmj/Goblin/master/vimrc > ~/.vimrc
curl -fsSL https://raw.githubusercontent.com/zzzzzzmj/Goblin/master/ideavimrc > ~/.ideavimrc

echo 'vim plug'
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
vim +PlugInstall +qall

echo 'Install Done!'
