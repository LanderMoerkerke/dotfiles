" Plugins

call plug#begin('~/.local/share/nvim/plugged')

Plug 'jamessan/vim-gnupg'                                           " GPG viewer

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }   " Fuzzy Find
Plug 'junegunn/fzf.vim'

Plug 'tpope/vim-fugitive'                                           " Fuzzy Find Commits

Plug 'scrooloose/nerdtree'                                          " nerdtree
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'                      " nerdtree colors
Plug 'Xuyuanp/nerdtree-git-plugin'                                  " nerdtree git

Plug 'tomtom/tcomment_vim'                                          " commenting with g <

Plug 'alvan/vim-closetag'                                           " autoclose html tags
Plug 'Raimondi/delimitMate'                                         " autoclose symbols

" Plug 'itchyny/lightline.vim'                                        " Light statusbar
Plug 'vim-airline/vim-airline'										" Statusbar
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'terryma/vim-multiple-cursors'                                 " Multiple Cursors

Plug 'tpope/vim-eunuch'                                             " Unix operations inside vim

Plug 'tpope/vim-surround'                                           " Surround

Plug 'Yggdroot/indentLine'                                          " indent

Plug 'airblade/vim-gitgutter'                                       " gitgutter

Plug 'mhinz/vim-startify'                                           " Fancy startup

Plug 'junegunn/goyo.vim'                                            " Distraction free

Plug 'amix/vim-zenroom2'                                            " iA emulator

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }       " Deoplete
Plug 'zchee/deoplete-jedi'                                          " autocomplete python
Plug 'zchee/deoplete-clang'											" autocomplete c

Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'

Plug 'SirVer/ultisnips'

Plug 'honza/vim-snippets'

Plug 'lambdalisue/suda.vim'                                         " sudo

Plug 'scrooloose/syntastic'                                         " syntax highlight

Plug 'Chiel92/vim-autoformat'                                       " autoformat
Plug 'tell-k/vim-autopep8'											" autopep8 formatter

Plug 'KabbAmine/zeavim.vim'											" Zeal integration

Plug 'python-mode/python-mode', { 'branch': 'develop' }

" Filetypes / syntax
Plug 'leafgarland/typescript-vim'                                   " typescript
Plug 'PotatoesMaster/i3-vim-syntax'                                 " i3

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

set rtp^=~/.config/nvim
set mouse-=a                                    " disable mouse
set path+=**                                    " able to search subdirs recursive
set nocompatible                                " no compatibility with old-skool vi
set wildmenu                                    " show command line completions
set wildmode=longest:full                       " complete mode for wildmenu
set wildmode+=full

" set paste

" Wrapping
" set linebreak                                   " only wrap after words, not inside words
set nowrap
set fo-=t

set ignorecase                                  " ignore case in (search) patterns
set smartcase                                   " when the (search) pattern contains uppercase chars, don't ignore case
set hlsearch                                    " highlight all the matches for the search
set t_Co=256
set showcmd

set title
set ruler
set relativenumber

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

" Exit terminal with shift esc
tnoremap <C-²> <C-\\><C-n>

" Increment decrement under cursor
nnoremap <C-s> <C-a>

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
vnoremap < <gv
vnoremap > >gv

" Move visual block
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" ------
" Navigation
" ------

" Basic navigation
" nnoremap K 5k
" nnoremap J 5j
" nnoremap L 5l
" nnoremap H 5h

" Scrolling using arrows
nmap <Down> 3<C-E>
nmap <Up> 3<C-Y>
vmap <Down> 3<C-E>
vmap <Up> 3<C-Y>
imap <Down> <C-O>3<C-E>
imap <Up> <C-O>3<C-Y>

" Split navigation
nnoremap <c-h> <c-w>h
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l
nnoremap <c-n> gt
nnoremap <c-m> gT

" Split
nnoremap <leader>nn :split <cr>
nnoremap <leader>vn :vsplit <cr>

" Simpler resize
nnoremap <silent> <Leader>v+ :vertical resize +5<CR>
nnoremap <silent> <Leader>v- :vertical resize -5<CR>

nnoremap <silent> <Leader>n+ :res +5<CR>
nnoremap <silent> <Leader>n- :res -5<CR>

" C-T for new tab
nnoremap <C-t> :tabnew<cr>

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

" F10: SyntasticToggleMode

" ------
" Buffer Actions
" ------

" Before saving
" Automatically deletes all tralling whitespace on save.
autocmd BufWritePre * %s/\s\+$//e
" autocmd BufWritePre *.py :Autofromat <CR>

" After saving
autocmd BufWritePost * GitGutter

" Exiting
autocmd BufDelete * call airline#extensions#tabline#buflist#invalidate()

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

" FuzzyFind
nnoremap <C-p> :FZF <cr>
" let $FZF_DEFAULT_COMMAND = 'ag -g ""'

" Commenting
nnoremap <C-c> :TComment<cr>
vnoremap <C-c> :TComment<cr>
inoremap <C-c> <Esc>:TComment<cr>A

" DelimitMate
let g:delimitMate_autoclose = 1
let g:delimitMate_matchpairs = "(:),[:],{:},<:>"
let g:delimitMate_jump_expansion = 1
let g:delimitMate_expand_space = 1
let g:delimitMate_expand_cr = 2
let g:delimitMate_expand_inside_quotes = 1

" Nerdtree
nnoremap <leader>f :NERDTreeToggle<CR>


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

" GitGutter
let g:gitgutter_max_signs = 1000

" AutoFormat
let g:autoformat_retab = 0

" Deoplete
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_smart_case = 1
let g:deoplete#max_list = 8
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
" imap <expr><TAB>
"			\ pumvisible() ? "\<C-n>" :
"			\ neosnippet#expandable_or_jumpable() ?
"			\    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
" smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
"			\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
"
" imap <expr><silent><CR> pumvisible() ? deoplete#mappings#close_popup() .
"			\ "\<Plug>(neosnippet_jump_or_expand)" : "\<CR>"
" smap <silent><CR> <Plug>(neosnippet_jump_or_expand)

highlight Pmenu ctermbg=8 guibg=#606060
highlight PmenuSel ctermbg=1 guifg=#dddd00 guibg=#1f82cd
highlight PmenuSbar ctermbg=0 guibg=#d6d6d6


" Neosnippet
let g:neosnippet#snippets_directory='~/.config/nvim/snippets'
let g:neosnippet#enable_snipmate_compatibility = 1
let g:neosnippet#disable_runtime_snippets = {'_' : 1,}

" inoremap <c-space> pumvisible() ? "\<C-n>" : "\<Tab>"
" imap <expr><CR> neosnippet#expandable() ? "\<Plug>(neosnippet_expand)" : pumvisible() ?
" \ "\<C-y>" : "\<CR>"
" inoremap <silent><expr> <TAB>
"                 \ pumvisible() ? "\<C-n>" :
"                 \ <SID>check_back_space() ? "\<TAB>" :
"                 \ deoplete#mappings#manual_complete()
"                 function! s:check_back_space() abort
"                 let col = col('.') - 1
"                 return !col || getline('.')[col - 1]  =~ '\s'
"                 endfunction
"
" imap <expr><TAB> pumvisible() ? "\<C-n>" : neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
" smap <expr><TAB> neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" Syntastic
" let g:syntastic_quiet_messages = { "!level": "errors" }
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 1

 silent! nmap <F10> :SyntasticToggleMode<CR>

" python
 let g:syntastic_python_flake8_args='--ignore=E501'

" js
" let g:syntastic_javascript_checkers=['eslint']
" let g:syntastic_debug=3
let g:syntastic_javascript_checkers = ['eslint']
" let g:syntastic_javascript_eslint_exe = 'npm run lint --'

" Indentline
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_theme="minimalist"
let g:airline#extensions#tabline#formatter = 'default'
let g:airline#extensions#tabline#fnamemod = ':t'

" let g:airline_theme="base16-spacemacs"


" Pymode
let g:pymode_options_colorcolumn = 0
let g:pymode_python = 'python3'
let g:pymode_rope_goto_defination_bind = '<C-g>'

" ------
" Snippets
" ------
" let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

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

