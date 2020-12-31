augroup external_scripts

    autocmd VimLeave *.tex !texclear %

    " Execute
    " Python
    autocmd FileType python call Run_Python()
    fun! Run_Python()
        let g:LanguageClient_settingsPath=expand('~/.config/nvim/language_server/settings-python.json')

        nnoremap <buffer> <F5> :exec '!python3' shellescape(@%, 1)<cr>
    endf

    " Go
    autocmd FileType go call Run_Go()
    fun! Run_Go()
        let g:LanguageClient_settingsPath=expand('~/.config/nvim/language_server/settings-go.json')

        nnoremap <buffer> <F5> :exec '!go run' shellescape(@%, 1)<cr>
    endf

    " JS
    autocmd FileType javascript,javascriptreact,typescript,typescriptreact call Run_Js()
    fun! Run_Js()
        set tabstop=2
        set shiftwidth=2
        nnoremap <buffer> <F5> :exec '!node' shellescape(@%, 1)<cr>
    endf

    " shell
    autocmd FileType sh call Run_Sh()
    fun! Run_Sh()
        nnoremap <buffer> <F5> :exec '!sh' shellescape(@%, 1)<cr>
    endf

    " CPP
    autocmd FileType cpp call Run_CPP()
    fun! Run_CPP()
        nnoremap <buffer> <F5> :exec '!g++ % -o run && ./run' shellescape(@%, 1)<cr>
    endf

    " Rust
    autocmd FileType rust call Run_Rust()
    fun! Run_Rust()
        " let g:LanguageClient_settingsPath=expand('~/.config/nvim/language_server/settings-rust.json')

        nnoremap <buffer> <F5> :exec '!cargo run' shellescape(@%, 1)<cr>
    endf

    " Jinja / htmldjango
    autocmd FileType htmldjango,jinja2 call Run_jinja()
    fun! Run_jinja()
        setlocal commentstring={#%s#}
        setlocal comments=s:{#,e:#}
    endf

    " SQL
    autocmd FileType sql call Run_SQL()
    fun! Run_SQL()
        " let g:LanguageClient_settingsPath=expand('~/.config/nvim/language_server/settings-rust.json')

        nnoremap <buffer> <F5> :exec '!psql -U postgres -p 54320 -h localhost -d postgres -f' shellescape(@%, 1)<cr>
    endf

augroup end
