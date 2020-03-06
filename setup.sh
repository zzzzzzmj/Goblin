#! /usr/bin/ bash

set -e

echo 'Installing'

curl -fsSL https://raw.githubusercontent.com/Ackerr/dotfiles/master/zshrc > ~/.zshrc
curl -fsSL https://raw.githubusercontent.com/Ackerr/dotfiles/master/tmux.conf > ~/.tmux.conf
curl -fsSL https://raw.githubusercontent.com/Ackerr/dotfiles/master/profile > ~/.profile
curl -fsSL https://raw.githubusercontent.com/Ackerr/dotfiles/master/gitconfig > ~/.gitconfig
curl -fsSL https://raw.githubusercontent.com/Ackerr/dotfiles/master/ideavimrc > ~/.ideavimrc

echo 'vim plugin install'
curl -fsSL https://raw.githubusercontent.com/Ackerr/dotfiles/master/vim > ~/.vim
ln -sf ~/.vim/vimrc ~/.vimrc
vim +PlugInstall +qall

echo 'Install Done!'
