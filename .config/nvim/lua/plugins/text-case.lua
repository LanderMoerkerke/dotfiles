return {
    "johmsalas/text-case.nvim",
    event = "VeryLazy",
    config = function()
        vim.api.nvim_set_keymap("n", "ga.", "<cmd>TextCaseOpenTelescope<CR>", {desc = "Telescope"})
        vim.api.nvim_set_keymap("v", "ga.", "<cmd>TextCaseOpenTelescope<CR>", {desc = "Telescope"})
    end
}
