Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

let g:airline_theme='minimalist'
let g:airline_powerline_fonts = 1

let g:airline_section_c =
            \'%{bufnr('%')}: '.
            \'%<%f%m %#__accent_red#'.
            \'%{airline#util#wrap(airline#parts#readonly(),0)}%#__restore__#'

let g:airline#extensions#tabline#enabled = 1
" let g:airline#extensions#tabline#buffer_nr_show = 1
" let g:airline#extensions#tabline#ignore_bufadd_pat = ''

let g:airline#extensions#wordcount#formatter#default#fmt = '%d w'

let g:airline#parts#ffenc#skip_expected_string='utf-8[unix]'

let g:airline#extensions#virtualenv#enabled = 0
let g:airline#extensions#branch#enabled = 0
let g:airline#extensions#tagbar#enabled = 0
let g:airline#extensions#vimagit#enabled = 0
let g:airline#extensions#hunks#enabled = 0
let g:airline#extensions#vista#enabled = 0

let g:airline#extensions#tabline#formatter = 'default'
let g:airline#extensions#tabline#fnamemod = ':t'

augroup ultisnips

    autocmd BufDelete * call airline#extensions#tabline#buflist#invalidate()

augroup end
