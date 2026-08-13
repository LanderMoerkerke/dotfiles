-- map <F1> :Autoformat <CR>
-- <F2> = format (conform.nvim) — defined as a lazy key in lua/plugins/formatter.lua
vim.keymap.set("n", "<F3>", ":!wc <C-R>%<CR>")
-- F4: execute code
-- F5: execute code
vim.keymap.set("n", "<F6>", ":call g:ToggleSpell()<CR>")
vim.keymap.set("n", "<F7>", ":call g:DiffWithSaved()")
-- map <F8>
-- map <F9>
-- map <F10> :ALEToggleBuffer<CR>
vim.keymap.set("n", "<F11>", ":ZenMode<CR>")
vim.keymap.set("n", "<F12>", ":Lspsaga outline<CR>")
