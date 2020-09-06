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
cp zshrc ~/.zshrc
cp profile ~/.profile
cp gitconfig ~/.gitconfig
cp ideavimrc ~/.ideavimrc
cp p10k.zsh ~/.p10k.zsh

echo "Install Done!"
