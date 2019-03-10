" Plugins

call plug#begin('~/.local/share/nvim/plugged')

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

" Unix related
Plug 'jamessan/vim-gnupg'                                           " GPG viewer
Plug 'tpope/vim-eunuch'                                             " Unix operations inside vim
Plug 'lambdalisue/suda.vim'                                         " Sudo

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
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }       " Deoplete
Plug 'zchee/deoplete-jedi'                                          " Autocomplete python
Plug 'zchee/deoplete-clang'											" Autocomplete c
Plug 'deoplete-plugins/deoplete-go', { 'do': 'make'}                " Autocomplete go

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

" set paste

" Wrapping
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
set conceallevel=0                              " conceals

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

" 80 character
" set tw=79
" set colorcolumn=80
" highlight ColorColumn ctermbg=255

set undofile                                   " Save undo's after file closes
set undodir=$HOME/.vim/undo                    " where to save undo histories
set undolevels=1000                            " How many undos
set undoreload=10000                           " number of lines to save for undo

" set nocompatible
set encoding=utf-8

" ------
" Key bindings
" ------
" Copy to clipboard
nnoremap  <leader>r  :e % <CR>

" Copy to clipboard
vnoremap  <leader>y  "+y
nnoremap  <leader>Y  "+yg_
nnoremap  <leader>y  "+y
nnoremap  <leader>yy  "+yy

" Paste from clipboard
nnoremap <leader>p "+p
nnoremap <leader>P "+P
vnoremap <leader>p "+p
vnoremap <leader>P "+P

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
map <leader>s :sort<cr>

" Replace all
nnoremap S :%s//g<Left><Left>

" Open the selected text in a split (i.e. should be a file).
map <leader>o "oyaW:sp <C-R>o<CR>
xnoremap <leader>o "oy<esc>:sp <C-R>o<CR>
vnoremap <leader>o "oy<esc>:sp <C-R>o<CR>

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

" Scrolling using arrows
" nmap <Down> 3<C-E>
" nmap <Up> 3<C-Y>
" vmap <Down> 3<C-E>
" vmap <Up> 3<C-Y>
" imap <Down> <C-O>3<C-E>
" imap <Up> <C-O>3<C-Y>

" Split navigation
nnoremap <c-h> <c-w>h
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l

" Tabs
" nnoremap <c-n> gt
" nnoremap <c-m> gT
nnoremap <c-n> :bnext<cr>
nnoremap <c-m> :bprevious<cr>

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

" C-t for new tab / buffer
" nnoremap <C-t> :tabnew<cr>
nnoremap <C-t> :enew<cr>

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
nnoremap <silent> <leader><Tab> :exe "tabn ".g:lasttab<cr>
vnoremap <silent> <leader><Tab> :exe "tabn ".g:lasttab<cr>

" Navigating with guides
" inoremap <leader>² <Esc>/<++><Enter>"_c4l
vnoremap <leader>² <Esc>/<++><Enter>"_c4l
map <leader>² <Esc>/<++><Enter>"_c4l

" FUNCTION KEYS
" AutoFromat
map <F2> :Autoformat <CR>

" Get line, word and character counts with F3:
map <F3> :!wc <C-R>%<CR>

" F4: execute code

" F5: execute code

" Spell-check picker
noremap <F6> :call <SID>ToggleSpell()<CR>

" Scrolling buffers
map <F8> :bprevious<CR>
map <F9> :bnext<CR>

" F10: Linting
map <F10> :ALEToggleBuffer<CR>

" F11: Goyo
map <F11> :Goyo<CR>:set wrap<CR>

map <F12> :TagbarToggle<CR>
" ------
" Buffer Actions
" ------
" After buffer
au BufEnter stories.md,intents* hi Error NONE

" Before saving
" Automatically deletes all tralling whitespace on save.
autocmd BufWritePre * %s/\s\+$//e
" autocmd BufWritePre *.py :Autofromat <CR>

" After saving
autocmd BufWritePost * GitGutter
autocmd BufWritePost ~/.Xresources,~/.Xdefaults !xrdb %

" Exiting
autocmd BufDelete * call airline#extensions#tabline#buflist#invalidate()

" ------
" OTHER
" ------
autocmd VimResized * :wincmd =

" ------
" Remapping
" ------

" SetTitleMatchMode,2
" #IfWinActive,VIM
"    CAPSLOCK::ESC
" return
"
" #IfWinActive
"    CAPSLOCK::CTRL
" return

" ------
" Plugins
" ------

" Easy-align
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" FuzzyFind
nnoremap <C-p> :FZF <cr>
" let $FZF_DEFAULT_COMMAND = 'ag -g ""'

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
" nnoremap <leader>f :NERDTreeToggle<CR>
nmap <silent> <Leader>f :call g:WorkaroundNERDTreeToggle()<CR>

function! g:WorkaroundNERDTreeToggle()
  try | NERDTreeToggle | catch | silent! NERDTree | endtry
endfunction

" Tagbar
nnoremap <leader>t :TagbarToggle<CR>

" Color
" let g:colorizer_auto_color = 1
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

" stage hunks
nmap <Leader>ha :GitGutterStageHunk<CR>
nmap <Leader>hr :GitGutterUndoHunk<CR>

" preview hunk's changes
nmap <Leader>hv :GitGutterPreviewHunk<CR>

" AutoFormat
let g:autoformat_retab = 0

let g:formatdef_custom_yaml = '"cat"'
let g:formatters_yaml = ["custom_yaml"]

" Deoplete
" General
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_smart_case = 1
let g:deoplete#max_list = 15
let g:deoplete#async_timeout = 100

" let deoplete#ignore_sources = {
"
" }

" yarp = true

" Disable deoplete when in multi cursor mode
function! Multiple_cursors_before()
    let b:deoplete_disable_auto_complete = 1
    " deoplete#disable()
    set foldmethod=manual
endfunction
function! Multiple_cursors_after()
    let b:deoplete_disable_auto_complete = 0
    " deoplete#enable()
    set foldmethod=syntax
endfunction

" Deoplete tab
highlight Pmenu ctermbg=8 guibg=#606060
highlight PmenuSel ctermbg=1 guifg=#dddd00 guibg=#1f82cd
highlight PmenuSbar ctermbg=0 guibg=#d6d6d6

" Deoplete
" Clang
let g:deoplete#sources#clang#libclang_path='/usr/lib/libclang.so'
let g:deoplete#sources#clang#clang_header='/usr/lib/clang'

" Indentline
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_theme="minimalist"
let g:airline#extensions#tabline#formatter = 'default'
let g:airline#extensions#tabline#fnamemod = ':t'

" Ale
let b:ale_fixers = {
\    'javascript': ['prettier', 'eslint'],
\    'python': ['black', 'autopep8', 'flake8'],
\    'go': ['golangci-lint run']
\}

let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'

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
let g:UltiSnipsSnippetDirectories = ["UltiSnips", "~/.config/nvim/snippets/"]

let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-n>"
let g:UltiSnipsJumpBackwardTrigger="<c-m>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"


" ------
" Appearance
" ------
colorscheme wombat256mod

hi SpellBad ctermfg=1 ctermbg=234
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
" Execute
" Python
autocmd FileType python call Run_Python()
fun! Run_Python()
    nnoremap <buffer> <F4> :exec '!python3.7' shellescape(@%, 1)<cr>
    nnoremap <buffer> <F5> :exec '!python3.6' shellescape(@%, 1)<cr>
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
    else
        let &spell = 0
        echo "'spell' disabled..."
    endif
endfunction
