set nocompatible              

" Vundle 插件管理
filetype off                 
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'powerline/powerline'
Plugin 'Yggdroot/indentLine'
Plugin 'rizzatti/dash.vim'
Plugin 'tmhedberg/SimpylFold'
Plugin 'Valloric/YouCompleteMe'
Plugin 'scrooloose/syntastic'
Plugin 'scrooloose/nerdtree'
Plugin 'nvie/vim-flake8'

call vundle#end() 
" filetype on
filetype plugin indent on 

syntax enable

let python_highlight_all=1 
syntax on

" indentLine setting
" let g:indentLine_setColors = 0
let g:indentLine_char = '¦'
let g:indentLine_fileType = ['python']

" SimpylFold setting
let g:SimpylFold_docstring_preview=1

" nerfreee setting
let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree

" index
set nu
set relativenumber

" tab
set shiftwidth=4
set tabstop=4
set softtabstop=4
set expandtab
set autoindent
set shell=/bin/bash

" other
set hlsearch
set incsearch
set smartindent
set encoding=utf-8
set clipboard=unnamed
" set cursorline

" Enable floding
set foldmethod=indent
set foldlevel=99
nnoremap <space> za


