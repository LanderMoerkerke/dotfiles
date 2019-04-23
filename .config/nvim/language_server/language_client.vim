" --------------------
" Plugins
" --------------------

Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }       " Deoplete

" --------------------
" Settings
" --------------------

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

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
