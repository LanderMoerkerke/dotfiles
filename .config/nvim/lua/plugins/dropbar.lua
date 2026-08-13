-- Interactive winbar breadcrumb (native LSP + treesitter based).
-- Replaces lspsaga's symbol_in_winbar.
return {
    "Bekaboo/dropbar.nvim",
    event = {"BufReadPost", "BufNewFile"},
    dependencies = {"nvim-tree/nvim-web-devicons"},
    config = function()
        require("dropbar").setup()
        -- pick/jump within the breadcrumb (fuzzy menu; uses fzf if available)
        vim.keymap.set("n", "<leader>;", require("dropbar.api").pick,
                       {desc = "Dropbar pick"})
    end
}
