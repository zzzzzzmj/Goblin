map  <Down> <Nop>
map  <Up> <Nop>
map  <Left> <Nop>
map  <Right> <Nop>
inoremap jk <Esc>

let mapleader = ","
set nocompatible

" VIM Plug
filetype off
call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdtree'
Plug 'w0ng/vim-hybrid'
Plug 'mhinz/vim-startify'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'yggdroot/indentLine'
Plug 'tpope/vim-surround'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'dense-analysis/ale'
Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }

" language server
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'prabirshrestha/vim-lsp'

call plug#end()
filetype plugin indent on
syntax enable
syntax on

" Leaderf
nnoremap <c-p> :Leaderf! file --regexMode --popup<CR>
nnoremap <leader>f :Leaderf! line --regexMode --popup<CR>
nnoremap rc :<C-U>Leaderf! rg --recall<CR>
" macvim don't have results use leaderf rg
noremap <leader>F :<C-U><C-R>=printf("Leaderf! rg -e %s", expand("<cword>"))<CR>

" lsp
if executable('pyls') " pip install python-language-server
    au User lsp_setup call lsp#register_server({
        \ 'name': 'pyls',
        \ 'cmd': {server_info->['pyls']},
        \ 'whitelist': ['python'],
        \ })
    au FileType python noremap gd :LspDefinition<cr>
endif

if executable('gopls')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'gopls',
        \ 'cmd': {server_info->['gopls']},
        \ 'whitelist': ['go'],
        \ })
    autocmd BufWritePre *.go LspDocumentFormatSync
endif

function! s:on_lsp_buffer_enabled() abort
    setlocal omnifunc=lsp#complete
    setlocal signcolumn=yes
    nmap <buffer> gd <plug>(lsp-definition)
    nmap <buffer> <f2> <plug>(lsp-rename)
endfunction

augroup lsp_install
    au!
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END

set completeopt+=preview
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif

imap <c-space> <Plug>(asyncomplete_force_refresh)

inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr>    pumvisible() ? "\<C-y>" : "\<cr>"

let g:lsp_diagnostics_enabled = 0

colorscheme hybrid
set background=dark

" NERDtree setting
let NERDTreeIgnore=['\.pyc$', '\~$', '__pycache__', '.idea', '.git', '.vscode']
let NERDTreeChDirMode=1
let NERDTreeShowBookmarks=1
let NERDTreeShowHidden=1
let NERDTreeMinimalUI=1
let NERDTreeRemoveFileCmd='rm '
let NERDTreeAutoDeleteBuffer=1

nnoremap <leader>r :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Ale
autocmd FileType python,go noremap <buffer> <F7> :ALEFix<cr>
autocmd FileType python,go noremap <buffer> <F8> :ALEToggle<cr>
let g:ale_fixers = {
 \    'python': ['isort', 'black', 'remove_trailing_lines', 'trim_whitespace'],
 \}
let g:ale_linters = {
\     'python': ['flake8'],
\}
let g:ale_sign_error = '✗'
let g:ale_python_black_options='--line-length=120'
let g:ale_python_flake8_options='--max-line-length=120'

" other
set autoindent
set backspace=2
set cursorline
set encoding=utf-8
set expandtab
set hlsearch
set incsearch
set number
set relativenumber
set shell=/bin/bash
set shiftwidth=4
set smartindent
set softtabstop=4
set tabstop=4

" airline
" let g:airline_theme='minimalist'
let g:airline_theme='bubblegum'

" airline-customization
let g:airline_powerline_fonts = 1 " https://github.com/powerline/fonts
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = ''
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'

nnoremap <space> za
nnoremap <leader>ev  :vsplit $MYVIMRC<cr>
nnoremap <leader>sv  :source $MYVIMRC<cr>
nnoremap <c-y> viwy

" comment
if has('win32')
    nnoremap <c-/> :Commentary<cr>
    vnoremap <c-/> :Commentary<cr>
elseif has("gui_running")
    nnoremap <leader>z :Commentary<cr>
    vnoremap <leader>z :Commentary<cr>
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
    nnoremap <M-j> :resize +2<cr>
    nnoremap <M-k> :resize -2<cr>
    nnoremap <M-h> :vertical resize -2<cr>
    nnoremap <M-l> :vertical resize +2<cr>
else
    nnoremap <leader>j :resize +2<cr>
    nnoremap <leader>k :resize -2<cr>
    nnoremap <leader>h :vertical resize -2<cr>
    nnoremap <leader>l :vertical resize +2<cr>
endif


" VIM flod
set foldmethod=indent
set foldlevel=5

" VIM Buffer
set wildmenu wildmode=full
set wildchar=<Tab>
set wildcharm=<c-z>
noremap <leader>b :b <c-z>
" noremap <c-w> :bp|bd#<cr>
nnoremap H :bp<cr>
nnoremap L :bn<cr>

vmap <leader>c "+yy
nnoremap <leader>w :w<cr>
nnoremap <leader>q :q<cr>

" vim-go
function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#test#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction

let g:go_list_type = "quickfix"
let g:go_def_mode = 'gopls'
let g:go_fmt_command = "goimports"
let g:go_fmt_fail_silently = 1
let g:go_fmt_autosave = 1

" GUI config
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim

set guioptions-=l
set guioptions-=L
set guioptions-=r
set guioptions-=R
set guioptions-=m
set guioptions-=T
set guioptions-=e
if has('gui_running')
    set macligatures
    set guifont=Fira\ Code:h14
endif

autocmd! BufWritePost ~/.vimrc source ~/.vimrc

" ctrl c/v
set clipboard=unnamed
