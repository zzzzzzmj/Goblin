set nocompatible              

" Vundle 插件管理
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
map <leader>i :IndentLinesToggle<cr>
" \+i 关闭缩进指示线，再按开启
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

