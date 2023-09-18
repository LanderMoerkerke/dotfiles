if vim.api.nvim_win_get_option(0, "diff") then
    vim.opt.cursorline = true
    vim.keymap.set("n", "]", "]c")
    vim.keymap.set("n", "[", "[c")

    vim.keymap.set("n", "<leader>sl", ":diffget LO<cr>")
    vim.keymap.set("n", "<leader>sr", ":diffget RE<cr>")
end
