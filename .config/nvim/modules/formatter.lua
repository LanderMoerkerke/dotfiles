local formatter = require("formatter")

local autoflake = function()
    return {
        exe = "autoflake",
        args = {
            -- "--expand-star-imports",
            "--remove-all-unused-imports",
            "--remove-unused-variables",
            "--remove-duplicate-keys",
            "-s",
            "-"
        },
        stdin = true
    }
end

local black = function()
    return {
        exe = "black",
        args = {"-l", "120", "-"},
        -- args = {"-l", "120", "--stdin-filename", vim.api.nvim_buf_get_name(0), "-"},
        stdin = true
    }
end

local ruff = function()
    return {
        exe = "ruff",
        args = {"--fix", "-"},
        stdin = true
    }
end

local eslint = function()
    return {
        exe = "prettier",
        args = {
            "--config-precedence",
            "prefer-file",
            -- you can add more global setup here
            "--stdin-filepath",
            vim.fn.shellescape(vim.api.nvim_buf_get_name(0))
        },
        stdin = true
    }
end

local gofmt = function()
    return {
        exe = "gofmt",
        args = {},
        stdin = true
    }
end

local isort = function()
    return {
        exe = "isort",
        args = {"-"},
        stdin = true
    }
end

local jq = function()
    return {
        exe = "jq",
        -- args = {},
        args = {"--indent", "4"},
        stdin = true
    }
end

local luafmt = function()
    return {
        exe = "luafmt",
        args = {"--stdin"},
        stdin = true
    }
end

local pgformatter = function()
    return {
        exe = "pg_format",
        args = {"-f", "2", "-"},
        stdin = true
    }
end

local prettier = function()
    return {
        exe = "prettier",
        args = {"--stdin-filepath", vim.api.nvim_buf_get_name(0), "--single-quote"},
        stdin = true
    }
end

local remark = function()
    return {
        exe = "remark",
        args = {"--stdout"},
        stdin = true
    }
end

local rustfmt = function()
    return {
        exe = "rustfmt",
        args = {},
        stdin = true
    }
end

local shfmt = function()
    return {
        exe = "shfmt",
        args = {"-i", "4", "-ci", "-"},
        stdin = true
    }
end

local xmllint = function()
    return {
        exe = "xmllint",
        args = {"--format", "-"},
        stdin = true
    }
end

formatter.setup(
    {
        logging = false,
        filetype = {
            python = {isort, black},
            yaml = {prettier},
            xml = {xmllint},
            sql = {pgformatter},
            sh = {shfmt},
            rust = {rustfmt},
            markdown = {remark},
            json = {prettier, jq},
            lua = {luafmt},
            go = {gofmt},
            css = {prettier},
            javascript = {eslint},
            javascriptreact = {eslint},
            typescript = {eslint, prettier},
            typescriptreact = {eslint}
        }
    }
)

vim.api.nvim_exec(
    [[
augroup FormatAutogroup
  autocmd!
  autocmd BufWritePost *.lua,*.tsx,*.ts,*.js,*.jsx,*.py,*.go,*.rs,*.sh,*.bash FormatWrite
augroup END
]],
    true
)
