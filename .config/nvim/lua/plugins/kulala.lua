return {
    "mistweaverco/kulala.nvim",
    opts = {},
    ft = {
        "http"
    },
    config = function(_, opts)
        require("kulala").setup(opts)
        -- buffer-local maps so <C-j/k/l> window navigation isn't clobbered globally
        local function set_maps(buf)
            local map = function(lhs, rhs)
                vim.keymap.set("n", lhs, rhs, {buffer = buf, silent = true})
            end
            map("<C-k>", function() require("kulala").jump_prev() end)
            map("<C-j>", function() require("kulala").jump_next() end)
            map("<C-l>", function() require("kulala").run() end)
        end
        vim.api.nvim_create_autocmd("FileType", {
            pattern = "http",
            callback = function(a) set_maps(a.buf) end
        })
        if vim.bo.filetype == "http" then set_maps(0) end
    end
}
