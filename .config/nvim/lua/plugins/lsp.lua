return {
    {
        "neovim/nvim-lspconfig",
        config = function()
            -- Diagnostics configuration (replaces both the old vim.diagnostic.config and vim.lsp.handlers block)
            vim.diagnostic.config({
                virtual_text = {current_line = true},
                signs = {text = {"", "", "", ""}},
                underline = {severity = {min = vim.diagnostic.severity.ERROR}},
                update_in_insert = true
            })

            -- Diagnostic keymaps (global)
            vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float,
                           {silent = true})
            vim.keymap.set("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>",
                           {silent = true})
            vim.keymap.set("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<CR>",
                           {silent = true})
            vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist,
                           {silent = true})

            -- Global LspAttach autocmd (replaces per-server on_attach)
            vim.api.nvim_create_autocmd("LspAttach", {
                callback = function(args)
                    local bufnr = args.buf

                    vim.lsp.inlay_hint.enable()
                    vim.bo[bufnr].omnifunc = "v:lua.vim.lsp.omnifunc"

                    local map = function(mode, lhs, rhs, desc)
                        vim.keymap.set(mode, lhs, rhs, {
                            buffer = bufnr,
                            silent = true,
                            desc = desc
                        })
                    end

                    -- Definitions
                    map("n", "gD", vim.lsp.buf.declaration, "Go to declaration")
                    map("n", "gd", vim.lsp.buf.definition, "Go to definition")
                    map("n", "<leader>D", vim.lsp.buf.type_definition,
                        "Type definition")

                    -- Help
                    map("n", "K", "<cmd>Lspsaga hover_doc<CR>", "Hover doc")
                    map("n", "gi", vim.lsp.buf.implementation,
                        "Go to implementation")

                    -- Terminal
                    map("n", "<leader>tt", "<cmd>Lspsaga term_toggle<CR>",
                        "Toggle terminal")

                    -- Workspace
                    map("n", "<leader>wa", vim.lsp.buf.add_workspace_folder,
                        "Add workspace folder")
                    map("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder,
                        "Remove workspace folder")
                    map("n", "<leader>wl", function()
                        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
                    end, "List workspace folders")

                    -- Refactoring
                    map("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", "Rename")
                    map("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>",
                        "Code action")
                    map("n", "gr", vim.lsp.buf.references, "References")

                    require("lsp_signature").on_attach({
                        bind = true,
                        fix_pos = true,
                        handler_opts = {border = "single"},
                        zindex = 50
                    })
                end
            })

            local capabilities = vim.lsp.protocol.make_client_capabilities()
            capabilities.textDocument.completion.completionItem.resolveSupport =
                {
                    properties = {
                        "documentation", "detail", "additionalTextEdits"
                    }
                }
            capabilities.textDocument.foldingRange = {
                dynamicRegistration = false,
                lineFoldingOnly = true
            }

            -- Enable language servers
            local servers = {
                "bashls", "clangd", "cssls", "dockerls", "gopls", "lemminx",
                "html", "jsonls", "rust_analyzer", "ruff", "ts_ls", "denols",
                "yamlls", "shopify_theme_ls", "ty"
            }
            for _, lsp in ipairs(servers) do
                vim.lsp.enable(lsp)
                vim.lsp.config(lsp, {capabilities = capabilities})
            end

            vim.lsp.enable("lua_ls")
            vim.lsp.config("lua_ls", {
                cmd = {"lua-language-server"},
                capabilities = capabilities,
                settings = {
                    Lua = {
                        runtime = {
                            version = "LuaJIT",
                            path = vim.split(package.path, ";")
                        },
                        diagnostics = {globals = {"vim"}},
                        workspace = {
                            library = {
                                [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                                [vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true
                            }
                        }
                    }
                }
            })

            -- :Format command
            vim.api.nvim_create_user_command("Format", function()
                vim.lsp.buf.format()
            end, {})
        end
    }, {
        "nvimdev/lspsaga.nvim",
        config = function()
            require("lspsaga").setup({
                ui = {
                    kind = require("catppuccin.groups.integrations.lsp_saga").custom_kind()
                },
                symbol_in_winbar = {enable = true, folder_level = 5},
                code_action = {extend_gitsigns = true},
                lightbulb = {enable = false},
                outline = {auto_preview = false},
                beacon = {enable = false},
                implement = {
                    enable = true,
                    sign = true,
                    virtual_text = true,
                    priority = 10000
                }
            })
        end,
        event = "LspAttach",
        dependencies = {
            "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons"
        }
    }, {"ray-x/lsp_signature.nvim", event = "LspAttach", opts = {}}
}
