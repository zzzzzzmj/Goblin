#! /bin/bash

set -e

echo "Backup config file > ~/.backup"
mkdir -p ~/.backup
[ -f ~/.zshrc ] && cp ~/.zshrc ~/.backup/
[ -f ~/.profile ] && cp ~/.profile ~/.backup/
[ -f ~/.gitconfig ] && cp ~/.gitconfig ~/.backup/
[ -f ~/.ideavimrc ] && cp ~/.ideavimrc ~/.backup/
[ -f ~/.p10k.zsh ] && cp ~/.p10k.zsh ~/.backup/

echo "Installing"
ln -s zshrc ~/.zshrc
ln -s profile ~/.profile
ln -s gitconfig ~/.gitconfig
ln -s ideavimrc ~/.ideavimrc
ln -s p10k.zsh ~/.p10k.zsh

echo "Install Done!"
