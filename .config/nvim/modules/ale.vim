Plug 'LanderMoerkerke/ale'
"
" let g:ale_disable_lsp = 1
let g:ale_set_highlights = 0

let g:ale_lint_on_text_changed = 'never'
" let g:ale_lint_on_enter = 1
let g:ale_lint_fix_on_save = 1
" let g:ale_open_list = 1
let g:ale_list_window_size = 8

let g:ale_completion_enabled = 0

let g:ale_python_autoflake_options = '--expand-star-imports --remove-all-unused-imports --remove-unused-variables --remove-duplicate-keys -s'

let g:ale_linters = {
            \ 'python': ['pyright'],
            \ 'javascript': ['eslint'],
            \ 'go': ['golint'],
            \ 'vim': ['vint']
            \}

let g:ale_fixers = {
            \ 'cpp': ['clang-format'],
            \ 'cs':  ['uncrustify'],
            \ 'css': ['stylelint', 'prettier'],
            \ 'go': ['gofmt', 'goimports', 'gomod'],
            \ 'html': ['prettier'],
            \ 'javascript': ['eslint', 'prettier'],
            \ 'javascriptreact': ['eslint', 'prettier'],
            \ 'typescript': ['eslint', 'prettier'],
            \ 'typescriptreact': ['eslint', 'prettier'],
            \ 'json': ['jq', 'prettier'],
            \ 'markdown': ['remark-lint'],
            \ 'python': ['autoflake', 'isort', 'black'],
            \ 'rust': ['rustfmt'],
            \ 'sh': ['shfmt'],
            \ 'sql': ['pgformatter'],
            \ 'xml': ['xmllint'],
            \ 'yaml': ['prettier'],
            \}

let g:ale_sh_shfmt_options = '-i 4 -ci'
let g:ale_python_black_options = '-l 120'
let g:ale_python_bandit_options = '-c /home/lander/.config/bandit/config.yaml'
let g:ale_javascript_prettier_options = '--tab-width 2 --print-width 120 --single-quote'

" golangci-lint run
" remark
let g:ale_sign_column_always = 1

let g:ale_set_signs = 1

let g:ale_sign_error = '>>'
let g:ale_sign_warning = '--'

let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[ALE %linter%] %s [%severity%]'

nmap <silent> gep <Plug>(ale_previous_wrap)
nmap <silent> gen <Plug>(ale_next_wrap)


augroup ale

    autocmd BufWritePre *.go,*.rs,*.sh,*.bash ALEFix
    autocmd BufWritePre *.py ALEFix isort black

augroup end
