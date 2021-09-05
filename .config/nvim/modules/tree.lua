vim.g["nvim_tree_auto_open"] = 1

vim.api.nvim_set_keymap("n", "<leader>f", ":NvimTreeToggle<CR>", {noremap = true, silent = true})
