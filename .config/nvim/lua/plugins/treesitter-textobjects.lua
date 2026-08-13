-- Treesitter text objects (main branch API, matches your treesitter main branch).
-- Select keys avoid align.nvim's visual aa/as/aw/ar (parameter uses a,/i,).
return {
    "nvim-treesitter/nvim-treesitter-textobjects",
    branch = "main",
    event = {"BufReadPost", "BufNewFile"},
    dependencies = {"nvim-treesitter/nvim-treesitter"},
    config = function()
        require("nvim-treesitter-textobjects").setup({
            select = {lookahead = true, include_surrounding_whitespace = false},
            move = {set_jumps = true}
        })

        local sel = require("nvim-treesitter-textobjects.select")
        local move = require("nvim-treesitter-textobjects.move")
        local swap = require("nvim-treesitter-textobjects.swap")

        -- Select (operator-pending + visual)
        local objs = {
            ["af"] = "@function.outer", ["if"] = "@function.inner",
            ["ac"] = "@class.outer", ["ic"] = "@class.inner",
            ["al"] = "@loop.outer", ["il"] = "@loop.inner",
            ["a,"] = "@parameter.outer", ["i,"] = "@parameter.inner"
        }
        for lhs, q in pairs(objs) do
            vim.keymap.set({"x", "o"}, lhs,
                function() sel.select_textobject(q, "textobjects") end,
                {desc = "TS select " .. q})
        end

        -- Move
        vim.keymap.set({"n", "x", "o"}, "]f", function() move.goto_next_start("@function.outer", "textobjects") end, {desc = "Next function"})
        vim.keymap.set({"n", "x", "o"}, "[f", function() move.goto_previous_start("@function.outer", "textobjects") end, {desc = "Prev function"})
        vim.keymap.set({"n", "x", "o"}, "]F", function() move.goto_next_end("@function.outer", "textobjects") end, {desc = "Next function end"})
        vim.keymap.set({"n", "x", "o"}, "[F", function() move.goto_previous_end("@function.outer", "textobjects") end, {desc = "Prev function end"})
        vim.keymap.set({"n", "x", "o"}, "]t", function() move.goto_next_start("@class.outer", "textobjects") end, {desc = "Next class"})
        vim.keymap.set({"n", "x", "o"}, "[t", function() move.goto_previous_start("@class.outer", "textobjects") end, {desc = "Prev class"})

        -- Swap parameters
        vim.keymap.set("n", "<leader>sa", function() swap.swap_next("@parameter.inner", "textobjects") end, {desc = "Swap param next"})
        vim.keymap.set("n", "<leader>sA", function() swap.swap_previous("@parameter.inner", "textobjects") end, {desc = "Swap param prev"})
    end
}
