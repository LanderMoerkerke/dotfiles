Plug 'autozimu/LanguageClient-neovim', {
            \ 'branch': 'next',
            \ 'do': 'make release',
            \ }


let g:LanguageClient_hasSnippetSupport = 1
let g:LanguageClient_useVirtualText = 'CodeLens'

let g:LanguageClient_completionPreferTextEdit = 1

let g:LanguageClient_hoverPreview = 'Always'

let g:LanguageClient_diagnosticsList = 'Disabled'
let g:LanguageClient_diagnosticsSignsMax = 0

let g:LanguageClient_diagnosticsDisplay = {
            \        1: {
            \            'name': 'Error',
            \            'texthl': 'ALEError',
            \            'signText': '!',
            \            'signTexthl': 'SpellBad',
            \            'virtualTexthl': 'LCError',
            \        },
            \        2: {
            \            'name': 'Warning',
            \            'texthl': 'ALEWarning',
            \            'signText': '*',
            \            'signTexthl': 'ALEInfoSign',
            \            'virtualTexthl': 'LCWarning',
            \        },
            \        3: {
            \            'name': 'Information',
            \            'texthl': 'ALEInfo',
            \            'signText': 'i',
            \            'signTexthl': 'ALEInfoSign',
            \            'virtualTexthl': 'Todo',
            \        },
            \        4: {
            \            'name': 'Hint',
            \            'texthl': 'ALEInfo',
            \            'signText': '?',
            \            'signTexthl': 'ALEInfoSign',
            \            'virtualTexthl': 'None',
            \        },
            \    }

let g:LanguageClient_serverCommands = {
            \ 'c':               ['clangd'],
            \ 'cpp':             ['clangd'],
            \ 'css':             ['css-languageserver', '--stdio'],
            \ 'dockerfile':      ['docker-langserver', '--stdio'],
            \ 'go':              ['gopls'],
            \ 'html':            ['html-languageserver', '--stdio'],
            \ 'javascript':      ['javascript-typescript-stdio'],
            \ 'javascriptreact': ['javascript-typescript-stdio'],
            \ 'json':            ['json-languageserver', '--stdio'],
            \ 'python':          ['mspyls'],
            \ 'rust':            ['rust-analyzer'],
            \ 'sh':              ['bash-language-server', 'start'],
            \ 'sql':             ['pgls'],
            \ 'typescript':      ['javascript-typescript-stdio'],
            \ 'typescriptreact': ['javascript-typescript-stdio'],
            \ 'yaml':            ['yaml-language-server', '--stdio']
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

        nmap <silent><leader>E <Plug>(lcn-explain-error)
    endif
endfunction

hi LCError               ctermfg=203   ctermbg=203
hi LCWarning             ctermfg=230   ctermbg=24
" hi LCWarning             ctermfg=7     ctermbg=233

augroup language_client

    " LanguageClient
    autocmd FileType * call LC_maps()

augroup end
