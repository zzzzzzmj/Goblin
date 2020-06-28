#! /bin/bash

set -e

echo 'Backup config file > ~/.backup'
mkdir -p ~/.backup
[ -f ~/.zshrc ] && cp ~/.zshrc ~/.backup/ && cp zshrc ~/.zshrc
[ -f ~/.tmux.conf ] && cp ~/.tmux.conf ~/.backup/ && cp tmux.conf ~/.tmux.conf
[ -f ~/.profile ] && cp ~/.profile ~/.backup/
[ -f ~/.gitconfig ] && cp ~/.gitconfig ~/.backup/
[ -f ~/.ideavimrc ] && cp ~/.ideavimrc ~/.backup/
[ -f ~/.p10k.zsh ] && cp ~/.p10k.zsh ~/.backup/

echo 'Installing'
cp profile ~/.profile
cp gitconfig ~/.gitconfig
cp ideavimrc ~/.ideavimrc
cp p10k.zsh ~/.p10k.zsh

if read -t 5 -p "(*^▽^*) Would you want to use my vimrc [Y/N]?" is_install; then
    case "$is_install" in
        [Yy]* )
            mkdir -p ~/.vim/autoload
            [ ! -f ~/.vim/autoload/plug.vim ] && cp vim/autoload/plug.vim ~/.vim/autoload/plug.vim

            [ -f ~/.vim/coc-settings.json ] && cp ~/.vim/coc-settings.json ~/.backup/
            cp vim/coc-settings.json ~/.vim/coc-settings.json

            [ -f ~/.vimrc ] && cp ~/.vimrc ~/.backup/
            cp vimrc ~/.vimrc

            echo 'Vim plugin installing...'
            vim +PlugInstall +qall
            echo 'Vim plugin install Done!';;
        [Nn]* )
            echo "Skip install vim plugins"
    esac
else
    echo "\nSkip install vim plugins"
fi

# use brew bundle manager homebrew packages
which brew >/dev/null 2>&1
if [ $? -eq 0 ]; then
    if read -t 5 -p "(*^▽^*) Would you want to install Homebrew packages [Y/N]?" is_install; then
        case "$is_install" in
            [Yy]* )
                echo 'Homebrew packages installing'
                brew bundle install --no-upgrade --no-lock;;
            [Nn]* )
                echo "Skip install Homebrew packages"
        esac
    else
        echo "\nSkip install homebrew packages"
    fi
fi


echo 'Install Done!'
