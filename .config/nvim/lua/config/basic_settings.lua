-- Leader
vim.g.mapleader = " "

-- syntax on
-- filetype plugin indent on
-- vim.opt.signcolumn = true
vim.opt.termguicolors = true
vim.opt.updatetime = 500

vim.wo.signcolumn = "yes"

vim.opt.showtabline = 2
vim.opt.number = true
vim.opt.clipboard:append("unnamedplus")
vim.opt.swapfile = false
vim.opt.backup = false

vim.opt.laststatus = 2
vim.opt.foldmethod = "indent"
vim.opt.foldlevelstart = 20
vim.opt.completeopt = {"noinsert", "menuone", "noselect"}
vim.opt.shortmess:append("c")

vim.opt.wildmode = {"longest", "full"}

vim.opt.linebreak = true
vim.opt.textwidth = 0

vim.opt.showmode = false
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = true
vim.opt.inccommand = "split"
vim.opt.showcmd = true

vim.opt.title = true
vim.opt.ruler = true
vim.opt.relativenumber = true

vim.opt.autoread = true
vim.opt.autowrite = true
vim.opt.hidden = true

vim.opt.expandtab = true
vim.opt.formatoptions:append("r")
vim.opt.tabstop = 4
vim.opt.softtabstop = 0 -- expandtab?
vim.opt.shiftwidth = 4
vim.opt.smarttab = true
vim.opt.autoindent = true
vim.opt.showmatch = true

vim.opt.shiftround = true
vim.opt.tags = "./tags"
vim.opt.splitright = true
vim.opt.splitbelow = true

vim.opt.undofile = true
vim.opt.undodir = vim.fn.expand("~/.cache/nvim/undo")
vim.opt.undolevels = 1000
vim.opt.undoreload = 10000

vim.filetype.add(
    {
        extension = {
            ["http"] = "http"
        }
    }
)
