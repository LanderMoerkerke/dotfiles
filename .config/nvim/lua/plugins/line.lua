return {
    {
        "nvim-lualine/lualine.nvim",
        dependencies = {"nvim-tree/nvim-web-devicons"},
        opts = {
            options = {
                theme = "catppuccin",
                globalstatus = true
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
        end
    }
}
