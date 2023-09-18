return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = "VeryLazy",
    config = function()
        require("nvim-treesitter.configs").setup(
            {
                highlight = {
                    enable = true
                },
                incremental_selection = {enable = true},
                indent = {enable = true},
                autotag = {enable = true},
                context_commentstring = {enable = true, enable_autocmd = false}
            }
        )
    end
}
