return {
    {
        "nvim-lualine/lualine.nvim",
        dependencies = {"nvim-tree/nvim-web-devicons"},
        opts = {
            options = {
                theme = "catppuccin"
            },
            extensions = {
                "fzf",
                "lazy",
                "man",
                "nvim-dap-ui",
                "nvim-tree",
                "quickfix"
            }
        }
    },
    {
        "akinsho/bufferline.nvim",
        version = "*",
        dependencies = "nvim-tree/nvim-web-devicons",
        config = function()
            require("bufferline").setup {
                highlights = require("catppuccin.groups.integrations.bufferline").get()
            }
            vim.keymap.set("n", "<c-n>", ":BufferLineCycleNext<CR>")
            vim.keymap.set("n", "<c-p>", ":BufferLineCyclePrev<CR>")
        end
    }
}
