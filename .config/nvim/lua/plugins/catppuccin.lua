return {
    "catppuccin/nvim",
    lazy = false,
    priority = 1000,
    opts = {
        ensure_installed = {"dap_repl"},
        integrations = {
            alpha = true,
            gitsigns = true,
            cmp = true,
            dap = {
                enabled = true,
                enable_ui = true
            },
            native_lsp = {
                enabled = true,
                virtual_text = {
                    errors = {"italic"},
                    hints = {"italic"},
                    warnings = {"italic"},
                    information = {"italic"}
                },
                underlines = {
                    errors = {"underline"},
                    hints = {"underline"},
                    warnings = {"underline"},
                    information = {"underline"}
                },
                inlay_hints = {
                    background = true
                }
            },
            treesitter = true,
            telescope = {
                enabled = true
            },
            gitgutter = false
        }
    },
    config = function()
        vim.cmd.colorscheme "catppuccin"
    end
}
