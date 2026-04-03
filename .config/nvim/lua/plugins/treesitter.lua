return {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
        "windwp/nvim-ts-autotag", "JoosepAlviste/nvim-ts-context-commentstring"
    },
    build = ":TSUpdate",
    lazy = false,
    branch = "main",
    config = function()
        require("nvim-treesitter").setup({
            ensure_installed = {
                "python", "lua", "bash", "html", "css", "javascript",
                "typescript", "json", "yaml", "toml", "markdown",
                "markdown_inline", "vim", "vimdoc", "dap_repl"
            }
        })

        require('nvim-ts-autotag').setup({
            opts = {
                enable_close = true,
                enable_rename = true,
                enable_close_on_slash = true
            }
        })

        -- Highlighting is now built into Neovim, enable it via autocommand
        vim.api.nvim_create_autocmd("FileType", {
            callback = function()
                -- Skip csv files
                if vim.bo.filetype == "csv" then return end
                pcall(vim.treesitter.start)
            end
        })
    end

}
