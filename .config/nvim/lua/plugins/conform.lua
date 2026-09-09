-- Formatting via conform.nvim — manual only (<F2>); replaces formatter.nvim.
-- Builtins used where they exist; custom defs below preserve your previous args.
return {
    "stevearc/conform.nvim",
    cmd = {"ConformInfo"},
    keys = {
        {
            "<F2>",
            function()
                require("conform").format({async = false, lsp_format = "fallback"})
            end,
            mode = {"n", "v"},
            desc = "Format buffer/selection"
        }
    },
    opts = {
        -- no format_on_save; formatting is manual via <F2>
        formatters_by_ft = {
            python = {"ruff_organize_imports", "ruff_format"},
            yaml = {"prettier"},
            xml = {"xmllint"},
            sql = {"pg_format"},
            sh = {"shfmt"},
            rust = {"rustfmt"},
            markdown = {"prettier"},
            json = {"prettier", "jq"},
            jsonc = {"prettier", "jq"},
            lua = {"lua_format"},
            go = {"gofmt"},
            html = {"prettier"},
            css = {"prettier"},
            javascript = {"prettier"},
            javascriptreact = {"prettier"},
            typescript = {"prettier"},
            typescriptreact = {"prettier"}
        },
        -- Preserve previous args / define non-builtin formatters
        formatters = {
            jq = {prepend_args = {"--indent", "4"}},
            shfmt = {prepend_args = {"-i", "4", "-ci"}},
            pg_format = {command = "pg_format", args = {"-f", "2", "-"}, stdin = true},
            xmllint = {command = "xmllint", args = {"--format", "-"}, stdin = true},
            lua_format = {command = "lua-format", args = {}, stdin = true}
        }
    }
}
