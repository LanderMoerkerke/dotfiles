local templates = vim.api.nvim_create_augroup("templates", {clear = true})

vim.api.nvim_create_autocmd(
    {"BufNewFile"},
    {
        pattern = "*.html",
        group = templates,
        command = "r ~/.config/nvim/templates/skeleton.html"
    }
)
vim.api.nvim_create_autocmd(
    {"BufNewFile"},
    {
        pattern = "*.go",
        group = templates,
        command = "r ~/.config/nvim/templates/skeleton.go"
    }
)
vim.api.nvim_create_autocmd(
    {"BufNewFile"},
    {
        pattern = "*.py",
        group = templates,
        command = "r ~/.config/nvim/templates/skeleton.py"
    }
)
