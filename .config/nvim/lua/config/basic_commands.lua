vim.api.nvim_create_user_command("ReverseBuffer", "g/^/m0", {})
vim.api.nvim_create_user_command("JSONToPython", "%s/true/True/g | %s/false/False/g | %s/null/None/g", {})
