" General
Plug 'alvan/vim-closetag'                                           " Autoclose html tags
Plug 'tpope/vim-surround'                                           " Surround
Plug 'junegunn/vim-easy-align'                                      " Easy align
Plug 'tpope/vim-repeat'                                             " Repeat custom plugins
Plug 'justinmk/vim-sneak'

" Unix related
Plug 'jamessan/vim-gnupg', { 'branch': 'main' }                     " GPG viewer

" Appearance
Plug 'mhinz/vim-startify'                                           " Fancy startup
Plug 'tomasiser/vim-code-dark'                                      " Theme
Plug 'junegunn/goyo.vim'

Plug 'chrisbra/csv.vim'                                             " Tabularize content

" General NVIM support pluggins
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', {'branch': '0.1.x'}
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' }

" Filetypes / syntax
Plug 'ron-rs/ron.vim'                                               " Syntax highlighting RON
Plug 'thalesmello/lkml.vim'                                         " Syntax highlighting LookML
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}         " Syntax highlighting via Treeseitter

Plug 'knsh14/vim-github-link'                                       " Git link generation

" LSP
Plug 'neovim/nvim-lspconfig'                                        " LSP configurations
Plug 'glepnir/lspsaga.nvim'                                         " clean LSP

Plug 'seblj/nvim-echo-diagnostics'                                  " Echo diagnostics
Plug 'weilbith/nvim-lsp-smag'                                       " Smart Tags based on LSP
Plug 'hrsh7th/nvim-compe'                                           " Completion menu

Plug 'ray-x/lsp_signature.nvim'                                     " Signature popup

" Plug 'hrsh7th/vim-vsnip'
" Plug 'hrsh7th/vim-vsnip-integ'

" Formatting
Plug 'mhartington/formatter.nvim'                                   " Formatter

" Git
Plug 'lewis6991/gitsigns.nvim'                                      " Git changes in gutter

" Lualine
" Plug 'hoob3rt/lualine.nvim'
" " If you want to have icons in your statusline choose one of these
" Plug 'kyazdani42/nvim-web-devicons'
" Plug 'ryanoasis/vim-devicons'

" NVIM Tree
Plug 'kyazdani42/nvim-web-devicons'
Plug 'kyazdani42/nvim-tree.lua'
