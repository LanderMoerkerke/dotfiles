if vim.api.nvim_get_option_value("diff", {win = 0}) then
    vim.opt.cursorline = true
    vim.keymap.set("n", "]", "]c")
    vim.keymap.set("n", "[", "[c")

    vim.keymap.set("n", "<leader>sl", ":diffget LO<cr>")
    vim.keymap.set("n", "<leader>sr", ":diffget RE<cr>")
end
