local basic = vim.api.nvim_create_augroup("basic", {clear = true})

vim.api.nvim_create_autocmd(
    {"VimResized"},
    {
        pattern = "*",
        group = basic,
        command = ":wincmd ="
    }
)
vim.api.nvim_create_autocmd(
    {"FocusGained", "BufEnter", "CursorHold"},
    {
        pattern = "*",
        group = basic,
        command = "checktime"
    }
)
vim.api.nvim_create_autocmd(
    {"BufWritePre"},
    {
        pattern = "*",
        group = basic,
        command = [[%s/\s\+$//e]]
    }
)
vim.api.nvim_create_autocmd(
    {"BufWritePost"},
    {
        pattern = {".Xresources", ".Xdefaults"},
        group = basic,
        command = "!xrdb %"
    }
)
vim.api.nvim_create_autocmd(
    {"BufWritePost"},
    {
        pattern = {"sxhkdrc"},
        group = basic,
        command = "!pkill -USR1 sxhkd"
    }
)
vim.api.nvim_create_autocmd(
    {"BufWritePost"},
    {
        pattern = {"dwmbar-launch"},
        group = basic,
        command = "!killall dwmbar-launch; setsid dwmbar-launch &"
    }
)
-- vim.api.nvim_create_autocmd(
--     {"BufEnter"},
--     {
--         pattern = {"*.json"},
--         group = basic,
--         command = ":setfiletype jsonc<cr>"
--     }
-- )
-- vim.api.nvim_create_autocmd(
--     {"BufEnter"},
--     {
--         pattern = {"*.py"},
--         group = basic,
--         command = "lua vim.diagnostic.setloclist({ open = true })"
--     }
-- )
vim.api.nvim_create_autocmd(
    {"BufEnter"},
    {
        pattern = {"*.ts", "*.tsx", "*.js", "*.jsx"},
        group = basic,
        command = "lua vim.opt.tabstop=2;vim.opt.shiftwidth=2"
    }
)
vim.api.nvim_create_autocmd(
    {"BufWritePost"},
    {
        pattern = {"*"},
        group = basic,
        command = "lua vim.diagnostic.setloclist({ open = false })"
    }
)
