return {
    "nvim-neotest/neotest",
    dependencies = {
        "nvim-neotest/nvim-nio", "nvim-lua/plenary.nvim",
        "antoinemadec/FixCursorHold.nvim", "nvim-treesitter/nvim-treesitter",
        "nvim-neotest/neotest-python"
    },
    config = function()
        require("neotest").setup({
            adapters = {require("neotest-python")({args = {"-vvs"}})}
        })

        --         vim.api.nvim_set_keymap("n", "<Leader>tt", ":TestSuite<CR>", {noremap = true, silent = true})
        --         vim.api.nvim_set_keymap("n", "<Leader>tf", ":TestNearest<CR>", {noremap = true, silent = true})
        --         vim.api.nvim_set_keymap("n", "<Leader>tF", ":TestFile<CR>", {noremap = true, silent = true})
    end
}
