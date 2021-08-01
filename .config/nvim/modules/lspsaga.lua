local saga = require("lspsaga")
saga.init_lsp_saga {
    error_sign = " ",
    warn_sign = " ",
    hint_sign = " ",
    infor_sign = " ",
    finder_action_keys = {
        open = {"o", "<CR>"},
        vsplit = "s",
        split = "i",
        quit = "<C-c>",
        scroll_down = "<C-f>",
        scroll_up = "<C-b>" -- quit can be a table
    },
    code_action_keys = {
        quit = {"q", "<C-c>"},
        exec = "<CR>"
    }
}

-- Rename
vim.api.nvim_set_keymap("n", "rn", ":Lspsaga rename<CR>", {})

-- References
vim.api.nvim_set_keymap("n", "gr", ":Lspsaga lsp_finder<CR>", {})

-- Actions
vim.api.nvim_set_keymap("n", "ga", ":Lspsaga code_action<CR>", {})
vim.api.nvim_set_keymap("v", "ga", ":Lspsaga code_action<CR>", {})

-- Hover
vim.api.nvim_set_keymap("n", "K", ":Lspsaga hover_doc<CR>", {})
-- scroll down hover doc or scroll in definition preview
vim.api.nvim_set_keymap("n", "<C-f>", "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>", {})
-- scroll up hover doc
vim.api.nvim_set_keymap("n", "<C-b>", "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>", {})

-- Signature
vim.api.nvim_set_keymap("n", "gs", ":Lspsaga signature_help<CR>", {})

-- Preview definition
vim.api.nvim_set_keymap("n", "gh", ":Lspsaga preview_definition<CR>", {})

-- Diagnostics
vim.api.nvim_set_keymap("n", "<leader>cd", "<cmd>lua require'lspsaga.diagnostic'.show_line_diagnostics()<CR>", {})

-- jump diagnostic
vim.api.nvim_set_keymap("n", "[e", "<cmd>lua require'lspsaga.diagnostic'.lsp_jump_diagnostic_prev()<CR>", {})
vim.api.nvim_set_keymap("n", "]e", "<cmd>lua require'lspsaga.diagnostic'.lsp_jump_diagnostic_next()<CR>", {})
