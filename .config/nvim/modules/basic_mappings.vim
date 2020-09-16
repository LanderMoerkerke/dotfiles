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

" Insert word of the line above
inoremap <C-Y> <C-C>:let @z = @"<CR>mz
			\:exec 'normal!' (col('.')==1 && col('$')==1 ? 'k' : 'kl')<CR>
			\:exec (col('.')==col('$') - 1 ? 'let @" = @_' : 'normal! yw')<CR>
			\`zp:let @" = @z<CR>a

" Diff saved
command! DiffSaved call s:DiffWithSaved()


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
