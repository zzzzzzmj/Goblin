filetype off
syntax on
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'mhinz/vim-startify'
Plugin 'yggdroot/indentLine'
Plugin 'w0ng/vim-hybrid'
Plugin 'tpope/vim-surround'

call vundle#end()
filetype plugin indent on
filetype plugin on

""""""""""""""""""""""""""""""""""""""

" color schema
set background=dark
colorscheme hybrid

let mapleader = ","
let maplocalleader = "-"

set nu
set relativenumber
set shiftwidth=4
set tabstop=4
set softtabstop=4
set expandtab
set autoindent
set shell=/bin/bash
set hlsearch
set incsearch
set smartindent
set encoding=utf-8
set backspace=2

" fold
set foldmethod=indent
set foldlevel=5

noremap <space> za
nnoremap <c-u> viw<s-u>
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>


" nerdtree
let NERDTreeIgnore=['\.pyc$', '\~$', '\.idea$'] "ignore files in NERDTree
nnoremap <c-e> :NERDTreeToggle<cr>

" statusline
