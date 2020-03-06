#! /bin/bash

set -e

echo 'Backup config file > ~/.backup'
mkdir -p ~/.backup
[ -f ~/.zshrc ] && cp ~/.zshrc ~/.backup/ && cp zshrc ~/.zshrc
[ -f ~/.tmux.conf ] && cp ~/.tmux.conf ~/.backup/ && cp tmux.conf ~/.tmux.conf
[ -f ~/.profile ] && cp ~/.profile ~/.backup/
[ -f ~/.gitconfig ] && cp ~/.gitconfig ~/.backup/
[ -f ~/.ideavimrc ] && cp ~/.ideavimrc ~/.backup/

echo 'Installing'
cp profile ~/.profile
cp gitconfig ~/.gitconfig
cp ideavimrc ~/.ideavimrc

if read -t 5 -p "(*^▽^*) Would you want to use my vimrc [Y/N]?" is_install; then
    case "$is_install" in
        [Yy]* )
            if [ -d ~/.vim ] && [ ! -f ~/.vim/autoload/plug.vim ]; then
                cp vim/autoload/plug.vim ~/.vim/autoload/plug.vim
            fi

            [ -f ~/.vim/coc-settings.json ] && cp ~/.vim/coc-settings.json ~/.backup/
            cp vim/coc-settings.json ~/.vim/coc-settings.json

            [ -f ~/.vimrc ] && cp ~/.vimrc ~/.backup/
            cp vimrc ~/.vimrc

            echo 'Vim plugin installing...'
            vim +PlugInstall +qall
            echo 'Vim plugin install Done!';;
    esac
else
    echo ""
fi

echo 'Install Done!'
