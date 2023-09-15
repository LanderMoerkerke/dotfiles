Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'

function! FzfSpellSink(word)
    exe 'normal! "_ciw'.a:word
endfunction

function! FzfSpell()
    let suggestions = spellsuggest(expand('<cword>'))
    return fzf#run({'source': suggestions, 'sink': function('FzfSpellSink'), 'down': 10 })
endfunction

nnoremap <leader>p :Files<cr>
nnoremap <leader>P :Buffers<cr>
" nnoremap <leader>T :Tags<cr>

nnoremap z= :call FzfSpell()<CR>

" Search snippets by name and description
command! -bar -bang Snippets call fzf#vim#snippets({'options': '-n ..'}, <bang>0)

augroup fzf

    " Esc closes FZF
    autocmd TermOpen * tnoremap <Esc> <c-\><c-n>
    autocmd FileType fzf tunmap <Esc>

augroup end
