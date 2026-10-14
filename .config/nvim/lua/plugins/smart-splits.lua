-- C-hjkl moves between nvim splits and, at a split edge, crosses into the
-- adjacent tmux pane. Pairs with the is_vim conditional binds in ~/.tmux.conf.
-- Since v3 core ships no multiplexer support: tmux lives in backend-tmux.
return {
    "mrjones2014/smart-splits.nvim",
    lazy = false,
    dependencies = {
        { "smart-splits-nvim/backend-tmux", main = "smart-splits-backend-tmux" },
    },
    keys = {
        { "<C-h>", function() require("smart-splits").move_cursor_left() end, desc = "Move to split/pane left" },
        { "<C-j>", function() require("smart-splits").move_cursor_down() end, desc = "Move to split/pane below" },
        { "<C-k>", function() require("smart-splits").move_cursor_up() end, desc = "Move to split/pane above" },
        { "<C-l>", function() require("smart-splits").move_cursor_right() end, desc = "Move to split/pane right" },
    },
    opts = {
        mux = { backend = "smart-splits-backend-tmux" },
        move = { at_edge = "stop" }, -- don't wrap; hand off to tmux at the outermost edge
    },
}
