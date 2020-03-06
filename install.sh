#! /bin/bash

set -e

echo 'Backup config file > ~/.backup'
mkdir -p ~/.backup
[ -f ~/.zshrc ] && cp ~/.zshrc ~/.backup/
[ -f ~/.tmux.conf ] && cp ~/.tmux.conf ~/.backup/
[ -f ~/.profile ] && cp ~/.profile ~/.backup/
[ -f ~/.gitconfig ] && cp ~/.gitconfig ~/.backup/
[ -f ~/.ideavimrc ] && cp ~/.ideavimrc ~/.backup/

echo 'Installing'
[ -f ~/.zshrc ] && cp zshrc > ~/.zshrc
[ -f ~/.tmux.conf ] && cp tmux.conf > ~/.tmux.conf
cp profile ~/.profile
cp gitconfig ~/.gitconfig
cp ideavimrc ~/.ideavimrc

if read -t 5 -p "(*^▽^*) Would you want to use my vimrc [Y/N]?" is_install; then
    case "$is_install" in
        [Yy]* )
            [ -f ~/.vimrc ] && cp ~/.vimrc ~/.backup/
            if [ -d ~/.vim ] && [! -f ~/.vim/autoload/plug.vim ]; then
                cp vim/autoload/plug.vim ~/.vim/autoload/plug.vim
                cp vim/coc-settings.json ~/.vim/coc-settings.json
            fi
            cp vimrc ~/.vimrc
            echo 'Vim plugin installing...'
            vim +PlugInstall +qall
            echo 'Vim plugin install Done!';;
    esac
else
    echo ""
fi

echo 'Install Done!'
