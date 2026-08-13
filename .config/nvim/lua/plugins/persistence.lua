return {
    "folke/persistence.nvim",
    event = "BufReadPre", -- this will only start session saving when an actual file was opened
    opts = {},
    keys = {
        {"<leader>ps", function() require("persistence").load() end, desc = "Restore session (cwd)"},
        {"<leader>pl", function() require("persistence").load({last = true}) end, desc = "Restore last session"},
        {"<leader>pd", function() require("persistence").stop() end, desc = "Stop session save"}
    }
}
