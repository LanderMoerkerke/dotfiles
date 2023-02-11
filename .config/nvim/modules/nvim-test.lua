require("nvim-test").setup {
    run = true, -- run tests (using for debug)
    commands_create = true, -- create commands (TestFile, TestLast, ...)
    filename_modifier = ":.", -- modify filenames before tests run(:h filename-modifiers)
    silent = true, -- less notifications
    term = "terminal", -- a terminal to run ("terminal"|"toggleterm")
    termOpts = {
        direction = "horizontal", -- terminal's direction ("horizontal"|"vertical"|"float")
        width = 96, -- terminal's width (for vertical|float)
        height = 24, -- terminal's height (for horizontal|float)
        go_back = false, -- return focus to original window after executing
        stopinsert = "auto", -- exit from insert mode (true|false|"auto")
        keep_one = true -- keep only one terminal for testing
    },
    runners = {
        -- setup tests runners
        cs = "nvim-test.runners.dotnet",
        go = "nvim-test.runners.go-test",
        haskell = "nvim-test.runners.hspec",
        javacriptreact = "nvim-test.runners.jest",
        javascript = "nvim-test.runners.jest",
        lua = "nvim-test.runners.busted",
        python = "nvim-test.runners.pytest",
        ruby = "nvim-test.runners.rspec",
        rust = "nvim-test.runners.cargo-test",
        typescript = "nvim-test.runners.jest",
        typescriptreact = "nvim-test.runners.jest"
    }
}

require("nvim-test.runners.pytest"):setup {
    command = {(vim.env.VIRTUAL_ENV or "venv") .. "/bin/pytest", "pytest"},
    args = {"-vvs"},
    file_pattern = "\\v(test_[^.]+|[^.]+_test|tests)\\.py$",
    find_files = {"test_{name}.py", "{name}_test.py", "tests.py"}
}

vim.api.nvim_set_keymap("n", "<Leader>tt", ":TestSuite<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<Leader>tf", ":TestFile<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<Leader>te", ":TestEdit<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<Leader>tl", ":TestLast<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<Leader>tn", ":TestNearest<CR>", {noremap = true, silent = true})
