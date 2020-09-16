Plug 'tpope/vim-fugitive'

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
