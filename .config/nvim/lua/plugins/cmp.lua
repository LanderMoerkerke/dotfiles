return {
    "hrsh7th/nvim-cmp",
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-calc",
        "hrsh7th/cmp-nvim-lsp-signature-help",
        "saadparwaiz1/cmp_luasnip",
        "uga-rosa/cmp-dictionary",
        "f3fora/cmp-spell",
        "FelipeLema/cmp-async-path",
        "onsails/lspkind.nvim"
    },
    config = function()
        local cmp = require "cmp"
        local luasnip = require("luasnip")
        local has_words_before = function()
            unpack = unpack or table.unpack
            local line, col = unpack(vim.api.nvim_win_get_cursor(0))
            return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
        end
        local kind_icons = {
            Text = "",
            Method = "󰆧",
            Function = "󰊕",
            Constructor = "",
            Field = "󰇽",
            Variable = "󰂡",
            Class = "󰠱",
            Interface = "",
            Module = "",
            Property = "󰜢",
            Unit = "",
            Value = "󰎠",
            Enum = "",
            Keyword = "󰌋",
            Snippet = "",
            Color = "󰏘",
            File = "󰈙",
            Reference = "",
            Folder = "󰉋",
            EnumMember = "",
            Constant = "󰏿",
            Struct = "",
            Event = "",
            Operator = "󰆕",
            TypeParameter = "󰅲",
            Calc = "󰃬"
        }
        cmp.setup(
            {
                formatting = {
                    format = function(entry, vim_item)
                        local lspkind_ok, lspkind = pcall(require, "lspkind")
                        if entry.source.name == "calc" then
                            vim_item.kind = kind_icons.Calc
                            return vim_item
                        end
                        if not lspkind_ok then
                            vim_item.kind = string.format("%s %s", kind_icons[vim_item.kind], vim_item.kind) -- This concatonates the icons with the name of the item kind
                            return vim_item
                        else
                            return lspkind.cmp_format()(entry, vim_item)
                        end
                    end
                },
                snippet = {
                    expand = function(args)
                        require("luasnip").lsp_expand(args.body)
                    end
                },
                window = {},
                mapping = {
                    ["<Tab>"] = cmp.mapping(
                        function(fallback)
                            if cmp.visible() then
                                -- You could replace the expand_or_jumpable() calls with expand_or_locally_jumpable()
                                -- they way you will only jump inside the snippet region
                                cmp.select_next_item()
                            elseif luasnip.expand_or_jumpable() then
                                luasnip.expand_or_jump()
                            elseif has_words_before() then
                                cmp.complete()
                            else
                                fallback()
                            end
                        end,
                        {"i", "s"}
                    ),
                    ["<S-Tab>"] = cmp.mapping(
                        function(fallback)
                            if cmp.visible() then
                                cmp.select_prev_item()
                            elseif luasnip.jumpable(-1) then
                                luasnip.jump(-1)
                            else
                                fallback()
                            end
                        end,
                        {"i", "s"}
                    ),
                    ["<CR>"] = cmp.mapping.confirm({select = true})
                },
                sources = {
                    {name = "luasnip", priority = 8},
                    {name = "nvim_lsp_signature_help", priority = 8},
                    {name = "nvim_lsp", priority = 7},
                    {name = "async_path", priority = 5},
                    {name = "documentation", priority = 4},
                    {name = "calc", priority = 3},
                    {name = "spell", priority = 2},
                    {name = "buffer", priority = 1}
                }
            }
        )
        -- Use buffer source for `/`.
        cmp.setup.cmdline(
            "/",
            {
                completion = {autocomplete = false},
                sources = {
                    -- { name = 'buffer' }
                    {name = "buffer", opts = {keyword_pattern = [=[[^[:blank:]].*]=]}}
                }
            }
        )
        -- Use cmdline & path source for ':'.
        cmp.setup.cmdline(
            ":",
            {
                completion = {autocomplete = false},
                sources = cmp.config.sources(
                    {
                        {name = "path"}
                    },
                    {
                        {name = "cmdline"}
                    }
                )
            }
        )
    end
}
