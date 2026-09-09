-- C-hjkl moves between nvim splits and, at a split edge, crosses into the
-- adjacent tmux pane. Pairs with the is_vim conditional binds in ~/.tmux.conf.
return {
    "mrjones2014/smart-splits.nvim",
    lazy = false,
    keys = {
        { "<C-h>", function() require("smart-splits").move_cursor_left() end, desc = "Move to split/pane left" },
        { "<C-j>", function() require("smart-splits").move_cursor_down() end, desc = "Move to split/pane below" },
        { "<C-k>", function() require("smart-splits").move_cursor_up() end, desc = "Move to split/pane above" },
        { "<C-l>", function() require("smart-splits").move_cursor_right() end, desc = "Move to split/pane right" },
    },
    opts = {
        at_edge = "stop", -- don't wrap; hand off to tmux at the outermost edge
    },
}
