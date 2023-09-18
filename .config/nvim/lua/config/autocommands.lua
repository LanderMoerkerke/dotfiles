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
