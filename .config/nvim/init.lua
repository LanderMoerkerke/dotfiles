vim.g.mapleader = " "

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system(
        {
            "git",
            "clone",
            "--filter=blob:none",
            "https://github.com/folke/lazy.nvim.git",
            "--branch=stable",
            lazypath
        }
    )
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins")

require("config.basic_settings")
require("config.basic_commands")
require("config.basic_functions")
require("config.basic_mappings")
require("config.function_mappings")
require("config.diff")
require("config.templates")
require("config.autocommands")
