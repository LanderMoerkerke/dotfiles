-- Motion: 2-char jump. Replaces flash.nvim, which FFIs an internal Neovim symbol
-- (search_match_lines) that 0.13-dev removed, crashing every flash jump.
-- leap is pure Lua (no FFI), nightly-safe. `s` only, so nvim-surround's `S` is untouched.
return {
    "ggandor/leap.nvim",
    dependencies = {"tpope/vim-repeat"},
    keys = {
        {"s", mode = {"n", "x", "o"}, function() require("leap").leap({}) end, desc = "Leap (bidirectional)"},
        {"gs", mode = {"n", "x", "o"}, function()
            require("leap").leap({target_windows = require("leap.util").get_enterable_windows()})
        end, desc = "Leap to other windows"}
    }
}
