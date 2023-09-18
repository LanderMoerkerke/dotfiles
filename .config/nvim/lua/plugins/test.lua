return {
    "klen/nvim-test",
    dependencies = {
        "nvim-treesitter/nvim-treesitter"
    },
    event = "VeryLazy",
    config = function()
        require("nvim-test").setup {
            termOpts = {
                direction = "horizontal"
            }
        }

        require("nvim-test.runners.pytest"):setup {
            command = {(vim.env.VIRTUAL_ENV or "venv") .. "/bin/pytest", "pytest"},
            -- command = {"/bin/pytest", "-m", "pytest"},
            args = {"-vvs"},
            file_pattern = "\\v(test_[^.]+|[^.]+_test|tests)\\.py$",
            find_files = {"test_{name}.py", "{name}_test.py", "tests.py"}
        }

        vim.api.nvim_set_keymap("n", "<Leader>tt", ":TestSuite<CR>", {noremap = true, silent = true})
        vim.api.nvim_set_keymap("n", "<Leader>tf", ":TestNearest<CR>", {noremap = true, silent = true})
        vim.api.nvim_set_keymap("n", "<Leader>tF", ":TestFile<CR>", {noremap = true, silent = true})
        -- vim.api.nvim_set_keymap("n", "<Leader>te", ":TestEdit<CR>", {noremap = true, silent = true})
        -- vim.api.nvim_set_keymap("n", "<Leader>tl", ":TestLast<CR>", {noremap = true, silent = true})
    end
}
