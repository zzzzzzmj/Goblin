let mapleader = " "

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
call plug#begin('~/.vim/plugged')

Plug 'doums/darcula'
" Plug 'w0ng/vim-hybrid'
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
Plug 'stephpy/vim-yaml'
Plug 'ekalinin/Dockerfile.vim'
Plug 'mattn/vim-gist', { 'on': 'Gist' }
Plug 'mattn/webapi-vim'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'brooth/far.vim'

" move
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'Xuyuanp/nerdtree-git-plugin', { 'on': 'NERDTreeToggle' }
Plug 'junegunn/fzf', { 'do': './install --all'  }
Plug 'junegunn/fzf.vim'

" programming
Plug 'dense-analysis/ale'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/gv.vim'
Plug 'honza/vim-snippets'
Plug 'yggdroot/indentLine'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries', 'for': 'go' }
Plug 'janko/vim-test'

" db
Plug 'tpope/vim-dotenv'
Plug 'tpope/vim-dadbod'
Plug 'kristijanhusak/vim-dadbod-ui'

" makrdown
Plug 'godlygeek/tabular', { 'for': 'markdown' }
Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }
Plug 'suan/vim-instant-markdown', { 'for': 'markdown' }

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


" color
colorscheme darcula

" fix darcula gui cursor
highlight Cursor guibg=#7F70F0
set termguicolors
set background=dark

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
" autocmd BufEnter * silent! :lcd%:p:h

" Ale
autocmd FileType python noremap <buffer> <F7> :ALEFix<cr>
autocmd BufWritePre *.py :ALEFix
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'python': ['isort', 'black'],
\   'py': ['isort', 'black'],
\   'go': ['gofmt'],
\}
let g:ale_linters = {
\   'python': ['flake8'],
\   'go': ['golint'],
\}

let g:ale_sign_error = '✗'
let g:ale_python_black_options='--line-length=120'
let g:ale_python_flake8_options='--max-line-length=120'
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_fix_on_save=1
let g:ale_linter_on_save=1
let g:ale_lint_on_insert_leave=1
let g:ale_lint_on_text_changed='never'

" EasyAlign
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" Airline
set noshowmode
set laststatus=2
set t_Co=256

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
let g:go_fmt_fail_silently = 0
let g:go_fmt_autosave = 1

augroup completion_preview_close
  autocmd!
  if v:version > 703 || v:version == 703 && has('patch598')
    autocmd CompleteDone * if !&previewwindow && &completeopt =~ 'preview' | silent! pclose | endif
  endif
augroup END
au FileType go setlocal omnifunc=go#complete#GocodeComplete

augroup go

  au!
  au FileType go noremap <buffer> <F7> :GoFmt<cr>
  au FileType go noremap gd :GoDef<cr>

  au Filetype go command! -bang A call go#alternate#Switch(<bang>0, 'edit')
  au Filetype go command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')
  au Filetype go command! -bang AS call go#alternate#Switch(<bang>0, 'split')
  au Filetype go command! -bang AT call go#alternate#Switch(<bang>0, 'tabe')

  au FileType go nmap <Leader>dd <Plug>(go-def-vertical)
  au FileType go nmap <Leader>dv <Plug>(go-doc-vertical)
  au FileType go nmap <Leader>db <Plug>(go-doc-browser)

  au FileType go nmap <leader>r  <Plug>(go-run)
  au FileType go nmap <leader>gt  <Plug>(go-test)
  au FileType go nmap <Leader>gc <Plug>(go-coverage-toggle)
  au FileType go nmap <Leader>i <Plug>(go-info)
  au FileType go nmap <silent> <Leader>l <Plug>(go-metalinter)
  au FileType go nmap <C-g> :GoDecls<cr>
  au FileType go nmap <leader>dr :GoDeclsDir<cr>
  au FileType go nmap <leader>rb :<C-u>call <SID>build_go_files()<CR>

augroup END

" markdown
let g:instant_markdown_autostart = 1
let g:instant_markdown_slow = 1
let g:vim_markdown_toc_autofit = 1
let g:vim_markdown_conceal = 0
let g:vim_markdown_conceal_code_blocks = 0

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
    set guifont=Fira\ Code:h12
    if has("win32")
        " https://github.com/tonsky/FiraCode/issues/462
        set renderoptions=type:directx
        " https://www.vim.org/scripts/script.php?script_id=687
        au GUIEnter * call libcallnr("vimtweak.dll", "SetAlpha", 245)
        set lines=38
        set columns=150
    else
        set macligatures
    endif
    set linespace=3
    set lines=50
    set columns=180
endif

" terminal
nnoremap <silent> <leader>5 :botright term ++kill=term ++rows=20<cr>
nnoremap <silent> 44 :call TerminalToggle()<CR>
tnoremap <silent> 44 <c-w>:call TerminalToggle()<CR>
tnoremap <Esc> <c-\><c-n>
function! TerminalToggle()
    let name = "terminal"
    let bufferNum = bufnr(name)
    if bufferNum == -1 || bufloaded(bufferNum) != 1
        execute 'silent botright term ++close ++kill=term ++rows=20'
        execute 'silent file '.name
        execute 'silent set nobuflisted'
    else
        let bufWinNum = bufwinnr(name)
        if bufWinNum == -1
            execute "silent botright sbuffer ".name
            execute "resize -5"
        else
            execute "silent ".bufWinNum." wincmd w"
            hide
        endif
    endif
endfunction

" coc.nvim
" ===================
" if hidden is not set, TextEdit might fail.
set hidden

" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Better display for messages
set cmdheight=1

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

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
if has('patch8.1.1068')
  " Use `complete_info` if your (Neo)Vim version supports it.
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  imap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

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

" Use <TAB> for select selections ranges, needs server support, like: coc-tsserver, coc-python
" If use <TAB> , <c-i> can't use  <TAB> == <c-i> ?
" nmap <silent> <TAB> <Plug>(coc-range-select)
" xmap <silent> <TAB> <Plug>(coc-range-select)
" xmap <silent> <S-TAB> <Plug>(coc-range-select-backword)

" Use `:Format` to format current buffer
" command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
" command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
" command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
autocmd User CocStatusChange,CocDiagnosticChange call lightline#update()

" python
au FileType python nmap <leader>r :w<cr>:botright term ++rows=20 python "%"<cr>

" vim-test
let test#python#runner = 'djangotest'
let test#vim#term_position = "belowright"
let test#strategy = "vimterminal"
nnoremap <leader>utn :TestNearest<CR>
nnoremap <leader>utf :TestFile<CR>
nnoremap <leader>utl :TestLast<CR>
nnoremap <leader>utv :TestVisit<CR>

let g:netrw_browsex_viewer="open"
