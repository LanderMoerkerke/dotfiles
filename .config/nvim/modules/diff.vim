if &diff
    set cursorline
    map ] ]c
    map [ [c

    map <leader>sl :diffget LO<cr>
    map <leader>sr :diffget RE<cr>

    let g:LanguageClient_diagnosticsEnable = 0
endif
