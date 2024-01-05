return {
    {
        "neovim/nvim-lspconfig",
        config = function()
            local nvim_lsp = require("lspconfig")
            local opts = {noremap = true, silent = true}

            -- Errors
            vim.api.nvim_set_keymap("n", "<leader>e", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
            vim.api.nvim_set_keymap("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts)
            vim.api.nvim_set_keymap("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts)
            vim.api.nvim_set_keymap("n", "<leader>q", "<cmd>lua vim.diagnostic.setloclist()<CR>", opts)

            -- Custom signs
            local signs = {Error = " ", Warn = " ", Hint = " ", Info = " "}
            for type, icon in pairs(signs) do
                local hl = "DiagnosticSign" .. type
                vim.fn.sign_define(hl, {text = icon, texthl = hl, numhl = hl})
            end

            local on_attach = function(_client, bufnr)
                vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

                -- Definitions
                vim.api.nvim_buf_set_keymap(bufnr, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
                vim.api.nvim_buf_set_keymap(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)

                vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)

                -- Help
                vim.api.nvim_buf_set_keymap(bufnr, "n", "K", "<cmd>Lspsaga hover_doc<CR>", opts)
                vim.api.nvim_buf_set_keymap(bufnr, "n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
                -- vim.api.nvim_buf_set_keymap(bufnr, "n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)

                vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>tt", "<cmd>Lspsaga term_toggle<CR>", opts)

                -- Workspace
                vim.api.nvim_buf_set_keymap(
                    bufnr,
                    "n",
                    "<leader>wa",
                    "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>",
                    opts
                )
                vim.api.nvim_buf_set_keymap(
                    bufnr,
                    "n",
                    "<leader>wr",
                    "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>",
                    opts
                )
                vim.api.nvim_buf_set_keymap(
                    bufnr,
                    "n",
                    "<leader>wl",
                    "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>",
                    opts
                )

                vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>rn", "<cmd>Lspsaga rename<CR>", opts)
                vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", opts)
                vim.api.nvim_buf_set_keymap(bufnr, "n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)

                require "lsp_signature".on_attach(
                    {
                        bind = true,
                        fix_pos = true,
                        handler_opts = {
                            border = "single"
                        },
                        zindex = 50
                    }
                )
            end

            local capabilities = vim.lsp.protocol.make_client_capabilities()
            capabilities.textDocument.completion.completionItem.snippetSupport = true
            capabilities.textDocument.completion.completionItem.resolveSupport = {
                properties = {
                    "documentation",
                    "detail",
                    "additionalTextEdits"
                }
            }

            -- Enable the following language servers
            local servers = {
                "bashls",
                "clangd",
                "cssls",
                "dockerls",
                "gopls",
                "lemminx",
                "html",
                "jsonls",
                "rust_analyzer",
                "ruff_lsp",
                -- "pyright",
                "tsserver",
                "denols",
                -- "lua_ls",
                "yamlls"
            }
            for _, lsp in ipairs(servers) do
                nvim_lsp[lsp].setup {
                    on_attach = on_attach,
                    capabilities = capabilities
                }
            end

            nvim_lsp.pyright.setup {
                cmd = {"pyright-langserver", "--stdio", "-p", vim.fn.expand("$XDG_CONFIG_HOME/pyright/config.json")},
                on_attach = on_attach,
                capabilities = capabilities
            }

            nvim_lsp.lua_ls.setup {
                cmd = {"lua-language-server"},
                on_attach = on_attach,
                settings = {
                    Lua = {
                        runtime = {
                            version = "LuaJIT",
                            path = vim.split(package.path, ";")
                        },
                        diagnostics = {
                            globals = {"vim"}
                        },
                        workspace = {
                            library = {
                                [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                                [vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true
                            }
                        }
                    }
                }
            }

            -- Map :Format to vim.lsp.buf.formatting()
            vim.cmd([[ command! Format execute 'lua vim.lsp.buf.formatting()' ]])

            -- Customizing how diagnostics are displayed
            vim.lsp.handlers["textDocument/publishDiagnostics"] =
                vim.lsp.with(
                vim.lsp.diagnostic.on_publish_diagnostics,
                {
                    virtual_text = false,
                    signs = true,
                    underline = true,
                    update_in_insert = true
                }
            )
        end
    },
    {
        "nvimdev/lspsaga.nvim",
        opts = {},
        config = function()
            require("lspsaga").setup(
                {
                    ui = {
                        kind = require("catppuccin.groups.integrations.lsp_saga").custom_kind()
                    },
                    symbol_in_winbar = {
                        folder_level = 5
                    },
                    code_action = {
                        extend_gitsigns = true
                    },
                    lightbulb = {
                        enable = false
                    },
                    outline = {
                        -- detail = false,
                        auto_preview = false
                    },
                    beacon = {
                        enable = false
                    }
                }
            )
        end,
        event = "LspAttach",
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
            "nvim-tree/nvim-web-devicons"
        }
    },
    {
        "ray-x/lsp_signature.nvim",
        event = "LspAttach",
        opts = {}
    },
    {
        "seblj/nvim-echo-diagnostics",
        event = "LspAttach",
        config = function()
            local diagnostics = vim.api.nvim_create_augroup("diagnostics", {clear = true})

            vim.api.nvim_create_autocmd(
                {"CursorHold"},
                {
                    pattern = "*",
                    group = diagnostics,
                    command = "lua require('echo-diagnostics').echo_line_diagnostic()"
                }
            )

            -- autocmd CursorHold * lua require('echo-diagnostics').echo_line_diagnostic()
        end
    }
}
