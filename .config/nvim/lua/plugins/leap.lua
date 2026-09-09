return {
    url = "https://codeberg.org/andyg/leap.nvim",
    dependencies = {"tpope/vim-repeat"},
    keys = {
        {"s", mode = {"n", "x", "o"}, function() require("leap").leap({}) end, desc = "Leap (bidirectional)"},
        {"gs", mode = {"n", "x", "o"}, function()
            require("leap").leap({target_windows = require("leap.user").get_enterable_windows()})
        end, desc = "Leap to other windows"}
    }
}
