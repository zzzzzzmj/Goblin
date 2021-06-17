#! /bin/bash

set -e

echo "Backup config file > ~/.backup"
mkdir -p ~/.backup
[ -f ~/.zshrc ] && mv ~/.zshrc ~/.backup/
[ -f ~/.tmux.conf ] && mv ~/.tmux.conf ~/.backup/
[ -f ~/.profile ] && mv ~/.profile ~/.backup/
[ -f ~/.gitconfig ] && mv ~/.gitconfig ~/.backup/
[ -f ~/.ideavimrc ] && mv ~/.ideavimrc ~/.backup/
[ -f ~/.p10k.zsh ] && mv ~/.p10k.zsh ~/.backup/

echo "Installing"
ln -s zshrc ~/.zshrc
ln -s tmux.conf ~/.tmux.conf
ln -s profile ~/.profile
ln -s gitconfig ~/.gitconfig
ln -s ideavimrc ~/.ideavimrc
ln -s p10k.zsh ~/.p10k.zsh

echo "Install Done!"
