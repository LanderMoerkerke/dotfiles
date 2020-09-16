Plug 'roxma/nvim-yarp'
Plug 'ncm2/ncm2'
Plug 'ncm2/ncm2-path'
Plug 'ncm2/ncm2-bufword'
Plug 'ncm2/ncm2-ultisnips'

" Enable entering when popup is visible
inoremap <expr> <CR> (pumvisible() ? "\<c-y>\<cr>" : "\<CR>")

" Enable scrolling via tab
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

inoremap <silent> <expr> <CR> ncm2_ultisnips#expand_or("\<CR>", 'n')


augroup ncm2

    autocmd BufEnter * call ncm2#enable_for_buffer()
    " autocmd TextChangedI * call ncm2#auto_trigger()

augroup end

" call ncm2#override_source('ultisnips', {'priority': 10})
