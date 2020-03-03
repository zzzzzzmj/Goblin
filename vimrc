map  <Down> <Nop>
map  <Up> <Nop>
map  <Left> <Nop>
map  <Right> <Nop>
inoremap jk <Esc>

let mapleader = " "
set nocompatible

filetype off
call plug#begin('~/.vim/plugged')

Plug 'doums/darcula'
Plug 'mhinz/vim-startify'
" Plug 'vim-airline/vim-airline'
" Plug 'vim-airline/vim-airline-themes'
Plug 'itchyny/lightline.vim'
Plug 'mengelbrecht/lightline-bufferline'
Plug 'maximbaz/lightline-ale'

" edit
Plug 'tpope/vim-surround'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-commentary'
Plug 'itchyny/vim-cursorword'
Plug 'junegunn/vim-easy-align'

" programming
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'honza/vim-snippets'
Plug 'yggdroot/indentLine'
Plug 'dense-analysis/ale'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'janko/vim-test'

" move
Plug 'scrooloose/nerdtree'
Plug 'liuchengxu/vista.vim'
Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }

" makrdown
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'suan/vim-instant-markdown', {'for': 'markdown'}

call plug#end()
filetype plugin indent on

" Leaderf
let g:Lf_WindowPosition = 'popup'
let g:Lf_PreviewInPopup = 1
let g:Lf_PopupWidth = &columns * 3 / 4
let g:Lf_PopupHeight = 0.6
noremap <leader>fm :<C-U><C-R>=printf("Leaderf mru %s", "")<CR><CR>
noremap <leader>ft :<C-U><C-R>=printf("Leaderf bufTag %s", "")<CR><CR>
nnoremap <leader>ff :Leaderf file<CR>
nnoremap <leader>fl :Leaderf line --fullPath<CR>
nnoremap <leader>fr :Leaderf rg -F<CR>
xnoremap <leader>fr :<C-U><C-R>=printf("Leaderf! rg -F -e %s ", leaderf#Rg#visual())<CR>
nnoremap <leader>rc :<C-U>Leaderf! rg --recall<CR>

colorscheme darcula
highlight Cursor guibg=#7F70F0
set termguicolors
set background=dark

" NERDtree
let g:NERDTreeIgnore=['\~$', '\.pyc$', '\.db$', '\.sqlite$', '__pycache__', '.git', '.idea', '.vscode', '\.swp']
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
autocmd FileType python noremap <buffer> <F8> :ALEToggle<cr>
autocmd BufWritePre *.py :ALEFix
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'python': ['isort', 'black'],
\}
let g:ale_linters = {
\   'python': ['flake8'],
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
let g:ale_lint_on_text_changed=0

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
set shell=/bin/zsh
set shiftwidth=4
set smartindent
set clipboard=unnamed
set softtabstop=4
set tabstop=4
set expandtab
nnoremap <leader>ev  :vsplit $MYVIMRC<cr>
nnoremap <leader>sv  :source $MYVIMRC<cr>
nnoremap <leader>y viwy

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)


" airline
" let g:airline_theme='violet'
" let g:airline_powerline_fonts = 1 " https://github.com/powerline/fonts
" let g:airline_left_sep = ''
" let g:airline_left_alt_sep = ''
" let g:airline_right_sep = ''
" let g:airline_right_alt_sep = ''
" let g:airline#extensions#tabline#enabled = 1
" let g:airline#extensions#tabline#left_sep = ''
" let g:airline#extensions#tabline#left_alt_sep = ''
" let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
" let g:airline#extensions#ale#enabled = 1
" let g:airline#extensions#tabline#switch_buffers_and_tabs = 1

" lightline
let g:lightline = {
      \ 'colorscheme': 'seoul256',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'cocstatus', 'currentfunction', 'filename', 'readonly', 'modified' ] ],
      \   'right': [[ 'linter_checking', 'linter_errors', 'linter_warnings', 'linter_infos'],
      \             [ 'lineinfo' ],
      \             [ 'fileformat', 'fileencoding', 'filetype' ] ],
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead',
      \   'cocstatus': 'coc#status',
      \   'currentfunction': 'CocCurrentFunction'
      \ },
      \ 'component': {'lineinfo': ' %3l:%-2v'}
      \ }


let g:lightline.separator = {'left': '', 'right': ''}
let g:lightline.subseparator = { 'left': '', 'right': '' }
let g:lightline.tabline = {'left': [['buffers']], 'right': [['tabs']]}
let g:lightline#bufferline#shorten_path = 1
set showtabline=2
set noshowmode
set laststatus=2
if !has('gui_running')
  set t_Co=256
endif

let g:lightline.component_expand = {
      \  'buffers': 'lightline#bufferline#buffers',
      \  'linter_checking': 'lightline#ale#checking',
      \  'linter_infos': 'lightline#ale#infos',
      \  'linter_warnings': 'lightline#ale#warnings',
      \  'linter_errors': 'lightline#ale#errors',
      \ }


let g:lightline.component_type = {
      \  'buffers': 'tabsel',
      \  'linter_checking': 'right',
      \  'linter_infos': 'right',
      \  'linter_warnings': 'right',
      \  'linter_errors': 'error',
      \ }

let s:palette = g:lightline#colorscheme#seoul256#palette
let s:palette.tabline.middle = [ ['#666656', '#30302c', 242, 236] ]
let s:palette.tabline.tabsel = [ [ '#30302c', '#87afaf', 236, 109 ] ]
unlet s:palette

" comment
nnoremap <leader>z :Commentary<cr>
vnoremap <leader>z :Commentary<cr>
nnoremap <c-_> :Commentary<cr>
vnoremap <c-_> :Commentary<cr>

" move window
nnoremap <c-h> <c-w><c-h>
nnoremap <c-j> <c-w><c-j>
nnoremap <c-k> <c-w><c-k>
nnoremap <c-l> <c-w><c-l>

" VIM flod
set foldmethod=indent
set foldlevel=5

" VIM Buffer
set wildmenu wildmode=full
set wildchar=<Tab>
set wildcharm=<c-z>
noremap <leader>dw :bp<cr>:bd #<cr>
nnoremap H :bp<cr>
nnoremap L :bn<cr>

" VIM Tab
noremap gt :tabn<cr>
noremap gT :tabp<cr>

vnoremap <leader>c "+yy
nnoremap <silent><leader>w :w<cr>
vnoremap <silent><leader>w <esc>:<leader>w<cr>
nnoremap <leader>q :q<cr>

" Vista
nnoremap <leader>t :Vista!!<cr>
let g:vista_sidebar_width=35
let g:vista#renderer#enable_icon = 0

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

autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4 softtabstop=4

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

autocmd BufWritePost $MYVIMRC source $MYVIMRC

" terminal
nnoremap <silent> <leader>4 :call TerminalToggle()<CR>
tnoremap <silent> <leader>4 <c-w>:call TerminalToggle()<CR>
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
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Or use `complete_info` if your vim support it, like:
" inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

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
nmap <leader>p  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
" xmap <leader>a  <Plug>(coc-codeaction-selected)
" nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
" nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
" nmap <leader>qf  <Plug>(coc-fix-current)

" Create mappings for function text object, requires document symbols feature of languageserver.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <TAB> for select selections ranges, needs server support, like: coc-tsserver, coc-python
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
autocmd User CocStatusChange,CocDiagnosticChange call lightline#update()

function! CocCurrentFunction()
    return get(b:, 'coc_current_function', '')
endfunction

set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" python
au FileType python nmap <leader>r :w<cr>:botright term ++rows=20 python "%"<cr>

let test#python#runner = 'pytest'
let test#vim#term_position = "belowright"
let test#strategy = "vimterminal"
nnoremap <leader>utn :TestNearest<CR>
nnoremap <leader>utf :TestFile<CR>
nnoremap <leader>utl :TestLast<CR>
nnoremap <leader>utv :TestVisit<CR>
