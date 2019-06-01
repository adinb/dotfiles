call plug#begin(expand('~/.config/nvim/plugged'))
if isdirectory('/usr/local/opt/fzf')
  Plug '/usr/local/opt/fzf' | Plug 'junegunn/fzf.vim'
else
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }
  Plug 'junegunn/fzf.vim'
endif
Plug 'Shougo/vimproc.vim', {'do': 'make'}
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'itchyny/lightline.vim'
Plug 'airblade/vim-gitgutter'
Plug 'vim-scripts/grep.vim'
Plug 'Raimondi/delimitMate'
Plug 'majutsushi/tagbar'
Plug 'ludwig/split-manpage.vim'
Plug 'pangloss/vim-javascript'
Plug 'Valloric/YouCompleteMe'
Plug 'tpope/vim-surround'
Plug 'raimon49/requirements.txt.vim', {'for': 'requirements'}
Plug 'mxw/vim-jsx'
Plug 'w0rp/ale'
Plug 'mileszs/ack.vim'
Plug 'metakirby5/codi.vim'
Plug 'xolox/vim-notes'
Plug 'xolox/vim-misc'
Plug 'davidhalter/jedi-vim'
Plug 'Yggdroot/indentLine'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'connorholyday/vim-snazzy'
Plug 'patstockwell/vim-monokai-tasty'
Plug 'vim-scripts/Ambient-Color-Scheme'
Plug 'ErichDonGubler/vim-sublime-monokai'
Plug 'srcery-colors/srcery-vim'

call plug#end()
"
" Required:
filetype plugin indent on

set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8
set bomb
set binary
set noshowmode
colorscheme srcery
" let g:molokai_original=1
"" Fix backspace indent
set backspace=indent,eol,start

"" Tabs. May be overridden by autocmd rules
set tabstop=4
set softtabstop=0
set shiftwidth=4
set expandtab

"" Map leader to ,
let mapleader=','

"" Enable hidden buffers
set hidden

"" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase

"" Directories for swp files
set nobackup
set noswapfile
set fileformats=unix,dos,mac

syntax on
set ruler
set number
set relativenumber

" vim-airline
let g:airline_theme = 'minimalist'
let g:airline#extensions#syntastic#enabled = 1
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tagbar#enabled = 1
let g:airline_skip_empty_sections = 1

cnoreabbrev W! w!
cnoreabbrev Q! q!
cnoreabbrev Qall! qall!
cnoreabbrev Wq wq
cnoreabbrev Wa wa
cnoreabbrev wQ wq
cnoreabbrev WQ wq
cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev Qall qall

let g:NERDTreeChDirMode=2
let g:NERDTreeIgnore=['\.rbc$', '\~$', '\.pyc$', '\.db$', '\.sqlite$', '__pycache__']
let g:NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$', '\.bak$', '\~$']
let g:NERDTreeShowBookmarks=1
let g:NERDTreeMapOpenInTabSilent = '<RightMouse>'
let g:NERDTreeWinSize = 40
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,*.db,*.sqlite
nnoremap <silent> <F2> :NERDTreeFind<CR>
nnoremap <silent> <C-n> :NERDTreeToggle<CR>

" grep.vim
nnoremap <silent> <leader>f :Rgrep<CR>
let Grep_Default_Options = '-IR'
let Grep_Skip_Files = '*.log *.db'
let Grep_Skip_Dirs = '.git node_modules'

"" Split
noremap <Leader>h :<C-u>split<CR>
noremap <Leader>v :<C-u>vsplit<CR>

"" Git
noremap <Leader>ga :Gwrite<CR>
noremap <Leader>gc :Gcommit<CR>
noremap <Leader>gsh :Gpush<CR>
noremap <Leader>gll :Gpull<CR>
noremap <Leader>gs :Gstatus<CR>
noremap <Leader>gb :Gblame<CR>
noremap <Leader>gd :Gvdiff<CR>
noremap <Leader>gr :Gremove<CR>

noremap gj :YcmCompleter GoTo<CR>
noremap <Leader>c :Commentary<CR>
" snippets
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<c-b>"
let g:UltiSnipsEditSplit="vertical"

" syntastic
let g:syntastic_enable_signs=0
let g:syntastic_enable_highlighting=0
let g:syntastic_always_populate_loc_list=1
let g:syntastic_error_symbol='✗'
" let g:syntastic_warning_symbol='⚠'
let g:syntastic_style_error_symbol = '✗'
" let g:syntastic_style_warning_symbol = '⚠'
let g:syntastic_auto_loc_list=1
let g:syntastic_aggregate_errors = 1
let g:syntastic_cpp_compiler = 'g++'
let g:syntastic_cpp_compiler_options = 'std=c++17'

" Tagbar
nmap <silent> <C-j> :TagbarToggle<CR>
let g:tagbar_autofocus = 1
"
" syntastic
let g:syntastic_python_checkers=['python', 'flake8']
let g:syntastic_javascript_checkers=['eslint']
let g:syntastic_javascript_eslint_exe = '$(npm bin)/eslint'

" vim-airline
let g:airline#extensions#virtualenv#enabled = 1

" Syntax highlight
" Default highlight is better than polyglot
let g:polyglot_disabled = ['python']
let g:polyglot_disabled = ['javascript']
let g:polyglot_disabled = ['jsx']
let python_highlight_all = 1

" vim-airline
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = ''

" powerline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

" let g:indentLine_char = '|'
noremap <C-p> :FZF<CR>
noremap <Leader>n :ALEPrevious<CR> 
noremap <Leader>m :ALENext<CR> 
noremap <Leader>. :noh<CR> 
tnoremap <Esc> <C-\><C-n>

let $NVIM_TUI_ENABLE_CURSOR_SHAPE = 0
let g:python3_host_prog = '/usr/bin/python3'
let g:ale_linters = {'javascript': ['eslint']}
let g:ale_linters = {'go': ['golint']}
let g:ackprg = "ag --vimgrep"

let g:codi#interpreters = {
                   \ 'python': {
                       \ 'bin': 'python3',
                       \ 'prompt': '^\(>>>\|\.\.\.\) ',
                       \ },
                       \ }

let g:codi#width = 100
let g:jedi#use_splits_not_buffers = "right"

let g:lightline = {
\ 'colorscheme': 'snazzy',
\ }

let g:ycm_log_level = "debug"
" let g:ycm_filetype_blacklist = {
      " \ 'go': 1,
      " \}

" set list lcs=tab:\\    
