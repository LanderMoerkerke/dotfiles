Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

imap <c-l> <Plug>(ultisnips_expand)

let g:UltiSnipsExpandTrigger		= '<Plug>(ultisnips_expand)'
let g:UltiSnipsJumpForwardTrigger	= '<c-j>'
let g:UltiSnipsJumpBackwardTrigger	= '<c-k>'
let g:UltiSnipsRemoveSelectModeMappings = 0

let g:UltiSnipsUsePythonVersion = 3
let g:UltiSnipsSnippetDirectories = ['UltiSnips', '~/.config/nvim/UltiSnips/']

" Edit custom snippets
nnoremap <leader>e :UltiSnipsEdit<cr>
let g:UltiSnipsEditSplit='vertical'

" General autocomplete variables
let g:snips_author = 'Lander Moerkerke'
let g:snips_email = 'lander.moerkerke@telenet.be'
let g:snips_github = 'https://github.com/LanderMoerkerke'


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

augroup ultisnips

    autocmd BufWritePost .snippets :call UltiSnips#RefreshSnippets()<cr>

augroup end
