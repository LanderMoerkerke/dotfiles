" Plugins

call plug#begin('~/.config/nvim/plugged')

" General
Plug 'junegunn/fzf'                                                 " Fuzzy Find
Plug 'junegunn/fzf.vim'                                             " Fuzzy Find
Plug 'liuchengxu/vim-clap', { 'do': ':Clap install-binary' }        " Action spawner
Plug 'tpope/vim-commentary'                                         " Commenting with motions
Plug 'alvan/vim-closetag'                                           " Autoclose html tags
Plug 'Raimondi/delimitMate'                                         " Autoclose symbols
Plug 'terryma/vim-multiple-cursors'                                 " Multiple Cursors
Plug 'tpope/vim-surround'                                           " Surround
Plug 'junegunn/vim-easy-align'                                      " Easy align
Plug 'tpope/vim-repeat'                                             " Repeat custom plugins
Plug 'airblade/vim-rooter'                                          " Change cwd

Plug 'justinmk/vim-sneak'

" Unix related
Plug 'jamessan/vim-gnupg'                                           " GPG viewer
Plug 'lambdalisue/suda.vim'                                         " Sudo
Plug 'jremmen/vim-ripgrep'                                          " RipGrep

" Appearance
Plug 'mhinz/vim-startify'                                           " Fancy startup
Plug 'scrooloose/nerdtree'                                          " Nerdtree
Plug 'ryanoasis/vim-devicons'                                       " Icons
Plug 'vim-airline/vim-airline'										" Statusbar
Plug 'vim-airline/vim-airline-themes'                               " Statusbar themes
Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' }           " Colorviewer
Plug 'Yggdroot/indentLine'                                          " Indent
Plug 'tomasiser/vim-code-dark'                                      " Theme

" Git
Plug 'airblade/vim-gitgutter'                                       " Gitgutter
Plug 'tpope/vim-fugitive'                                           " Git integration

" Completion

Plug 'roxma/nvim-yarp'

Plug 'ncm2/ncm2'                                                    " Completion using NCM2
Plug 'ncm2/ncm2-path'                                               " Completion of paths
Plug 'ncm2/ncm2-bufword'                                            " Completion of words in buffer
Plug 'ncm2/ncm2-ultisnips'                                          " Integration with UltiSnips

Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'make release',
    \ }

Plug 'liuchengxu/vista.vim'                                         " Tags visualisation

Plug 'ColinKennedy/vim-python-function-expander'                    " Expand python functions arguments
Plug 'Shougo/echodoc.vim'                                           " Show doc when typing a function

" Snippets
Plug 'SirVer/ultisnips'                                             " Snippets
Plug 'honza/vim-snippets'                                           " Extra snippets

" Formatting
Plug 'Chiel92/vim-autoformat'                                       " Autoformat

Plug 'chrisbra/csv.vim'                                             " Tabularize content
Plug 'mzlogin/vim-markdown-toc'                                     " TOC for Markdown

" Linting
Plug 'LanderMoerkerke/ale'                                          " Linting engine

" Filetypes / syntax
Plug 'sheerun/vim-polyglot'                                         " Extra syntax highlighting support

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
set nocompatible                                " no compatibility with old-skool vi
set wildmode=longest,full                       " complete mode for wildmenu

set linebreak                                   " only wrap after words, not inside words
set textwidth=0
" set nowrap
set fo-=t

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

let g:python_host_prog = '/home/lander/Pipenv/python2-venv/.venv/bin/python'
let g:python3_host_prog = '/home/lander/Pipenv/python38-venv/.venv/bin/python'

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
nnoremap <leader>S :%s//g<Left><Left>

" Count occurances under the cursor
nnoremap ,* *<C-O>:%s///gn<CR>
" nnoremap ,* *<C-O>:%s///gn<Left><Left>

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
nnoremap <up>    <C-W>+
nnoremap <down>  <C-W>-
nnoremap <left>  3<C-W><
nnoremap <right> 3<C-W>>

" Resize reset
nnoremap == :wincmd = <cr>

" Remove buffer
nnoremap <leader>x :bp\|bd #<CR>

" Go to last active tab
au TabLeave * let g:lasttab = tabpagenr()
nnoremap <silent><leader><Tab> :exe "tabn ".g:lasttab<cr>
vnoremap <silent><leader><Tab> :exe "tabn ".g:lasttab<cr>

" ------
" Quickfix
" ------

" errors of LC
nnoremap <leader>qq <Esc>:lopen 8<CR>
nnoremap <leader>qn <Esc>:lnext<CR>
nnoremap <leader>qp <Esc>:lprev<CR>

" search items of Rg
nnoremap <leader>Qq <Esc>:copen 8<CR>
nnoremap <leader>Qn <Esc>:cnext<CR>
nnoremap <leader>Qp <Esc>:cprev<CR>

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

" F12: Vista
map <F12> :Vista!!<CR>

" Add todo
nnoremap <leader><leader>t OTODO:<Esc>:Commentary<CR>A

" ------
" Plugins
" ------

" Fugitive
nnoremap <leader>ga  :Git add %:p<CR><CR>
nnoremap <leader>gbl :Gblame<CR>
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

" Git messenger
let g:git_messenger_always_into_popup = 1

" RipGrep
nnoremap <Leader>rg :Rg<Space>
vnoremap <Leader>rg <C-w>:Rg<Space>
let g:rg_highlight = 1

" Easy-align
xmap <leader>a <Plug>(EasyAlign)
nmap <leader>a <Plug>(EasyAlign)

" Polyglot
let g:polyglot_disabled = ['markdown']

" Esc closes FZF
au TermOpen * tnoremap <Esc> <c-\><c-n>
au FileType fzf tunmap <Esc>

" nnoremap <leader>p :Files<cr>
" nnoremap <leader>P :Buffers<cr>

nnoremap <leader>c :Clap <cr>
" nnoremap <Leader>rg :Clap grep<cr>

nnoremap <leader>p :Files<cr>
nnoremap <leader>P :Buffers<cr>

let g:clap_popup_input_delay = 0
let g:clap_provider_grep_delay = 0
let g:clap_provider_grep_blink = [0, 0]

let g:clap_provider_commands = {
      \ 'source': ['Clap debug', 'UltiSnipsEdit'],
      \ 'sink': { selected -> execute(selected, '')},
      \ }

" Echodoc
let g:echodoc#enable_at_startup = 1
let g:echodoc#type = 'floating'

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

" Color
let g:Hexokinase_ftEnabled = ['css', 'html', 'javascript']
let g:Hexokinase_highlighters = ['backgroundfull']

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
let g:gitgutter_preview_win_floating = 0

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
let g:airline#extensions#vista#enabled = 0

let g:airline#extensions#tabline#formatter = 'default'
let g:airline#extensions#tabline#fnamemod = ':t'

" ALE
let g:ale_disable_lsp = 1
let g:ale_set_highlights = 1

let g:ale_lint_on_text_changed = 'never'
" let g:ale_lint_on_enter = 1
let g:ale_lint_fix_on_save = 1

let g:ale_completion_enabled = 0

let g:ale_python_autoflake_options = '--expand-star-imports --remove-all-unused-imports --remove-unused-variables --remove-duplicate-keys -s'

let g:ale_linters = {
    \ 'python': ['mypy'],
    \ 'javascript': ['eslint'],
    \ 'go': ['golint']
\}

let g:ale_fixers = {
    \ 'cpp': ['clang-format'],
    \ 'cs':  ['uncrustify'],
    \ 'css': ['stylelint', 'prettier'],
    \ 'go': ['gofmt', 'goimports', 'gomod'],
    \ 'html': ['prettier'],
    \ 'javascript': ['eslint', 'prettier'],
    \ 'javascriptreact': ['eslint', 'prettier'],
    \ 'typescript': ['eslint', 'prettier'],
    \ 'typescriptreact': ['eslint', 'prettier'],
    \ 'json': ['fixjson', 'prettier'],
    \ 'markdown': ['remark'],
    \ 'python': ['autoflake', 'isort', 'black'],
    \ 'rust': ['rustfmt'],
    \ 'sh': ['shfmt'],
    \ 'sql': ['pgformatter'],
    \ 'xml': ['xmllint'],
\}

let g:ale_sh_shfmt_options = "-p -i 4 -ci"
let g:ale_python_black_options = "-l 120"
let g:ale_python_bandit_options = "-c /home/lander/.config/bandit/config.yaml"
let g:ale_javascript_prettier_options = "--tab-width 2 --print-width 120 --single-quote"

" golangci-lint run
" remark
let g:ale_sign_column_always = 1

let g:ale_set_signs = 1

let g:ale_sign_error = '>>'
let g:ale_sign_warning = '--'

let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[ALE %linter%] %s [%severity%]'

nmap <silent> gep <Plug>(ale_previous_wrap)
nmap <silent> gen <Plug>(ale_next_wrap)

" LanguageClient

let g:LanguageClient_hasSnippetSupport = 1

let g:LanguageClient_completionPreferTextEdit = 1

let g:LanguageClient_hoverPreview = 'Always'

let g:LanguageClient_diagnosticsList = "Disabled"
let g:LanguageClient_diagnosticsSignsMax = 0

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
            \ 'go':         ['gopls'],
            \ 'html':       ['html-languageserver', '--stdio'],
            \ 'javascript': ['javascript-typescript-stdio'],
            \ 'javascriptreact': ['javascript-typescript-stdio'],
            \ 'json':       ['json-languageserver', '--stdio'],
            \ 'python':     ['mspyls'],
            \ 'rust':       ['rust-analyzer'],
            \ 'sh':         ['bash-language-server', 'start'],
            \ 'sql':        ['pgls'],
            \ 'typescript': ['javascript-typescript-stdio'],
            \ 'typescriptreact': ['javascript-typescript-stdio'],
            \ 'yaml':       ['yaml-language-server', '--stdio']
\ }

function LC_maps()
    if has_key(g:LanguageClient_serverCommands, &filetype)
        nnoremap <silent> gh :call LanguageClient#textDocument_hover()<CR>
        nnoremap <silent> ga :call LanguageClient#textDocument_codeAction()<CR>
        nnoremap <silent> gl :call LanguageClient#handleCodeLensAction()<CR>
        nnoremap <silent> gs :call LanguageClient_textDocument_documentSymbol()<CR>
        nnoremap <silent> gD :call LanguageClient#textDocument_definition({'gotoCmd': 'vsplit'})<CR>zz
        nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>zz
        nnoremap <silent> gr :call LanguageClient#textDocument_references()<CR>
        nnoremap <silent> gx :call LanguageClient_contextMenu()<CR>
        nnoremap <leader>rn :call LanguageClient#textDocument_rename()<CR>
        " nnoremap <leader>lf :call LanguageClient#textDocument_formatting()<CR>
        nnoremap <leader>lt :call LanguageClient#textDocument_typeDefinition()<CR>
        nnoremap <leader>la :call LanguageClient_workspace_applyEdit()<CR>
        nnoremap <leader>lc :call LanguageClient#textDocument_completion()<CR>
        nnoremap <leader>ls :call LanguageClient#workspace_symbol()<CR>
    endif
endfunction

" NCM2

" Enable entering when popup is visible
inoremap <expr> <CR> (pumvisible() ? "\<c-y>\<cr>" : "\<CR>")

" Enable scrolling via tab
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

inoremap <silent> <expr> <CR> ncm2_ultisnips#expand_or("\<CR>", 'n')
imap <c-l> <Plug>(ultisnips_expand)

call ncm2#override_source('ultisnips', {'priority': 10})

" Python Function Expander
nmap <leader>ya <Plug>(trimmer-mapping)

" Vista

let g:vista_icon_indent = ["╰─▸ ", "├─▸ "]
let g:vista#renderer#enable_icon = 1

" ------
" Snippets
" ------

let g:UltiSnipsExpandTrigger		= "<Plug>(ultisnips_expand)"
let g:UltiSnipsJumpForwardTrigger	= "<c-j>"
let g:UltiSnipsJumpBackwardTrigger	= "<c-k>"
let g:UltiSnipsRemoveSelectModeMappings = 0

let g:UltiSnipsUsePythonVersion = 3
let g:UltiSnipsSnippetDirectories = ["UltiSnips", "~/.config/nvim/UltiSnips/"]

" Edit custom snippets
nnoremap <leader>e :UltiSnipsEdit<cr>
let g:UltiSnipsEditSplit="vertical"

" General autocomplete variables
let g:snips_author = "Lander Moerkerke"
let g:snips_email = "lander.moerkerke@telenet.be"
let g:snips_github = "https://github.com/LanderMoerkerke"

" ------
" Appearance
" ------

colorscheme              minimalist
" colorscheme              codedark
" colorscheme wombat256mod


hi SpellBad              ctermfg=203   ctermbg=233

" hi LCError               ctermfg=203   ctermbg=203
hi LCWarning             ctermfg=230   ctermbg=24
" hi LCWarning             ctermfg=7     ctermbg=233

hi IndentGuidesOdd       guibg=red     ctermbg=3
hi IndentGuidesEven      guibg=green   ctermbg=4
hi CursorLineNr          guifg=yellow  ctermfg=11
hi Visual                ctermfg=black ctermbg=244

" hi GitGutterAdd          ctermbg=150   ctermfg=black
" hi GitGutterChange       ctermbg=74    ctermfg=black
" hi GitGutterDelete       ctermbg=167   ctermfg=black
" hi GitGutterChangeDelete ctermbg=74    ctermfg=black

" ------
" Commands
" ------

command! SC vnew | setlocal nobuflisted buftype=nofile bufhidden=wipe noswapfile
command! CsvFormat %s/\ *,\ */,/g

" Save as root
command! W w suda://%

" Search snippets by name and description
command! -bar -bang Snippets call fzf#vim#snippets({'options': '-n ..'}, <bang>0)


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

function! g:WorkaroundNERDTreeToggle()
  try | NERDTreeToggle | catch | silent! NERDTree | endtry
endfunction

function! NERDTreeOnBufferOpen()
    if exists('b:noNERDTree')
        return
    endif
    call WorkaroundNERDTreeToggle()
endfun

" ------
" Autocommands
" ------

augroup basic

    " Resize vim
    autocmd VimResized * :wincmd =

    autocmd FocusGained,BufEnter,CursorHold * checktime

augroup end

augroup NERD

    au!

    " Close vim when nerdtree is last window
    autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

    autocmd VimEnter ~/.config/joplin/tmp/*,/tmp/*,~/Git/wiki,*/.git/COMMIT_EDITMSG,*.md let b:noNERDTree=1
    autocmd VimEnter * call NERDTreeOnBufferOpen()
    autocmd VimEnter * wincmd p

augroup end

augroup buffer_actions

    " Before saving
    autocmd BufWritePre * %s/\s\+$//e                   " deletes tralling whitespace on save

    autocmd BufWritePre *.go,*.js,*.rs,*.sh ALEFix           " format
    autocmd BufWritePre *.py ALEFix isort black

    " After saving
    autocmd BufWritePost * GitGutter
    autocmd BufWritePost ~/.Xresources,~/.Xdefaults !xrdb %
    autocmd BufWritePost .snippets :call UltiSnips#RefreshSnippets()<cr>
    autocmd BufWritePost *sxhkdrc !pkill -USR1 sxhkd
    autocmd BufWritePost *dwmbar-launch !killall dwmbar-launch; setsid dwmbar-launch &

    " Exiting
    autocmd BufDelete * call airline#extensions#tabline#buflist#invalidate()

augroup end

augroup templates

    autocmd BufNewFile *.html r ~/.config/nvim/templates/skeleton.html
    autocmd BufNewFile *.go r ~/.config/nvim/templates/skeleton.go
    autocmd BufNewFile *.py r ~/.config/nvim/templates/skeleton.py

augroup end

augroup plugins

    " disables keybindings when focussing on nerdtree
    autocmd FileType nerdtree noremap <buffer> <c-n> <nop>
    autocmd FileType nerdtree noremap <buffer> <c-p> <nop>

    " LanguageClient
    autocmd FileType * call LC_maps()

    " NCM2
    autocmd BufEnter * call ncm2#enable_for_buffer()
    " autocmd TextChangedI * call ncm2#auto_trigger()

augroup end

augroup external_scripts

    autocmd VimLeave *.tex !texclear %

    " Execute
    " Python
    autocmd FileType python call Run_Python()
    fun! Run_Python()
        let g:LanguageClient_settingsPath=expand('~/.config/nvim/language_server/settings-python.json')

        nnoremap <buffer> <F5> :exec '!python3' shellescape(@%, 1)<cr>
    endf

    " Go
    autocmd FileType go call Run_Go()
    fun! Run_Go()
        let g:LanguageClient_settingsPath=expand('~/.config/nvim/language_server/settings-go.json')

        nnoremap <buffer> <F5> :exec '!go run' shellescape(@%, 1)<cr>
    endf

    " JS
    autocmd FileType javascript,javascriptreact,typescript,typescriptreact call Run_Js()
    fun! Run_Js()
        set ts=2
        set tabstop=2
        set shiftwidth=2
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
        " let g:LanguageClient_settingsPath=expand('~/.config/nvim/language_server/settings-rust.json')

        nnoremap <buffer> <F5> :exec '!cargo run' shellescape(@%, 1)<cr>
    endf

    " Jinja / htmldjango
    autocmd FileType htmldjango,jinja2 call Run_jinja()
    fun! Run_jinja()
        setlocal commentstring={#%s#}
        setlocal comments=s:{#,e:#}
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

augroup end

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


function! ExpandLspSnippet()
    call UltiSnips#ExpandSnippetOrJump()
    if !pumvisible() || empty(v:completed_item)
        return ''
    endif

    " only expand Lsp if UltiSnips#ExpandSnippetOrJump not effect.
    let l:value = v:completed_item['word']
    let l:matched = len(l:value)
    if l:matched <= 0
        return ''
    endif

    " remove inserted chars before expand snippet
    if col('.') == col('$')
        let l:matched -= 1
        exec 'normal! ' . l:matched . 'Xx'
    else
        exec 'normal! ' . l:matched . 'X'
    endif

    if col('.') == col('$') - 1
        " move to $ if at the end of line.
        call cursor(line('.'), col('$'))
    endif

    " expand snippet now.
    call UltiSnips#Anon(l:value)
    return ''
endfunction

" imap <C-l> <C-R>=ExpandLspSnippet()<CR>
