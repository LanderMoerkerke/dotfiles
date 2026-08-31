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
            },
            sections = {
                lualine_a = {
                    {"mode"},
                    {
                        "searchcount",
                        maxcount = 999,
                        timeout = 500
                    }
                }
            }
        }
    },
    {
        "akinsho/bufferline.nvim",
        version = "*",
        dependencies = "nvim-tree/nvim-web-devicons",
        config = function()
            require("bufferline").setup {
                -- New buffers (e.g. gd) open next to the active one, not at the end.
                options = { sort_by = "insert_after_current" },
                highlights = require("catppuccin.special.bufferline").get_theme()
            }
            vim.keymap.set("n", "<c-n>", ":BufferLineCycleNext<CR>")
            vim.keymap.set("n", "<c-p>", ":BufferLineCyclePrev<CR>")
        end
    }
}
