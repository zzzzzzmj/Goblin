let mapleader = " "

" neovim
if has("nvim")
  let g:python_host_prog='/usr/bin/python2'
  let g:python3_host_prog='~/.pyenv/shims/python'
  let g:ruby_host_prog = '~/.gem/bin/neovim-ruby-host'
endif

set nocompatible
set autoindent
set backspace=2
set cursorline
set encoding=utf-8
set fileencoding=utf-8
set hlsearch
set ignorecase
set incsearch
set number
set relativenumber
set smartindent
set shiftwidth=4
set softtabstop=4
set tabstop=4
set expandtab
set clipboard=unnamed

set noswapfile  " 不需要.swp文件

" fold
set foldenable
set foldmethod=indent
set foldlevel=99

" filetype
autocmd! BufNewFile,BufReadPost *.{yaml,yml} set filetype=yaml foldmethod=indent
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4 softtabstop=4

inoremap jk <Esc>
nnoremap <leader>ev  :vsplit $MYVIMRC<cr>
nnoremap <leader>sv  :source $MYVIMRC<cr>
nnoremap <leader>y viwy

" register
vnoremap p "_dP

" buffer
noremap <leader>dw :bp\|bd #<cr>      " close current buffer
noremap <leader>bo :%bd\|e#\|bd#<cr>  " close other buffers, except current
nnoremap H :bp<cr>
nnoremap L :bn<cr>
nnoremap <leader>w :wa<cr>
vnoremap <leader>w <esc>:wa<cr>
nnoremap <leader>q :q<cr>

" resize window
noremap + :resize +4<cr>
noremap _ :resize -4<cr>
noremap = :vertical resize +4<cr>
noremap - :vertical resize -4<cr>

" move window
nnoremap <c-h> <c-w><c-h>
nnoremap <c-j> <c-w><c-j>
nnoremap <c-k> <c-w><c-k>
nnoremap <c-l> <c-w><c-l>

filetype off
call plug#begin('~/.config/nvim/plugged')

Plug 'doums/darcula'
Plug 'mhinz/vim-startify'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" edit
Plug 'tpope/vim-surround'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-commentary'
Plug 'itchyny/vim-cursorword'
Plug 'junegunn/vim-easy-align'
Plug 'ekalinin/Dockerfile.vim'
Plug 'mattn/vim-gist', { 'on': 'Gist' }
Plug 'mattn/webapi-vim'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'brooth/far.vim'

" move
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'junegunn/fzf', { 'do': './install --all'  }
Plug 'junegunn/fzf.vim'
" Plug 'junegunn/vim-slash'

" programming
" Plug 'dense-analysis/ale'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/gv.vim'
Plug 'honza/vim-snippets'
Plug 'yggdroot/indentLine'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries', 'for': 'go' }
" Plug 'janko/vim-test'
Plug 'antoinemadec/coc-fzf'

" terminal
Plug 'skywind3000/vim-terminal-help'

" db
" Plug 'tpope/vim-dotenv'
" Plug 'tpope/vim-dadbod'
" Plug 'kristijanhusak/vim-dadbod-ui'

" makrdown
" Plug 'godlygeek/tabular', { 'for': 'markdown' }
" Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }
" Plug 'suan/vim-instant-markdown', { 'for': 'markdown' }

Plug 'wakatime/vim-wakatime'

" startuptime
" Plug 'tweekmonster/startuptime.vim'
" Plug 'dstein64/vim-startuptime'

call plug#end()
filetype plugin indent on

" fzf
let g:fzf_preview_window = 'right:70%'
let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.6} }

nnoremap <silent> <leader>fr :Rg<cr>
xnoremap <silent> <leader>fr y:Rg <c-r>"<cr>
nnoremap <silent> <leader>ff :Files<cr>
nnoremap <silent> <leader>fb :Buffers<cr>
nnoremap <silent> <leader>fgf :GFiles?<cr>
nnoremap <silent> <leader>fgb :Gblame --date=short<cr>

function! RipgrepFzf(query, fullscreen)
  let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case -- %s || true'
  let initial_command = printf(command_fmt, shellescape(a:query))
  let reload_command = printf(command_fmt, '{q}')
  let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
  call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction

command! -nargs=* -bang Rg call RipgrepFzf(<q-args>, <bang>0)
function! s:list_buffers()
  redir => list
  silent ls
  redir END
  return split(list, "\n")
endfunction

function! s:delete_buffers(lines)
  execute 'bwipeout' join(map(a:lines, {_, line -> split(line)[0]}))
endfunction

command! -nargs=* -bang BD call fzf#run(fzf#wrap({
  \ 'source': s:list_buffers(),
  \ 'sink*': { lines -> s:delete_buffers(lines) },
  \ 'options': '--multi --reverse --bind ctrl-a:select-all+accept'
\ }))


"coc-fzf
let g:coc_fzf_preview='right:70%'
let g:coc_fzf_opts=['--layout=reverse']
nnoremap <silent> <m-a> :<C-u>CocFzfList commands<CR>
nnoremap <silent> <m-c> :<C-u>CocFzfList commands<CR>

" fzf-preview
let g:fzf_preview_floating_window_rate = 0.7
let g:fzf_preview_fzf_preview_window_option = 'right:70%'
let g:fzf_preview_defalut_fzf_options = { '--preview-window': ':70%' }

" colorscheme
set t_Co=256
set background=dark
colorscheme darcula
" fix darcula gui  cursor
highlight Cursor guibg=#7F70F0 guifg=#5F5A60
" fix darcula nvim cursor
highlight CursorLine guifg=none
set termguicolors
set background=dark

hi! link GitGutterAdd GitAddStripe
hi! link GitGutterChange GitChangeStripe
hi! link GitGutterDelete GitDeleteStripe
let g:gitgutter_sign_removed = '▶'

" NERDtree
let g:NERDTreeIgnore=['\~$', '\.pyc$', '\.db$', '\.sqlite$', '__pycache__', '.git$', '.idea', '.vscode', '\.swp']
let NERDTreeChDirMode=3
let NERDTreeShowBookmarks=1
let NERDTreeShowHidden=1
let NERDTreeMinimalUI=1
let NERDTreeRemoveFileCmd='rm '
let NERDTreeAutoDeleteBuffer=1
let g:nerdtree_tabs_focus_on_files=1
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,*.db,*.sqlite

nnoremap <leader>n :NERDTreeToggle<CR>
nnoremap <leader>m :NERDTreeCWD<cr>
autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Ale
" let g:ale_fixers = {
" \   '*': ['remove_trailing_lines', 'trim_whitespace'],
" \   'python': ['isort', 'black'],
" \   'go': ['gofmt'],
" \}
" let g:ale_linters = {
" \   'python': ['flake8'],
" \   'go': ['gloangci-lint'],
" \}

" let g:ale_sign_error = '✗'
" let g:ale_python_black_options='--line-length=120'
" let g:ale_python_flake8_options='--max-line-length=120'
" let g:ale_echo_msg_error_str = 'E'
" let g:ale_echo_msg_warning_str = 'W'
" let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
" let g:ale_fix_on_save=1
" let g:ale_linter_on_save=1
" let g:ale_lint_on_insert_leave=1
" let g:ale_lint_on_text_changed='never'

" EasyAlign
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

let g:easy_align_delimiters = {
\ '>': { 'pattern': '>>\|=>\|>' },
\ '/': {
\     'pattern':         '//\+\|/\*\|\*/',
\     'delimiter_align': 'l',
\     'ignore_groups':   ['!Comment'] },
\ }

" Airline
set noshowmode
set laststatus=1

let g:airline_theme='violet'
let g:airline_powerline_fonts = 1 " https://github.com/powerline/fonts
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = ''
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
let g:airline#extensions#tabline#switch_buffers_and_tabs = 1
let g:airline#extensions#ale#enabled = 1
let g:airline_highlighting_cache=1
let g:airline_extensions=["tabline", "ale", "coc", "branch"]

" Comment
nnoremap <leader>c :Commentary<cr>
vnoremap <leader>c :Commentary<cr>

" vim-go
let g:go_list_type = "quickfix"
let g:go_def_mode = 'gopls'
let g:go_fmt_command = "goimports"
let g:go_fmt_fail_silently = 0
let g:go_fmt_autosave = 1
let g:go_doc_popup_window = 1
let g:go_doc_keywordprg_enabled = 0

" " markdown
" let g:instant_markdown_autostart = 1
" let g:instant_markdown_slow = 1
" let g:vim_markdown_toc_autofit = 1
" let g:vim_markdown_conceal = 0
" let g:vim_markdown_conceal_code_blocks = 0

" GUI config
if has('gui_running')
    source $VIMRUNTIME/delmenu.vim
    source $VIMRUNTIME/menu.vim

    set guioptions-=l
    set guioptions-=L
    set guioptions-=r
    set guioptions-=R
    set guioptions-=m
    set guioptions-=T
    set guioptions-=e
    if has("win32")
        " https://github.com/tonsky/FiraCode/issues/462
        set guifont=Fira\ Code:h12
        set renderoptions=type:directx
        " https://www.vim.org/scripts/script.php?script_id=687
        au GUIEnter * call libcallnr("vimtweak.dll", "SetAlpha", 245)
        set lines=38
        set columns=150
    else
        set guifont=Fira\ Code:h14
        set macligatures
        set lines=60
        set columns=250
    endif
    set linespace=3
endif

" terminal
let g:terminal_height=20
let g:terminal_cwd=2
let g:terminal_kill='term'
let g:terminal_close=1
let g:terminal_list=0

" coc.nvim
" ===================
let g:coc_global_extensions = [
    \ "coc-actions",
    \ "coc-diagnostic",
    \ "coc-lists",
    \ "coc-python",
    \ "coc-explorer",
    \ "coc-snippets",
    \ "coc-translator",
    \ "coc-vimlsp",
    \ "coc-json",
    \ "coc-yaml",]

" if hidden is not set, TextEdit might fail.
set hidden

" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" " Better display for messages
set cmdheight=1

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=100

" don't give |ins-completion-menu| messages.
set shortmess+=c

" " Always show the signcolumn, otherwise it would shift the text each time
" " diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `alt-j` and `alt-k` to navigate diagnostics
nmap <silent> <m-j> <Plug>(coc-diagnostic-prev)
nmap <silent> <m-k> <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap gd <Plug>(coc-definition)
nmap gy <Plug>(coc-type-definition)
nmap gi <Plug>(coc-implementation)
nmap gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
xmap <F9>  <Plug>(coc-format-selected)
nmap <F9>  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
" nmap <leader>qf  <Plug>(coc-fix-current)

" Create mappings for function text object, requires document symbols feature of languageserver.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Use <TAB> for select selections ranges, needs server support, like: coc-tsserver, coc-python
" If use <TAB> , <c-i> can't use  <TAB> == <c-i> ?
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <S-TAB> <Plug>(coc-range-select-backword)

" coc-translator
" popup
nmap <m-t> <Plug>(coc-translator-p)
vmap <m-t> <Plug>(coc-translator-pv)

" coc-actions
" Remap for do codeAction of selected region
function! s:cocActionsOpenFromSelected(type) abort
  execute 'CocCommand actions.open ' . a:type
endfunction
xmap <silent> <leader>a :<C-u>execute 'CocCommand actions.open ' . visualmode()<CR>
nmap <silent> <leader>a :<C-u>set operatorfunc=<SID>cocActionsOpenFromSelected<CR>g@

" coc-explorer
" nnoremap <silent> <leader>n :CocCommand explorer<cr>
