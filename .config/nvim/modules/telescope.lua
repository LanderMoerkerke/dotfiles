local builtin = require("telescope.builtin")
local actions = require("telescope.actions")

require("telescope").setup {
    defaults = {
        disable_devicons = false,
        color_devicons = true,
        set_env = {["COLORTERM"] = "truecolor"},
        layout_strategy = "horizontal",
        layout_config = {
            horizontal = {width = 0.99, height = 0.99},
            prompt_position = "bottom"
        },
        prompt_prefix = "   ",
        border = true
    },
    pickers = {
        buffers = {
            show_all_buffers = true,
            sort_lastused = true,
            theme = "dropdown",
            previewer = false,
            mappings = {
                i = {
                    ["<c-d>"] = actions.delete_buffer,
                    -- or right hand side can also be the name of the action as string
                    ["<c-d>"] = "delete_buffer",
                    ["<esc>"] = actions.close
                },
                n = {
                    ["<c-d>"] = actions.delete_buffer
                }
            }
        }
    },
    extensions = {
        fzf = {
            fuzzy = true, -- false will only do exact matching
            override_generic_sorter = true, -- override the generic sorter
            override_file_sorter = true, -- override the file sorter
            case_mode = "smart_case" -- or "ignore_case" or "respect_case" the default case_mode is "smart_case"
        }
    }
}

-- vim.api.nvim_set_keymap("n", "<leader>p", ":Telescope git_files<CR>", {noremap = true, silent = true})
-- vim.api.nvim_set_keymap("n", "<leader>b", ":Telescope buffers<CR>", {noremap = true, silent = true})
-- vim.api.nvim_set_keymap("n", "<leader>t", ":Telescope tags<CR>", {noremap = true, silent = true})

vim.keymap.set("n", "<leader>p", builtin.find_files, {})
vim.keymap.set("n", "<leader>P", builtin.buffers, {})
vim.keymap.set("n", "<leader>g", builtin.live_grep, {})
vim.keymap.set("n", "<leader>gs", builtin.lsp_dynamic_workspace_symbols, {})

require("telescope").load_extension("fzf")
