require "nvim-tree".setup {
    open_on_setup = true
}

vim.api.nvim_set_keymap("n", "<leader>f", ":NvimTreeToggle<CR>", {noremap = true, silent = true})
