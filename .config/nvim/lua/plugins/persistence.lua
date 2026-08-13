return {
    "folke/persistence.nvim",
    event = "BufReadPre", -- this will only start session saving when an actual file was opened
    opts = {},
    keys = {
        {"<leader>Qs", function() require("persistence").load() end, desc = "Restore session (cwd)"},
        {"<leader>Ql", function() require("persistence").load({last = true}) end, desc = "Restore last session"},
        {"<leader>Qd", function() require("persistence").stop() end, desc = "Stop session save"}
    }
}
