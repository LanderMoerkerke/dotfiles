local basic = vim.api.nvim_create_augroup("basic", {clear = true})

vim.api.nvim_create_autocmd({"VimResized"}, {
    pattern = "*",
    group = basic,
    command = ":wincmd ="
})
vim.api.nvim_create_autocmd({"FocusGained", "BufEnter", "CursorHold"}, {
    pattern = "*",
    group = basic,
    command = "checktime"
})
vim.api.nvim_create_autocmd({"BufWritePre"}, {
    pattern = "*",
    group = basic,
    command = [[%s/\s\+$//e]] -- strip trailing whitespace on save
})
vim.api.nvim_create_autocmd({"BufEnter"}, {
    pattern = {"*.ts", "*.tsx", "*.js", "*.jsx"},
    group = basic,
    command = "lua vim.opt.tabstop=2;vim.opt.shiftwidth=2"
})
-- Remember the last-visited tab for <leader><Tab>
vim.api.nvim_create_autocmd("TabLeave", {
    group = basic,
    callback = function() vim.g.lasttab = vim.fn.tabpagenr() end
})
