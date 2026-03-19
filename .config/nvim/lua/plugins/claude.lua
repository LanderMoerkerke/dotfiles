return {
    "greggh/claude-code.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim" -- Required for git operations
    },
    config = function()
        require("claude-code").setup(
            {
                window = {
                    position = "float",
                    float = {
                        width = "90%", -- Take up 90% of the editor width
                        height = "90%", -- Take up 90% of the editor height
                        row = "center", -- Center vertically
                        col = "center", -- Center horizontally
                        relative = "editor",
                        border = "double" -- Use double border style
                    }
                }
            }
        )
    end
}
