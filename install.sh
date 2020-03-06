#! /bin/bash

set -e

read -t 3 -p "Install vim [Y/N]?" is_install

echo "$is_install"

echo 'Backup local config file > ~/.backup'
mkdir -p ~/.backup
[ -f ~/.zshrc ] && cp ~/.zshrc ~/.backup/
[ -f ~/.tmux.conf ] && cp ~/.tmux.conf ~/.backup/
[ -f ~/.profile ] && cp ~/.profile ~/.backup/
[ -f ~/.gitconfig ] && cp ~/.gitconfig ~/.backup/
[ -f ~/.ideavimrc ] && cp ~/.ideavimrc ~/.backup/

echo 'Installing'
[ -f ~/.zshrc ] && curl -fsSL https://raw.githubusercontent.com/Ackerr/dotfiles/master/zshrc > ~/.zshrc
[ -f ~/.tmux.conf ] && curl -fsSL https://raw.githubusercontent.com/Ackerr/dotfiles/master/tmux.conf > ~/.tmux.conf
curl -fsSL https://raw.githubusercontent.com/Ackerr/dotfiles/master/profile > ~/.profile
curl -fsSL https://raw.githubusercontent.com/Ackerr/dotfiles/master/gitconfig > ~/.gitconfig
curl -fsSL https://raw.githubusercontent.com/Ackerr/dotfiles/master/ideavimrc > ~/.ideavimrc

if [ "$is_install" in ["Y", "y"] ]; then
    [ -f ~/.vimrc ] && cp ~/.vimrc ~/.backup
    [ -f ~/.vim ] && cp -r ~/.vim ~/.backup
    curl -fsSL https://raw.githubusercontent.com/Ackerr/dotfiles/master/vim > ~/.vim
    cp ~/.vim/vimrc ~/.vimrc
    echo 'Vim plugin installing...'
    vim +PlugInstall +qall
    echo 'Vim plugin install Done!'
fi

echo 'Install Done!'
