return {
    {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build"
    },
    {
        "nvim-telescope/telescope.nvim",
        branch = "0.1.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "benfowler/telescope-luasnip.nvim",
            {
                "danielfalk/smart-open.nvim",
                dependencies = {"kkharji/sqlite.lua"}
            }
        },
        config = function()
            local ts = require("telescope")

            ts.setup(
                {
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
                            -- theme = "dropdown",
                            previewer = true,
                            mappings = {
                                i = {
                                    ["<c-d>"] = "delete_buffer",
                                    ["<esc>"] = "close"
                                },
                                n = {
                                    ["<c-d>"] = "delete_buffer"
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
                        },
                        smart_open = {
                            match_algorithm = "fzf"
                        }
                    }
                }
            )

            local builtin = require("telescope.builtin")

            -- vim.api.nvim_set_keymap("n", "<leader>p", ":Telescope git_files<CR>", {noremap = true, silent = true})
            -- vim.api.nvim_set_keymap("n", "<leader>b", ":Telescope buffers<CR>", {noremap = true, silent = true})
            -- vim.api.nvim_set_keymap("n", "<leader>t", ":Telescope tags<CR>", {noremap = true, silent = true})

            -- function! FzfSpell()
            --     let suggestions = spellsuggest(expand('<cword>'))
            --     return fzf#run({'source': suggestions, 'sink': function('FzfSpellSink'), 'down': 10 })
            -- endfunction

            vim.keymap.set(
                "n",
                "<leader>p",
                function()
                    ts.extensions.smart_open.smart_open {cwd_only = true}
                end,
                {}
            )
            vim.keymap.set("n", "<leader>P", builtin.buffers, {})
            vim.keymap.set("n", "<leader>gg", builtin.live_grep, {})
            vim.keymap.set("n", "<leader>gs", builtin.lsp_document_symbols, {})
            vim.keymap.set("n", "<leader>gd", builtin.lsp_definitions, {})
            vim.keymap.set("n", "<leader>gr", builtin.lsp_references, {})

            vim.api.nvim_set_keymap("n", "z=", ":Telescope spell_suggest<CR>", {noremap = true, silent = true})

            ts.load_extension("fzf")
            ts.load_extension("luasnip")
            ts.load_extension("textcase")
            ts.load_extension("smart_open")
            -- ts.load_extension("dap")
        end
    }
}
