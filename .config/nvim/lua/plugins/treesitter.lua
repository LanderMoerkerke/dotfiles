return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    lazy = false,
    branch = "main",
    opts = {
        highlight = {
            enable = true,
            disable = {"csv"}
        },
        incremental_selection = {enable = true},
        indent = {enable = true},
        autotag = {enable = true},
        context_commentstring = {enable = true, enable_autocmd = false}
    }
}
