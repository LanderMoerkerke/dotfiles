" Plugins

call plug#begin('~/.config/nvim/plugged')

" General
Plug 'junegunn/fzf', { 'dir': '~/.local/share/fzf' }                " Fuzzy Find
Plug 'junegunn/fzf.vim'                                             " Fuzzy Find
Plug 'tpope/vim-fugitive'                                           " Fuzzy Find Commits
Plug 'tpope/vim-commentary'                                         " Commenting with motions
Plug 'alvan/vim-closetag'                                           " Autoclose html tags
Plug 'Raimondi/delimitMate'                                         " Autoclose symbols
Plug 'terryma/vim-multiple-cursors'                                 " Multiple Cursors
Plug 'tpope/vim-surround'                                           " Surround
Plug 'junegunn/vim-easy-align'                                      " Easy align
Plug 'tpope/vim-repeat'                                             " Repeat custom plugins

" Unix related
Plug 'jamessan/vim-gnupg'                                            " GPG viewer
Plug 'lambdalisue/suda.vim'                                         " Sudo
Plug 'jremmen/vim-ripgrep'                                          " RipGrep

" Appearance
Plug 'mhinz/vim-startify'                                           " Fancy startup
Plug 'scrooloose/nerdtree'                                          " Nerdtree
Plug 'ryanoasis/vim-devicons'                                       " Icons
Plug 'vim-airline/vim-airline'										" Statusbar
Plug 'vim-airline/vim-airline-themes'                               " Statusbar themes
Plug 'chrisbra/Colorizer'                                           " Color codes to color
Plug 'Yggdroot/indentLine'                                          " Indent
Plug 'junegunn/goyo.vim'                                            " Distraction free
Plug 'majutsushi/tagbar'                                            " Tagbar
Plug 'lvht/tagbar-markdown'                                         " Tagbar for Markdown
Plug 'mzlogin/vim-markdown-toc'                                     " TOC for Markdown

" Git
Plug 'airblade/vim-gitgutter'                                       " Gitgutter
Plug 'rhysd/git-messenger.vim'

" Completion
Plug 'ColinKennedy/vim-python-function-expander'

Plug 'ncm2/ncm2', { 'for': 'python' }                               " Completion using NCM2
Plug 'roxma/nvim-yarp', { 'for': 'python' }
Plug 'ncm2/ncm2-path', { 'for': 'python' }
Plug 'ncm2/ncm2-bufword', { 'for': 'python' }
Plug 'ncm2/ncm2-markdown-subscope', { 'for': 'python' }
Plug 'ncm2/ncm2-ultisnips', { 'for': 'python' }
Plug 'ncm2/ncm2-jedi', { 'for': 'python' }
Plug 'ncm2/ncm2-go', { 'for': 'python' }

Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }

Plug 'Shougo/echodoc.vim', { 'for': 'python' }                     " Show doc when typing a function

" Snippets
Plug 'SirVer/ultisnips'                                             " Snippets
Plug 'honza/vim-snippets'                                           " Extra snippets

" Formatting
Plug 'Chiel92/vim-autoformat'                                       " Autoformat
Plug 'tell-k/vim-autoflake'                                         " AutoFlake

Plug 'chrisbra/csv.vim'                                             " Tabularize content

" Linting
Plug 'MoerkerkeLander/ale'                                          " Linting engine

" Filetypes / syntax
Plug 'PotatoesMaster/i3-vim-syntax'                                 " I3
Plug 'sheerun/vim-polyglot'


call plug#end()

" Leader
let mapleader = " "

" ------
" Settings
" ------

" Some basics
syntax on
filetype plugin indent on
set signcolumn=yes

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

set rtp^=~/.config/nvim
set mouse=a                                     " enable mouse
set path+=**                                    " able to search subdirs recursive
set nocompatible                                " no compatibility with old-skool vi
set wildmenu                                    " show command line completions
set wildmode=longest:full                       " complete mode for wildmenu
set wildmode+=full

set linebreak                                   " only wrap after words, not inside words
" set nowrap
set fo-=t

set noshowmode                                  " don't show the mode
set ignorecase                                  " ignore case in (search) patterns
set smartcase                                   " when the (search) pattern contains uppercase chars, don't ignore case
set hlsearch                                    " highlight all the matches for the search
set inccommand=split                            " preview commands such as sed
set t_Co=256
set showcmd

set title
set ruler
set relativenumber
set conceallevel=2                              " conceals

set autoread                                    " automatically reload the file when modified outside and not modified inside
set autowrite                                   " write the modified file when switching to another file
set hidden                                      " allow Vim to switch to another buffer while the current is not saved

set ts=4
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
set undodir=$HOME/.config/nvim/undo                    " where to save undo histories
set undolevels=1000                            " How many undos
set undoreload=10000                           " number of lines to save for undo

set encoding=utf-8

" ------
" Environment
" ------

" let g:python3_host_prog = '/usr/bin/python3.7'
let g:python3_host_prog = '/home/lander/Pipenv/python3-venv/.venv/bin/python'

" ------
" Key bindings
" ------

" Unbindings
map Q <Nop>

" Reload vim
nnoremap <leader>rv :source $NVIM<cr>

" Reload current file
nnoremap  <leader>rf  :e % <CR>

" Paste over visual but keep clipboard
vnoremap <leader>p "_dP

" Behave like other capitals
nnoremap Y y$

" Keep search matches in middle
nnoremap n nzz
nnoremap N Nzz

" Keep jumping in middle
nnoremap <C-o> <C-o>zz

" Reselect text you just entered
nnoremap gV `[v`]

map <leader><leader>c :w! \| !compiler <c-r>%<CR><CR>
map <leader><leader>o :w! \| !opout <c-r>%<CR><CR>

" Exit terminal with shift esc
tnoremap <C-\<> <C-\><C-n>
tnoremap <Esc> <C-\><C-n>

" Increment decrement under cursor
nnoremap <C-s> <C-a>

" Getting rid of the search highlights
nnoremap <esc> :noh<cr>

" Sorting selection
nnoremap <leader>s :sort<cr>
vnoremap <leader>s :sort<cr>

" Replace all
nnoremap S :%s//g<Left><Left>

" Open the selected text in a split (i.e. should be a file).
map <leader>o "oyaW:vsp <C-R>o<CR>
xnoremap <leader>o "oy<esc>:vsp <C-R>o<CR>
vnoremap <leader>o "oy<esc>:vsp <C-R>o<CR>

map <leader>O "oyaW:sp <C-R>o<CR>
xnoremap <leader>O "oy<esc>:sp <C-R>o<CR>
vnoremap <leader>O "oy<esc>:sp <C-R>o<CR>

" Folding
nnoremap <leader>z :set wrap!<cr>

" Reselect when indenting
noremap < <gv
noremap > >gv

" Move visual block
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" insert word of the line above
inoremap <C-Y> <C-C>:let @z = @"<CR>mz
			\:exec 'normal!' (col('.')==1 && col('$')==1 ? 'k' : 'kl')<CR>
			\:exec (col('.')==col('$') - 1 ? 'let @" = @_' : 'normal! yw')<CR>
			\`zp:let @" = @z<CR>a

com! DiffSaved call s:DiffWithSaved()

" ------
" Navigation
" ------

" Basic navigation
" nnoremap k gk
" nnoremap j gj

" Split navigation
nnoremap <c-h> <c-w>h
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l

" Buffers
nnoremap <c-n> :bnext<cr>
nnoremap <c-p> :bprevious<cr>

" Split
nnoremap <leader>nn :split <cr>
nnoremap <leader>vn :vsplit <cr>

" Resize windows using arrow keys
noremap <up>    <C-W>+
noremap <down>  <C-W>-
noremap <left>  3<C-W><
noremap <right> 3<C-W>>

" Remove buffer
nnoremap <leader>x :bp\|bd #<CR>

" Go to last active tab
au TabLeave * let g:lasttab = tabpagenr()
nnoremap <silent><leader><Tab> :exe "tabn ".g:lasttab<cr>
vnoremap <silent><leader><Tab> :exe "tabn ".g:lasttab<cr>

" ------
" Quickfix
" ------

nnoremap <leader>qq <Esc>:copen 5<CR>
nnoremap <leader>qn <Esc>:cnext<CR>
nnoremap <leader>qp <Esc>:cprev<CR>

nnoremap <leader>Qq <Esc>:lopen 5<CR>
nnoremap <leader>Qn <Esc>:lnext<CR>
nnoremap <leader>Qp <Esc>:lprev<CR>

" ------
" Function Keys
" ------

" AutoFromat
map <F1> :Autoformat <CR>

map <F2> :ALEFix<CR>

" Get line, word and character counts with F3:
map <F3> :!wc <C-R>%<CR>

" F4: execute code

" F5: execute code

" Spell-check picker
map <F6> :call <SID>ToggleSpell()<CR>

" Vimdiff current with saved buffer
map <F7> call s:DiffWithSaved()


" map <F8>
" map <F9>

" F10: Linting
map <F10> :ALEToggleBuffer<CR>

" F11: Goyo
map <F11> :Goyo<CR>:set wrap<CR>

" F12: Tagbar
map <F12> :TagbarToggle<CR>

" ------
" Buffer Actions
" ------

" Before saving
autocmd BufWritePre * %s/\s\+$//e                   " deletes tralling whitespace on save

autocmd BufWritePre *.go,*.jsd ALEFix           " format
autocmd BufWritePre *.py ALEFix isort black

" After saving
autocmd BufWritePost * GitGutter
autocmd BufWritePost ~/.Xresources,~/.Xdefaults !xrdb %
autocmd BufWritePost .snippets :call UltiSnips#RefreshSnippets()<cr>
autocmd BufWritePost *sxhkdrc !pkill -USR1 sxhkd
autocmd BufWritePost *dwmbar-launch !killall dwmbar-launch; setsid dwmbar-launch &

" Exiting
autocmd BufDelete * call airline#extensions#tabline#buflist#invalidate()

autocmd VimLeave *.tex !texclear %

" ------
" Templates
" ------

autocmd BufNewFile *.html r ~/.config/nvim/templates/skeleton.html
autocmd BufNewFile *.go r ~/.config/nvim/templates/skeleton.go
autocmd BufNewFile *.py r ~/.config/nvim/templates/skeleton.py

" ------
" Other
" ------

" Resize vim
autocmd VimResized * :wincmd =

" Add todo
nnoremap <leader><leader>t OTODO:<Esc>:Commentary<CR>A

" ------
" Plugins
" ------

" Fugitive
nnoremap <leader>ga  :Git add %:p<CR><CR>
nnoremap <leader>gbl :Gblame<CR>
nnoremap <leader>gbr :Git branch<Space>
nnoremap <leader>gc  :Gcommit -v -q<CR>
nnoremap <leader>gd  :Gdiff<CR>
nnoremap <leader>ge  :Gedit<CR>
nnoremap <leader>gl  :silent! Glog<CR>:bot copen<CR>
nnoremap <leader>gm  :Gmove<Space>
nnoremap <leader>go  :Git checkout<Space>
nnoremap <leader>gp  :Ggrep<Space>
nnoremap <leader>gr  :Gread<CR>
nnoremap <leader>gs  :Gstatus<CR>
nnoremap <leader>gt  :Gcommit -v -q %:p<CR>
nnoremap <leader>gw  :Gwrite<CR><CR>

" Git messenger
let g:git_messenger_always_into_popup = 1

" RipGrep
nnoremap <Leader>rg :Rg<Space>
vnoremap <Leader>rg <C-w>:Rg<Space>
let g:rg_highlight = 1

" Easy-align
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" Polyglot
let g:polyglot_disabled = ['markdown']

" FuzzyFind
nnoremap <leader>p :FZF <cr>
nnoremap <leader>P :Buffers <cr>

" Esc closes FZF
au TermOpen * tnoremap <Esc> <c-\><c-n>
au FileType fzf tunmap <Esc>

" Echodoc
" set cmdheight=2
let g:echodoc#enable_at_startup = 1
let g:echodoc#type = 'signature'

" Commenting
nnoremap <C-c> :Commentary<cr>
vnoremap <C-c> :Commentary<cr>
inoremap <C-c> <Esc>:Commentary<cr>A

" nnoremap <C-S> :Snippets<cr>
" inoremap <C-S> <Esc>:Snippets<cr>

" DelimitMate
let g:delimitMate_autoclose = 1
let g:delimitMate_matchpairs = "(:),[:],{:}"
let g:delimitMate_jump_expansion = 1
let g:delimitMate_expand_space = 1
let g:delimitMate_expand_cr = 2
let g:delimitMate_expand_inside_quotes = 1

" Nerdtree
let NERDTreeShowHidden=1
let g:NERDTreeWinSize=25
let NERDTreeBookmarksFile=expand('~/.config/nvim/NERDTreeBookmarks.txt')

nmap <silent> <Leader>f :call g:WorkaroundNERDTreeToggle()<CR>

function! g:WorkaroundNERDTreeToggle()
  try | NERDTreeToggle | catch | silent! NERDTree | endtry
endfunction

" disables keybindings when focussing on nerdtree
autocmd FileType nerdtree noremap <buffer> <c-n> <nop>
autocmd FileType nerdtree noremap <buffer> <c-p> <nop>

" Tagbar
nnoremap <leader>t :TagbarToggle<CR>

" Color
let g:colorizer_auto_filetype='html,css,xdefaults,i3'

" Multiple Cursors
let g:multi_cursor_use_default_mapping=0

let g:multi_cursor_select_all_word_key = '<A-a>'
let g:multi_cursor_start_key           = 'g<C-a>'
let g:multi_cursor_select_all_key      = 'g<A-a>'
let g:multi_cursor_next_key            = '<C-a>'
let g:multi_cursor_prev_key            = '<A-z>'
let g:multi_cursor_skip_key            = '<C-z>'
let g:multi_cursor_quit_key            = '<Esc>'

" Indentline
let g:indentLine_color_tty_light = 200  " (default: 4)
let g:indentLine_color_dark      = 210  " (default: 2)
" let g:indentLine_setConceal      = 0    " (default: 2)

" ToC markdown
let g:vmt_fence_text = 'TOC'
let g:vmt_fence_closing_text = '/TOC'
let g:vmt_list_item_char = "-  "

" GitGutter
let g:gitgutter_max_signs = 1000
let g:gitgutter_preview_win_floating = 1

" fold changes
nnoremap ghf :GitGutterFold<CR>

" navigate to hunks
nnoremap ghn :GitGutterNextHunk<CR>
nnoremap ghp :GitGutterPrevHunk<CR>

" stage hunks
nmap <Leader>ha :GitGutterStageHunk<CR>
nmap <Leader>hr :GitGutterUndoHunk<CR>

" preview hunk's changes
nmap <Leader>hv :GitGutterPreviewHunk<CR>

" AutoFormat
let g:autoformat_retab = 0

let g:formatdef_custom_yaml = '"cat"'
let g:formatters_yaml = ["custom_yaml"]

" let g:formatdef_custom_python = '"autopep8 --global-config ~/.config/.pycodestyle"'
" let g:formatters_python = ["custom_python"]

" Indentline
let g:airline#extensions#tabline#enabled = 1
" let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline_powerline_fonts = 1
let g:airline_theme="minimalist"

" let g:airline#extensions#tabline#ignore_bufadd_pat = ""

let g:airline_section_c =
      \"%{bufnr('%')}: ".
      \"%<%f%m %#__accent_red#".
      \"%{airline#util#wrap(airline#parts#readonly(),0)}%#__restore__#"

let g:airline#extensions#wordcount#formatter#default#fmt = '%d w'

let g:airline#parts#ffenc#skip_expected_string='utf-8[unix]'

let g:airline#extensions#virtualenv#enabled = 0
let g:airline#extensions#branch#enabled = 0
let g:airline#extensions#tagbar#enabled = 0
let g:airline#extensions#vimagit#enabled = 0
let g:airline#extensions#hunks#enabled = 0

let g:airline#extensions#tabline#formatter = 'default'
let g:airline#extensions#tabline#fnamemod = ':t'

" ALE
let g:ale_set_highlights = 0

let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_enter = 0
let g:ale_lint_fix_on_save = 0

let g:ale_completion_enabled = 0

let g:ale_python_autoflake_options = '--expand-star-imports --remove-all-unused-imports --remove-unused-variables --remove-duplicate-keys -s'

let g:ale_linters = {'python': ['flake8'], 'javascript': ['eslint'], 'go': ['golint']}
let g:ale_fixers = {
    \ 'cpp': ['clang-format'],
    \ 'cs':  ['uncrustify'],
    \ 'css': ['stylelint', 'prettier'],
    \ 'go': ['gofmt', 'goimports', 'gomod'],
    \ 'html': ['prettier'],
    \ 'javascript': ['eslint', 'prettier'],
    \ 'json': ['fixjson', 'prettier'],
    \ 'markdown': ['remark'],
    \ 'python': ['autoflake', 'isort', 'black'],
    \ 'rust': ['rustfmt'],
    \ 'sh': ['shfmt'],
    \ 'sql': ['pgformatter'],
    \ 'xml': ['xmllint'],
\}

let g:ale_python_black_options = "-l 120"

" golangci-lint run
" remark
let g:ale_sign_column_always = 1
let g:ale_set_signs = 0

let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[ALE %linter%] %s [%severity%]'

" Autoflake
let g:autoflake_cmd = expand("~/Pipenv/neovim/.venv/bin/autoflake")
let g:autoflake_remove_all_unused_imports=1
let g:autoflake_remove_unused_variables=1
let g:autoflake_disable_show_diff=1

" LanguageClient

let g:LanguageClient_hasSnippetSupport = 1

let g:LanguageClient_hoverPreview = 'Always'

let g:LanguageClient_diagnosticsList = "Disabled"
let g:LanguageClient_diagnosticsDisplay = {
\        1: {
\            "name": "Error",
\            "texthl": "ALEError",
\            "signText": "!",
\            "signTexthl": "ALEErrorSign",
\            "virtualTexthl": "LCError",
\        },
\        2: {
\            "name": "Warning",
\            "texthl": "ALEWarning",
\            "signText": "*",
\            "signTexthl": "ALEInfoSign",
\            "virtualTexthl": "LCWarning",
\        },
\        3: {
\            "name": "Information",
\            "texthl": "ALEInfo",
\            "signText": "i",
\            "signTexthl": "ALEInfoSign",
\            "virtualTexthl": "Todo",
\        },
\        4: {
\            "name": "Hint",
\            "texthl": "ALEInfo",
\            "signText": "?",
\            "signTexthl": "ALEInfoSign",
\            "virtualTexthl": "None",
\        },
\    }

let g:LanguageClient_serverCommands = {
            \ 'c':          ['clangd'],
            \ 'cpp':        ['clangd'],
            \ 'css':        ['css-languageserver', '--stdio'],
            \ 'dockerfile': ['docker-langserver', '--stdio'],
            \ 'go':         ['go-langserver'],
            \ 'html':       ['html-languageserver', '--stdio'],
            \ 'json':       ['json-languageserver', '--stdio'],
            \ 'python':     ['pyls', '-v', '--log-file', '/tmp/pyls.log'],
            \ 'rust':       ['rls'],
            \ 'sh':         ['bash-language-server', 'start'],
            \ 'sql':        ['sql-language-server', 'up', '--method', 'stdio'],
            \ 'yaml':       ['yaml-language-server', '--stdio']
\ }

function LC_maps()
    if has_key(g:LanguageClient_serverCommands, &filetype)
        nnoremap <silent> gh :call LanguageClient#textDocument_hover()<CR>
        nnoremap <silent> gD :call LanguageClient#textDocument_definition({'gotoCmd': 'vsplit'})<CR>zz
        nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>zz
        nnoremap <silent> gr :call LanguageClient#textDocument_references()<CR>
        nnoremap <silent> gx :call LanguageClient_contextMenu()<CR>
        nnoremap <leader>rn :call LanguageClient#textDocument_rename()<CR>
        " nnoremap <leader>lf :call LanguageClient#textDocument_formatting()<CR>
        nnoremap <leader>lt :call LanguageClient#textDocument_typeDefinition()<CR>
        nnoremap <leader>la :call LanguageClient_workspace_applyEdit()<CR>
        nnoremap <leader>lc :call LanguageClient#textDocument_completion()<CR>
        nnoremap <leader>ls :call LanguageClient_textDocument_documentSymbol()<CR>
    endif
endfunction

autocmd FileType * call LC_maps()

" NCM2
autocmd BufEnter * call ncm2#enable_for_buffer()

let g:ncm2#popup_delay = 211
let g:ncm2#complete_delay = 61
let g:ncm2#popup_limit = 21
let g:ncm2#total_popup_limit = 41

let g:UltiSnipsRemoveSelectModeMappings = 1
inoremap <silent> <expr> <CR> ncm2_ultisnips#expand_or("\<CR>", 'n')
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <C-Tab> ncm2#complete()

let g:UltiSnipsExpandTrigger		= "<tab>"
let g:UltiSnipsJumpForwardTrigger	= "<c-j>"
let g:UltiSnipsJumpBackwardTrigger	= "<c-k>"
inoremap <silent> <expr> <CR> ncm2_ultisnips#expand_or("\<CR>", 'n')

" highlight Pmenu ctermbg=8 guibg=#606060
" highlight PmenuSel ctermbg=1 guifg=#dddd00 guibg=#1f82cd
" highlight PmenuSbar ctermbg=0 guibg=#d6d6d6

" Python Function Expander
nmap <leader>ya <Plug>(trimmer-mapping)

" ------
" Snippets
" ------

let g:UltiSnipsUsePythonVersion = 3
let g:UltiSnipsSnippetDirectories = ["~/.config/nvim/snippets/", "UltiSnips"]

" Edit custom snippets
nnoremap <leader>e :UltiSnipsEdit<cr>
let g:UltiSnipsEditSplit="vertical"

" General autocomplete variables
let g:snips_author = "Lander Moerkerke"
let g:snips_email = "lander.moerkerke@telenet.be"
let g:snips_github = "https://github.com/MoerkerkeLander"

" ------
" Appearance
" ------

colorscheme              minimalist
" colorscheme wombat256mod

hi clear                 SpellBad
hi SpellBad              ctermfg=203   ctermbg=233

hi LCError               ctermfg=203   ctermbg=233
hi LCWarning             ctermfg=230   ctermbg=24
" hi LCWarning             ctermfg=7     ctermbg=233

hi IndentGuidesOdd       guibg=red     ctermbg=3
hi IndentGuidesEven      guibg=green   ctermbg=4
hi CursorLineNr          guifg=yellow  ctermfg=11
hi Visual                ctermfg=black ctermbg=244

hi GitGutterAdd          ctermbg=150   ctermfg=black
hi GitGutterChange       ctermbg=74    ctermfg=black
hi GitGutterDelete       ctermbg=167   ctermfg=black
hi GitGutterChangeDelete ctermbg=74    ctermfg=black

" ------
" Commands
" ------

command! W w suda://%

" ------
" Functions
" ------

function! s:DiffWithSaved()
    let filetype=&ft
    diffthis
    vnew | r # | normal! 1Gdd
    diffthis
    exe "setlocal bt=nofile bh=wipe nobl noswf ro ft=" . filetype
endfunction

augroup autocommands
    " Execute
    " Python
    autocmd FileType python call Run_Python()
    fun! Run_Python()
        let g:LanguageClient_settingsPath=expand('~/.config/nvim/language_server/settings-python.json')

        nnoremap <buffer> <F5> :exec '!python3.7' shellescape(@%, 1)<cr>
    endf

    " Go
    autocmd FileType go call Run_Go()
    fun! Run_Go()
        let g:LanguageClient_settingsPath=expand('~/.config/nvim/language_server/settings-go.json')

        nnoremap <buffer> <F5> :exec '!go run' shellescape(@%, 1)<cr>
    endf

    " JS
    autocmd FileType javascript call Run_Js()
    fun! Run_Js()
        nnoremap <buffer> <F5> :exec '!node' shellescape(@%, 1)<cr>
    endf

    " shell
    autocmd FileType sh call Run_Sh()
    fun! Run_Sh()
        nnoremap <buffer> <F5> :exec '!sh' shellescape(@%, 1)<cr>
    endf

    " CPP
    autocmd FileType cpp call Run_CPP()
    fun! Run_CPP()
        nnoremap <buffer> <F5> :exec '!g++ % -o run && ./run' shellescape(@%, 1)<cr>
    endf

    " Rust
    autocmd FileType rust call Run_Rust()
    fun! Run_Rust()
        let g:LanguageClient_settingsPath=expand('~/.config/nvim/language_server/settings-rust.json')

        nnoremap <buffer> <F5> :exec '!rustc % -o run && ./run' shellescape(@%, 1)<cr>
    endf

    " Spellcheck
    function! <SID>ToggleSpell()
        let spelllang_list = ['nl', 'en', 'fr']
        let string = []

        for i in range(len(spelllang_list))
            call add(string, i+1 . ") " . spelllang_list[i])
        endfor

        if ! &spell
            let &spell = 1
            let selection = inputlist(string)
            let &spelllang = spelllang_list[selection-1]
            set spellfile=./nl.utf-8.add
        else
            let &spell = 0
            echo "'spell' disabled..."
        endif
    endfunction
augroup END

" ------
" Functions
" ------

if &diff
    set cursorline
    map ] ]c
    map [ [c

    map <leader>sl :diffget LO<cr>
    map <leader>sr :diffget RE<cr>

    let g:LanguageClient_diagnosticsEnable = 0
endif
