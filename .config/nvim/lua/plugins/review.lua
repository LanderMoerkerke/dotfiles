-- Local diff review: comment on lines/ranges, copy the comments as markdown for Claude.
return {
    "vuki656/review.nvim",
    cmd = "Review",
    keys = {
        { "<leader>rr", "<cmd>Review<cr>", desc = "Review: toggle diff review" },
        { "<leader>rc", ":Review qc<cr>", mode = { "n", "x" }, desc = "Review: quick comment" },
        { "<leader>rp", "<cmd>Review qp<cr>", desc = "Review: toggle comments panel" },
        { "<leader>ry", function() require("review.quick_comments").export() end, desc = "Review: copy quick comments" },
        { "<leader>rY", "<cmd>Review export<cr>", desc = "Review: copy diff-review comments" },
    },
    opts = {},
}
