Plug 'airblade/vim-gitgutter'

let g:gitgutter_max_signs = 1000
let g:gitgutter_preview_win_floating = 0

" fold changes
nnoremap ghf :GitGutterFold<CR>

" navigate to hunks
nnoremap ghn :GitGutterNextHunk<CR>
nnoremap ghp :GitGutterPrevHunk<CR>

" stage hunks
nmap <Leader>ha :GitGutterStageHunk<CR>
nmap <Leader>hr :GitGutterUndoHunk<CR>

" preview hunk's changes
nmap <Leader>hv :GitGutterPreviewHunk<CR>

" hi GitGutterAdd          ctermbg=150   ctermfg=black
" hi GitGutterChange       ctermbg=74    ctermfg=black
" hi GitGutterDelete       ctermbg=167   ctermfg=black
" hi GitGutterChangeDelete ctermbg=74    ctermfg=black

augroup gitgutter

    " After saving
    autocmd BufWritePost * GitGutter

augroup end
