let mapleader = ","
let maplocalleader = "-"

set nocompatible

"""""""""""""""""""""""""""""""
" Vundle
filetype off
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
Plugin 'jiangmiao/auto-pairs'
Plugin 'ctrlpvim/ctrlp.vim'

call vundle#end()
" filetype on
filetype plugin indent on
syntax enable
syntax on

"""""""""""""""""""""""""""""""

set background=dark
colorscheme hybrid

" NERDtree setting
let NERDTreeIgnore=['\.pyc$', '\~$', '\.*__pycache__*$', '\.idea*$']
nnoremap <c-e> :NERDTreeToggle<CR>


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
set backspace=2
set cursorline

" statusline
set statusline=2

" ctrl c/v
set clipboard=unnamed

noremap <space> za

nnoremap <leader>ev  :vsplit $MYVIMRC<cr>
nnoremap <leader>sv  :source $MYVIMRC<cr>
nnoremap <leader>\ :%s/\s\+$//g<cr>
nnoremap <c-u> viw<s-u>
nnoremap <c-y> viwy


set guifont=Fira\ Code:h14
" gui
if has('win32')
    set guifont=Consolas:h14
elseif has('gui_macvim')
    set guifont=Fira\ Code:h14
else
    set guifont=Monospace\ :h14
endif

