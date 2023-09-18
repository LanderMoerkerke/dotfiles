vim.cmd(
    [[
function! g:DiffWithSaved()
    let filetype=&filetype
    diffthis
    vnew | r # | normal! 1Gdd
    diffthis
    exe 'setlocal bt=nofile bh=wipe nobl noswf ro ft=' . filetype
endfunction
]]
)

vim.cmd(
    [[
function! g:ToggleSpell()
    let spelllang_list = ['nl', 'en', 'fr']
    let string = []

    for i in range(len(spelllang_list))
        call add(string, i+1 . ') ' . spelllang_list[i])
    endfor

    if ! &spell
        let &spell = 1
        let selection = inputlist(string)
        let &spelllang = spelllang_list[selection-1]
        set spellfile=./nl.utf-8.add
    else
        let &spell = 0
        echo "'spell' disabled..."
    endif
endfunction
]]
)

-- function ToggleSpellLua()
--     local spelllang_list = {"nl", "en", "fr"}
--     -- local string = {}
--     -- print(spelllang_list)
--
--     -- for lang in spelllang_list do
--     --     print(lang)
--     -- end
--
--     for i, v in ipairs(spelllang_list) do
--         print(i)
--         print(v)
--     end
-- end
