" use vundle.vim
set nocompatible              
filetype off                 

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'powerline/powerline'

call vundle#end()            " required
filetype plugin indent on    " required
syntax enable
syntax on

set nu
set shiftwidth=4
set softtabstop=4
set tabstop=4
set expandtab
set autoindent
set shell=/bin/bash
