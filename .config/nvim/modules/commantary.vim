Plug 'tpope/vim-commentary'                                         " Commenting with motions

" Add todo
nnoremap <leader><leader>t OTODO:<Esc>:Commentary<CR>A

" Commenting
nnoremap <C-c> :Commentary<cr>
vnoremap <C-c> :Commentary<cr>
inoremap <C-c> <Esc>:Commentary<cr>A
