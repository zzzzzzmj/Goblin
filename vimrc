map  <Down> <Nop>
map  <Up> <Nop>
map  <Left> <Nop>
map  <Right> <Nop>
inoremap jj <Esc>

let mapleader = ","

set nocompatible

" VIM Plug
filetype off
call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree'
Plug 'itchyny/lightline.vim'
Plug 'w0ng/vim-hybrid'
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
nmap <c-p> :Leaderf file --popup<CR>
nmap <leader>f :Leaderf line --popup<CR>
nmap <leader>F :Leaderf rg --popup<CR>

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
    " call s:on_lsp_buffer_enabled only for languages that has the server registered.
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END

set completeopt+=preview
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif

imap <c-space> <Plug>(asyncomplete_force_refresh)

inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr>    pumvisible() ? "\<C-y>" : "\<cr>"

let g:lsp_diagnostics_enabled = 0

set background=dark
colorscheme hybrid

" NERDtree setting
let NERDTreeIgnore=['\.pyc$', '\~$', '__pycache__', '.idea']
let NERDTreeChDirMode=1
let NERDTreeShowBookmarks=1
nnoremap <leader>r :NERDTreeToggle<CR>
autocmd bufenter * silent! lcd %:p:h
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
set laststatus=2
let g:lightline = {
\     'colorscheme': 'seoul256',
\     'active': {
\        'left': [ 
\             [ 'mode', 'paste' ],
\             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
\     },
\     'component_function': {'gitbranch': 'fugitive#head'},
\ }

" ctrl c/v
set clipboard=unnamed

nnoremap <space> za

nnoremap <leader>ev  :vsplit $MYVIMRC<cr>
nnoremap <leader>sv  :source $MYVIMRC<cr>
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
noremap <leader>n :b <c-z>

" VIM tab
nnoremap H :tabp<cr>
nnoremap L :tabn<cr>

vmap <leader>c "+yy

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

let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_structs = 1
let g:go_highlight_generate_tags = 1
let g:go_highlight_space_tab_error = 0
let g:go_highlight_array_whitespace_error = 0
let g:go_highlight_trailing_whitespace_error = 0
let g:go_highlight_extra_types = 1

autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4 softtabstop=4

augroup completion_preview_close
  autocmd!
  if v:version > 703 || v:version == 703 && has('patch598')
    autocmd CompleteDone * if !&previewwindow && &completeopt =~ 'preview' | silent! pclose | endif
  endif
augroup END

augroup go

  au!
  au FileType go noremap <buffer> <F7> :GoFmt<cr>
  au FileType go noremap gd :GoDef<cr>
  au FileType go noremap <c-n> :GoReferrers<cr>

  au Filetype go command! -bang A call go#alternate#Switch(<bang>0, 'edit')
  au Filetype go command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')
  au Filetype go command! -bang AS call go#alternate#Switch(<bang>0, 'split')
  au Filetype go command! -bang AT call go#alternate#Switch(<bang>0, 'tabe')

  au FileType go nmap <Leader>dd <Plug>(go-def-vertical)
  au FileType go nmap <Leader>dv <Plug>(go-doc-vertical)
  au FileType go nmap <Leader>db <Plug>(go-doc-browser)

  au FileType go nmap <leader>r  <Plug>(go-run)
  au FileType go nmap <leader>t  <Plug>(go-test)
  au FileType go nmap <Leader>gt <Plug>(go-coverage-toggle)
  au FileType go nmap <Leader>i <Plug>(go-info)
  au FileType go nmap <silent> <Leader>l <Plug>(go-metalinter)
  au FileType go nmap <C-g> :GoDecls<cr>
  au FileType go nmap <leader>dr :GoDeclsDir<cr>
  au FileType go imap <C-g> <esc>:<C-u>GoDecls<cr>
  au FileType go imap <leader>dr <esc>:<C-u>GoDeclsDir<cr>
  au FileType go nmap <leader>rb :<C-u>call <SID>build_go_files()<CR>

augroup END


" GUI config
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

autocmd! BufWritePost ~/.vimrc source ~/.vimrc
