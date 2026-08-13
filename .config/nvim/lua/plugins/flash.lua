-- Motion: jump to any visible location.
-- Conflict-safe: `S` (treesitter) excludes visual mode so nvim-surround's visual
-- `S` still works; char-mode (f/F/t/T enhancement) disabled to leave f/t untouched.
return {
    "folke/flash.nvim",
    event = "VeryLazy",
    opts = {
        modes = {char = {enabled = false}}
    },
    keys = {
        {"s", mode = {"n", "x", "o"}, function() require("flash").jump() end, desc = "Flash"},
        {"S", mode = {"n", "o"}, function() require("flash").treesitter() end, desc = "Flash Treesitter"},
        {"r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash"},
        {"R", mode = {"o", "x"}, function() require("flash").treesitter_search() end, desc = "Treesitter Search"},
        {"<c-s>", mode = {"c"}, function() require("flash").toggle() end, desc = "Toggle Flash Search"}
    }
}
