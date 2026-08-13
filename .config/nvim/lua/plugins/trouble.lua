-- Diagnostics / references / quickfix / symbols panel.
-- Uses the <leader>X prefix (lowercase <leader>x is bufdelete in basic_mappings).
return {
    "folke/trouble.nvim",
    cmd = "Trouble",
    opts = {},
    keys = {
        {"<leader>Xx", "<cmd>Trouble diagnostics toggle<cr>", desc = "Diagnostics (Trouble)"},
        {"<leader>XX", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", desc = "Buffer diagnostics"},
        {"<leader>Xs", "<cmd>Trouble symbols toggle focus=false<cr>", desc = "Symbols (Trouble)"},
        {"<leader>Xr", "<cmd>Trouble lsp toggle focus=false win.position=right<cr>", desc = "LSP refs/defs"},
        {"<leader>Xl", "<cmd>Trouble loclist toggle<cr>", desc = "Location list"},
        {"<leader>Xq", "<cmd>Trouble qflist toggle<cr>", desc = "Quickfix list"}
    }
}
