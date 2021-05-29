" Leader
let mapleader = ' '

" Some basics
syntax on
filetype plugin indent on
set signcolumn=yes
set termguicolors

set showtabline=2
set number
set clipboard+=unnamedplus
set noswapfile
set nobackup

set laststatus=2                                " always show the statusline

" set nofoldenable								" disable folding
set foldmethod=marker
" set foldnestmax=2
" set foldlevel=1
set foldlevelstart=20

set completeopt=noinsert,menuone,noselect       " completion menu actions
set shortmess+=c                                " surpress match x of x msg

set mouse=a                                     " enable mouse
" set path+=**                                    " able to search subdirs recursive
set wildmode=longest,full                       " complete mode for wildmenu

set linebreak                                   " only wrap after words, not inside words
set textwidth=0
" set nowrap

set noshowmode                                  " don't show the mode
set ignorecase                                  " ignore case in (search) patterns
set smartcase                                   " when the (search) pattern contains uppercase chars, don't ignore case
set hlsearch                                    " highlight all the matches for the search
set inccommand=split                            " preview commands such as sed
set showcmd

set title
set ruler
set relativenumber
" set conceallevel=2                              " conceals

set autoread                                    " automatically reload the file when modified outside and not modified inside
set autowrite                                   " write the modified file when switching to another file
set hidden                                      " allow Vim to switch to another buffer while the current is not saved

set expandtab                                   " expand tabs to spaces
set formatoptions+=r                            " automatic formatting: auto insert current comment leader after enter
set tabstop=4                                   " number of spaces that a tab counts for
set softtabstop=0 expandtab                     " number of spaces that a tab counts for while editing
set shiftwidth=4                                " number of spaces to use for each step of indent
set smarttab                                    " Handle tabs more intelligently"
set autoindent                                  " automatically indent a new line
set showmatch

set shiftround                                  " rounds indent to a multiple of shiftwidth"
set tags=./tags;
set splitright
set splitbelow

set undofile                                   " Save undo's after file closes
set undodir=$XDG_CACHE_HOME/nvim/undo          " where to save undo histories
set undolevels=1000                            " How many undos
set undoreload=10000                           " number of lines to save for undo

" ------
" Environment
" ------

let g:python_host_prog = '/home/lander/Documents/Pipenv/python2-venv/.venv/bin/python'
" let g:python3_host_prog = '/home/lander/Pipenv/python38-venv/.venv/bin/python'
