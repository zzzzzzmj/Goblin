let mapleader = ","
let maplocalleader = "-"

set nocompatible

" VIM Plugin Vundle {{{
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
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-commentary'
Plugin 'stephpy/vim-yaml'
" Plugin 'scrooloose/syntastic'
" Plugin 'Valloric/YouCompleteMe'
Plugin 'tpope/vim-fugitive'

call vundle#end()

filetype plugin indent on
syntax enable
syntax on
" }}}

set background=dark
colorscheme hybrid

" NERDtree setting
let NERDTreeIgnore=['\.pyc$', '\~$', '\.*__pycache__*$', '\.idea*$']
nnoremap <c-e> :NERDTreeToggle<CR>
nnoremap <leader>r :NERDTreeFind<CR>

autocmd bufenter * lcd %:p:h
" only nerdtree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif


" other
set number
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
set cursorline

" statusline
set statusline=2

" ctrl c/v
set clipboard=unnamed

nnoremap <space> za
inoremap jj <esc>

nnoremap <leader>ev  :vsplit $MYVIMRC<cr>
nnoremap <leader>sv  :source $MYVIMRC<cr>
nnoremap <leader>\ :%s/\s\+$//g<cr>
nnoremap <c-u> viw<s-u>
nnoremap <c-y> viwy

" comment
if has('win32')
    nnoremap <c-/> :Commentary<cr>
    vnoremap <c-/> :Commentary<cr>
else
    nnoremap <c-_> :Commentary<cr>
    vnoremap <c-_> :Commentary<cr>
endif

" move window
nnoremap <c-h> <c-w><c-h>
nnoremap <c-j> <c-w><c-j>
nnoremap <c-k> <c-w><c-k>
nnoremap <c-l> <c-w><c-l>

if has('win32')
    nnoremap <M-j> :resize +5<cr>
    nnoremap <M-k> :resize -5<cr>
    nnoremap <M-h> :vertical resize -5<cr>
    nnoremap <M-l> :vertical resize +5<cr>
else
    nnoremap J :resize +5<cr>
    nnoremap K :resize -5<cr>
    nnoremap H :vertical resize -5<cr>
    nnoremap L :vertical resize +5<cr>
endif


"" VIM flod {{{
set foldmethod=indent
set foldlevel=5

augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END

" }}}

" VIM Buffer {{{
set wildmenu wildmode=full
set wildchar=<Tab>
set wildcharm=<c-z>

" }}}

nnoremap <leader>n :b <c-z>

" syntastic {{{
nnoremap <leader>e :SyntasticCheck<cr>
let python_highlight_all=1
let g:syntastic_aggregate_errors = 1
let g:syntastic_python_checkers = ['flake8']
let g:syntastic_python_flake8_args = '--max-line=120'
syntax on

" }}}

" GUI config {{{
if has('win32')
    set guifont=Consolas:h14
elseif has('gui_macvim')
    set guifont=Fira\ Code:h14
else
    set guifont=Consolas:h14
endif

source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim

set guioptions-=l
set guioptions-=L
set guioptions-=r
set guioptions-=R
set guioptions-=m
set guioptions-=T
set guioptions-=e

" }}}

