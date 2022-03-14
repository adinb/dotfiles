" This configuration file assumes that you use Neovim (https://neovim.io)
" and will likely not work on Vim

" =================
" Plugins
" =================

" vim-plug"
" Automatically install vim-plug in the data directory.
let data_dir = stdpath('data') . '/site'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()

" Utility
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'Shougo/vimproc.vim', {'do': 'make'}
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'vim-scripts/grep.vim'
Plug 'Raimondi/delimitMate'
Plug 'tpope/vim-surround'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" Visual indicator
Plug 'vim-airline/vim-airline'
Plug 'ryanoasis/vim-devicons'
Plug 'airblade/vim-gitgutter'

" Theme
Plug 'NLKNguyen/papercolor-theme'
Plug 'vim-airline/vim-airline-themes'

" Language & syntax
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'leafgarland/typescript-vim'
Plug 'pangloss/vim-javascript'
Plug 'lervag/vimtex'
Plug 'davidhalter/jedi-vim'
Plug 'raimon49/requirements.txt.vim', {'for': 'requirements'}
Plug 'w0rp/ale'
" After installing YCM, run python3 install.py <flags> in the YCM plugin directory.
" Check the docs for details.
Plug 'Valloric/YouCompleteMe'

call plug#end()

" =================
" Appearances
" =================

syntax on
colorscheme PaperColor
let g:airline_theme = 'murmur'

" Powerline symbols
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = ''
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

" =================
" Options
" =================

filetype plugin indent on

set relativenumber
set number
set noshowmode
set cursorline
set colorcolumn=80
set ruler

" Fix backspace indent
set backspace=indent,eol,start

" Tabs. May be overridden by autocmd rules
set tabstop=4
set softtabstop=0
set shiftwidth=4
set expandtab

" Map leader to ,
let mapleader=','

" Improve search function
set hlsearch
set incsearch
set ignorecase
set smartcase

" Directories for swp files
set nobackup
set noswapfile
set fileformats=unix,dos,mac

" =================
" Plugin Configs
" =================

" vim-airline
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tagbar#enabled = 1
let g:airline_skip_empty_sections = 1

" NERDTree options
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
let Grep_Default_Options = '-IR'
let Grep_Skip_Files = '*.log *.db'
let Grep_Skip_Dirs = '.git node_modules'

" vim-airline
let g:airline#extensions#virtualenv#enabled = 1

" Ale linter
" Make sure you have the linter installed.
let g:ale_linters = {'javascript': ['eslint']}
let g:ale_linters = {'go': ['golint']}
" Disable YCM diagnostics because we're using ALE
let g:ycm_show_diagnostics_ui = 0
" Always use local .ycm_extra_conf
let g:ycm_confirm_extra_conf = 0
let g:ycm_key_list_select_completion=[]
let g:ycm_key_list_previous_completion=[]

" VimTeX
let g:vimtex_view_general_viewer = 'okular'
let g:vimtex_view_general_options = '--unique file:@pdf\#src:@line@tex'
let g:vimtex_compiler_method = 'latexrun'
let maplocalleader = ","

" =================
" Remaps
" =================
noremap <C-p> :FZF<CR>
noremap <Leader>n :ALEPrevious<CR>
noremap <Leader>m :ALENext<CR>
noremap <Leader>. :noh<CR>

" Remap ESC to exit to normal mode in terminal
tnoremap <Esc> <C-\><C-n>

" Split
noremap <Leader>h :<C-u>split<CR>
noremap <Leader>v :<C-u>vsplit<CR>

" Git
noremap <Leader>ga :Gwrite<CR>
noremap <Leader>gc :Gcommit<CR>
noremap <Leader>gsh :Gpush<CR>
noremap <Leader>gll :Gpull<CR>
noremap <Leader>gs :Gstatus<CR>
noremap <Leader>gb :Gblame<CR>
noremap <Leader>gd :Gvdiff<CR>
noremap <Leader>gr :Gremove<CR>

" noremap gj :YcmCompleter GoTo<CR>
noremap <Leader>c :Commentary<CR>

" grep.vim
nnoremap <silent> <leader>f :Rgrep<CR>

" So we can insert the command faster
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

" UltiSnips
let g:UltiSnipsExpandTrigger="<Tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" =================
" Extra Configs
" =================
let extras_dir = stdpath('config') . '/extras'
let extraFiles = glob(extras_dir . '/*', 0, 1)
if !empty(extraFiles)
  for extraFile in extraFiles
      exec "source " . extraFile
  endfor
endif
