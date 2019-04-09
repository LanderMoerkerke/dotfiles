" Plugins

call plug#begin('~/.config/nvim/plugged')

" General
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }   " Fuzzy Find
Plug 'junegunn/fzf.vim'                                             " Fuzzy Find
Plug 'tpope/vim-fugitive'                                           " Fuzzy Find Commits
Plug 'tomtom/tcomment_vim'                                          " Commenting with g <
Plug 'alvan/vim-closetag'                                           " Autoclose html tags
Plug 'Raimondi/delimitMate'                                         " Autoclose symbols
Plug 'terryma/vim-multiple-cursors'                                 " Multiple Cursors
Plug 'tpope/vim-surround'                                           " Surround
Plug 'KabbAmine/zeavim.vim'											" Zeal integration
Plug 'junegunn/vim-easy-align'                                      " Easy align
Plug 'tpope/vim-repeat'                                             " Repeat custom plugins

" Unix related
Plug 'jamessan/vim-gnupg'                                           " GPG viewer
Plug 'tpope/vim-eunuch'                                             " Unix operations inside vim
Plug 'lambdalisue/suda.vim'                                         " Sudo
Plug 'jremmen/vim-ripgrep'                                          " RipGrep

" Appearance
Plug 'mhinz/vim-startify'                                           " Fancy startup
Plug 'scrooloose/nerdtree'                                          " Nerdtree
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'                      " Nerdtree colors
Plug 'Xuyuanp/nerdtree-git-plugin'                                  " Nerdtree git
Plug 'ryanoasis/vim-devicons'                                       " Icons
Plug 'vim-airline/vim-airline'										" Statusbar
Plug 'vim-airline/vim-airline-themes'                               " Statusbar themes
Plug 'chrisbra/Colorizer'                                           " Color codes to color
Plug 'Yggdroot/indentLine'                                          " Indent
Plug 'airblade/vim-gitgutter'                                       " Gitgutter
Plug 'junegunn/goyo.vim'                                            " Distraction free
Plug 'majutsushi/tagbar'                                            " Tagbar
Plug 'lvht/tagbar-markdown'                                         " Tagbar for Markdown
Plug 'mzlogin/vim-markdown-toc'                                     " TOC for Markdown

" Completion
Plug 'ColinKennedy/vim-python-function-expander'

Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }       " Deoplete
" Snippets
Plug 'SirVer/ultisnips'                                             " Snippets
Plug 'honza/vim-snippets'                                           " Extra snippets

" Formatting
Plug 'Chiel92/vim-autoformat'                                       " Autoformat
Plug 'tell-k/vim-autopep8'											" Autopep8 formatter

" Linting
Plug 'w0rp/ale'                                                     " Linting engine

" Filetypes / syntax
Plug 'leafgarland/typescript-vim'                                   " Typescript
Plug 'PotatoesMaster/i3-vim-syntax'                                 " I3

call plug#end()

" Leader
let mapleader = " "

" ------
" Settings
" ------

" Some basics
syntax on
filetype plugin indent on
let g:loaded_python3_provider=1

set showtabline=2
set number
set clipboard+=unnamedplus
set noswapfile
set nobackup

set laststatus=2                                " always show the statusline

set nofoldenable								" disable folding
set foldmethod=indent
set foldnestmax=2
set foldlevel=1

set rtp^=~/.config/nvim
set mouse-=a                                    " disable mouse
set path+=**                                    " able to search subdirs recursive
set nocompatible                                " no compatibility with old-skool vi
set wildmenu                                    " show command line completions
set wildmode=longest:full                       " complete mode for wildmenu
set wildmode+=full

set linebreak                                   " only wrap after words, not inside words
set nowrap
set fo-=t

set ignorecase                                  " ignore case in (search) patterns
set smartcase                                   " when the (search) pattern contains uppercase chars, don't ignore case
set hlsearch                                    " highlight all the matches for the search
set t_Co=256
set showcmd

set title
set ruler
" set relativenumber
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
set undodir=$HOME/.vim/undo                    " where to save undo histories
set undolevels=1000                            " How many undos
set undoreload=10000                           " number of lines to save for undo

set encoding=utf-8

" ------
" Key bindings
" ------

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

" Reselect text you just entered
nnoremap gV `[v`]

map <leader>c :w! \| !compiler <c-r>%<CR><CR>

" Exit terminal with shift esc
tnoremap <C-\<> <C-\><C-n>
tnoremap <Esc> <C-\><C-n>

" Increment decrement under cursor
nnoremap <C-w> <C-a>

" Getting rid of the search highlights
nnoremap <esc> :noh<cr>

" Sorting selection
nnoremap <leader>s :sort<cr>
vnoremap <leader>s :sort<cr>

" Replace all
nnoremap S :%s//g<Left><Left>

" Open the selected text in a split (i.e. should be a file).
map <leader>o "oyaW:sp <C-R>o<CR>
xnoremap <leader>o "oy<esc>:sp <C-R>o<CR>
vnoremap <leader>o "oy<esc>:sp <C-R>o<CR>

map <leader>O "oyaW:vsp <C-R>o<CR>
xnoremap <leader>O "oy<esc>:vsp <C-R>o<CR>
vnoremap <leader>O "oy<esc>:vsp <C-R>o<CR>

" Folding
nnoremap <leader>z :set wrap!<cr>

" Reselect when indenting
noremap < <gv
noremap > >gv

" Indent using Shift + S-Shift
nnoremap <Tab> V>gv<esc>
nnoremap <S-Tab> V<LT>gv<esc>

" Move visual block
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" ------
" Navigation
" ------

" Basic navigation
nnoremap k gk
nnoremap j gj

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

" Simpler resize
nnoremap <silent> <Leader>v+ :vertical resize +5<CR>
nnoremap <silent> <Leader>v- :vertical resize -5<CR>

nnoremap <silent> <Leader>n+ :res +5<CR>
nnoremap <silent> <Leader>n- :res -5<CR>

" Resize windows using arrow keys
noremap <up>    <C-W>+
noremap <down>  <C-W>-
noremap <left>  3<C-W><
noremap <right> 3<C-W>>

" Remove buffer
nnoremap <leader>x :bp\|bd #<CR>

" Go to tab by number
noremap <leader>1 1gt
noremap <leader>2 2gt
noremap <leader>3 3gt
noremap <leader>4 4gt
noremap <leader>5 5gt
noremap <leader>6 6gt
noremap <leader>7 7gt
noremap <leader>8 8gt
noremap <leader>9 9gt
noremap <leader>0 :tablast<cr>

" Go to last active tab
au TabLeave * let g:lasttab = tabpagenr()
nnoremap <silent><leader><Tab> :exe "tabn ".g:lasttab<cr>
vnoremap <silent><leader><Tab> :exe "tabn ".g:lasttab<cr>

" Navigating with guides
vnoremap <leader>j <Esc>/<++><Enter>"_c4l
nnoremap <leader>j <Esc>/<++><Enter>"_c4l

vnoremap <leader>k <Esc>?<++><Enter>"_c4l
nnoremap <leader>k <Esc>?<++><Enter>"_c4l

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

" map <F7>
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

" Enter buffer
au BufEnter stories.md,intents* hi Error NONE

" Before saving
autocmd BufWritePre * %s/\s\+$//e                   " deletes tralling whitespace on save
autocmd BufWritePre *.go,*.py,*.js ALEFix           " format

" After saving
autocmd BufWritePost * GitGutter
autocmd BufWritePost ~/.Xresources,~/.Xdefaults !xrdb %
autocmd BufWritePost .snippets :call UltiSnips#RefreshSnippets()<cr>

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
nnoremap <leader><leader>t OTODO:<Esc>:TComment<CR>A

" ------
" Plugins
" ------

" RipGrep
nnoremap <Leader>rg :Rg<Space>
vnoremap <Leader>rg <C-w>:Rg<Space>
let g:rg_highlight = 1
let g:rg_derive_root = 1

" Easy-align
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" FuzzyFind
nnoremap <leader>p :FZF <cr>

" Commenting
nnoremap <C-c> :TComment<cr>
vnoremap <C-c> :TComment<cr>
inoremap <C-c> <Esc>:TComment<cr>A

nnoremap <C-S> :Snippets<cr>
inoremap <C-S> <Esc>:Snippets<cr>

" DelimitMate
let g:delimitMate_autoclose = 1
let g:delimitMate_matchpairs = "(:),[:],{:},<:>"
let g:delimitMate_jump_expansion = 1
let g:delimitMate_expand_space = 1
let g:delimitMate_expand_cr = 2
let g:delimitMate_expand_inside_quotes = 1

" Nerdtree
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

" Default mapping
let g:multi_cursor_select_all_word_key = '<A-a>'
let g:multi_cursor_start_key           = 'g<C-a>'
let g:multi_cursor_select_all_key      = 'g<A-a>'
let g:multi_cursor_next_key            = '<C-a>'
let g:multi_cursor_prev_key            = '<A-z>'
let g:multi_cursor_skip_key            = '<C-z>'
let g:multi_cursor_quit_key            = '<Esc>'

" Vim Surround
" ysw word
" yss line
" ds delete
"
" Indentline
let g:indentLine_color_tty_light = 200  " (default: 4)
let g:indentLine_color_dark = 210       " (default: 2)
let g:indentLine_setConceal = 0         " (default: 2)

" GitGutter
let g:gitgutter_max_signs = 1000

" navigate to hunks
nnoremap ]h :GitGutterNextHunk<CR>
nnoremap [h :GitGutterPrevHunk<CR>

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
let g:airline#extensions#tabline#formatter = 'default'
let g:airline#extensions#tabline#fnamemod = ':t'

let g:airline_section_c =
      \"%{bufnr('%')}: ".
      \"%<%f%m %#__accent_red#".
      \"%{airline#util#wrap(airline#parts#readonly(),0)}%#__restore__#"

" ALE
let g:ale_set_quickfix = 1
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_enter = 0
let g:ale_completion_enabled = 1
let g:ale_lint_fix_on_save = 1

let g:ale_linters = {'python': ['flake8'], 'javascript': ['eslint'], 'go': ['gofmt']}
let g:ale_fixers = {'python': ['black', ], 'javascript': ['eslint'], 'go': ['golangci-lint run', 'gofmt'], 'html': ['prettier']}

let g:ale_sign_column_always = 1
let g:ale_sign_error = '!'
let g:ale_sign_warning = '*'

let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'

" LanguageClient
let g:LanguageClient_serverCommands = {
            \ 'python':     ['pyls'],
            \ 'go':         ['go-langserver'],
            \ 'dockerfile': ['docker-langserver'],
            \ 'c':          ['clangd'],
            \ 'cpp':        ['clangd'],
            \ 'sh':         ['bash-language-server'],
\ }
let g:LanguageClient_settingsPath=expand('~/.config/nvim/language_server/settings.json')

" \ 'python': ['dotnet', 'exec', '/home/lander/Programs/python-language-server/output/bin/Debug/Microsoft.Python.LanguageServer.dll'],

" let g:LanguageClient_loggingLevel="DEBUG"
" let g:LanguageClient_loggingFile=expand("~/Logs/test")

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

" Deoplete
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_smart_case = 1
let g:deoplete#max_list = 25
let g:deoplete#async_timeout = 100

" highlight Pmenu ctermbg=8 guibg=#606060
" highlight PmenuSel ctermbg=1 guifg=#dddd00 guibg=#1f82cd
" highlight PmenuSbar ctermbg=0 guibg=#d6d6d6

" Python Function Expander
nmap <leader>ya <Plug>(trimmer-mapping)  " Where `<leader>ya` is the mapping you want

" Zeal
nmap <leader>Z <Plug>Zeavim
vmap <leader>Z <Plug>ZVVisSelection
nmap gz <Plug>ZVOperator
nmap <leader><leader>z <Plug>ZVKeyDocset

" LaTeX - Biber
" let $FZF_BIBTEX_CACHEDIR = '~/.vim/'
let $FZF_BIBTEX_SOURCES = $BIB

function! s:bibtex_cite_sink(lines)
    let r=system("bibtex-cite ", a:lines)
    execute ':normal! i\cite{' . r'}'
endfunction

nnoremap <leader>b :call fzf#run({
                        \ 'source': 'bibtex-ls',
                        \ 'sink*': function('<sid>bibtex_cite_sink'),
                        \ 'up': '20%',
                        \ 'options': '--ansi  --multi --prompt "Cite> "'}) <CR><CR>

" ------
" Snippets
" ------

let g:UltiSnipsUsePythonVersion = 3
let g:UltiSnipsSnippetDirectories = ["UltiSnips", "~/.config/nvim/snippets/"]

" Edit custom snippets
nnoremap <leader>e :UltiSnipsEdit<cr>
let g:UltiSnipsEditSplit="vertical"

let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"

" General autocomplete variables
let g:snips_author = "Lander Moerkerke"
let g:snips_email = "lander.moerkerke@telenet.be"
let g:snips_github = "https://github.com/MoerkerkeLander"

" ------
" Appearance
" ------

colorscheme minimalist
" colorscheme wombat256mod

hi clear SpellBad
hi SpellBad ctermfg=203
hi SpellBad cterm=underline

hi SpellCap ctermfg=1 ctermbg=234
hi IndentGuidesOdd  guibg=red   ctermbg=3
hi IndentGuidesEven guibg=green ctermbg=4
hi CursorLineNr guifg=yellow ctermfg=11
hi Visual gui=NONE guibg=White guifg=Black ctermfg=7 ctermbg=12

" ------
" Commands
" ------

command! W w suda://%

" ------
" Functions
" ------

augroup autocommands
    " Execute
    " Python
    autocmd FileType python call Run_Python()
    fun! Run_Python()
        nnoremap <buffer> <F4> :exec '!python3.7' shellescape(@%, 1)<cr>
        nnoremap <buffer> <F5> :exec '!pipenv run python' shellescape(@%, 1)<cr>
    endf

    " Go
    autocmd FileType go call Run_Go()
    fun! Run_Go()
        nnoremap <buffer> <F5> :exec '!go run' shellescape(@%, 1)<cr>
    endf

    " JS
    autocmd FileType javascript call Run_Js()
    fun! Run_Js()
        nnoremap <buffer> <F5> :exec '!node' shellescape(@%, 1)<cr>
    endf

    " CPP
    autocmd FileType cpp call Run_CPP()
    fun! Run_CPP()
        nnoremap <buffer> <F5> :exec '!g++ % -o run && ./run' shellescape(@%, 1)<cr>
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
