set nocompatible              

" Vundle
filetype off                 
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'powerline/powerline'
Plugin 'Yggdroot/indentLine'

call vundle#end() 
filetype plugin indent on 


syntax enable
syntax on

" indentLine setting
let g:indentLine_char = '┆'
let g:indentLine_enabled = 1

set nu
set relativenumber
set shiftwidth=4
set softtabstop=4
set tabstop=4
set expandtab
set autoindent
set shell=/bin/bash
set hlsearch
set incsearch
set smartindent

