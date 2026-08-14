return {
    {
        "harrisoncramer/gitlab.nvim",
        dependencies = {
            "MunifTanjim/nui.nvim",
            "nvim-lua/plenary.nvim",
            "sindrets/diffview.nvim",
            "nvim-tree/nvim-web-devicons"
        },
        build = function() require("gitlab.server").build(true) end,
        config = function()
            require("gitlab").setup()
        end
    },
    {
        "linrongbin16/gitlinker.nvim",
        cmd = "GitLink",
        opts = function()
            local routers = require("gitlinker.routers")
            local pat = "^gitlab%.wegroup%.io"
            local tail =
                "/{_A.FILE}#L{_A.LSTART}{(_A.LEND > _A.LSTART and ('-L' .. _A.LEND) or '')}"
            return {
                router = {
                    browse = {[pat] = routers.gitlab_browse},
                    blame = {[pat] = routers.gitlab_blame},
                    default_branch = {
                        [pat] = "https://gitlab.wegroup.io/{_A.ORG}/{_A.REPO}/blob/{_A.DEFAULT_BRANCH}" .. tail
                    },
                    current_branch = {
                        [pat] = "https://gitlab.wegroup.io/{_A.ORG}/{_A.REPO}/blob/{_A.CURRENT_BRANCH}" .. tail
                    }
                }
            }
        end,
        keys = {
            {"<leader>gy", "<cmd>GitLink<cr>", mode = {"n", "v"}, desc = "Yank git permalink"},
            {"<leader>gY", "<cmd>GitLink!<cr>", mode = {"n", "v"}, desc = "Open git permalink in browser"},
            {"<leader>gB", "<cmd>GitLink blame<cr>", mode = {"n", "v"}, desc = "Yank git blame link"}
        }
    }
}
