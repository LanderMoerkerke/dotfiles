vim.api.nvim_create_user_command("ReverseBuffer", "g/^/m0", {})
vim.api.nvim_create_user_command("JSONToPython", "%s/true/True/g | %s/false/False/g | %s/null/None/g", {})

vim.api.nvim_create_user_command("Scratch", function(opts)
    local ext = opts.args ~= "" and opts.args or "md"
    local path = os.date("/tmp/scratch-%Y%m%d-%H%M%S.") .. ext
    vim.cmd.edit(vim.fn.fnameescape(path))
end, {
    nargs = "?",
    complete = function(lead)
        local exts = {
            "md", "json", "json5", "yaml", "yml", "toml", "http", "sql",
            "py", "sh", "lua", "js", "ts", "xml", "csv", "txt",
        }
        return vim.tbl_filter(function(e)
            return e:find("^" .. lead)
        end, exts)
    end,
})
