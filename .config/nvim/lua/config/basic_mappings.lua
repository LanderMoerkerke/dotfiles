-- Unbindings
vim.keymap.set("n", "Q", "")

-- Reload vim
vim.keymap.set("n", "<leader>rv", ":luafile $NVIM<cr>")

-- Reload current file
vim.keymap.set("n", "<leader>rf", ":e % <CR>")

-- Paste over visual but keep clipboard
vim.keymap.set("v", "<leader>p", "_dP")

-- Behave like other capitals
vim.keymap.set("n", "Y", "y$")

-- Keep search matches in middle
vim.keymap.set("n", "n", "nzz")
vim.keymap.set("n", "N", "Nzz")

-- Keep jumping in middle
vim.keymap.set("n", "<C-o>", "<C-o>zz")

-- Reselect text you just entered
vim.keymap.set("n", "gV", "`[v`]")

vim.keymap.set("n", "<leader><leader>c", ":w! | !compiler <c-r>%<CR><CR>")
vim.keymap.set("n", "<leader><leader>o", ":w! | !opout <c-r>%<CR><CR>")

-- Exit terminal with shift esc
vim.keymap.set("t", "<C-\\<>", "<C-\\><C-n>")
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>")

-- Increment decrement under cursor
vim.keymap.set("n", "<C-s>", "<C-a>")

-- Getting rid of the search highlights
vim.keymap.set("n", "<esc>", ":noh<cr>")

-- Sorting selection
vim.keymap.set("n", "<leader>s", ":sort<cr>")
vim.keymap.set("v", "<leader>s", ":sort<cr>")

-- Replace all
vim.keymap.set("n", "<leader>S", ":%s//g<Left><Left>")

-- Count occurances under the cursor
vim.keymap.set("n", ",*", "*<C-O>:%s///gn<CR>")
-- vim.keymap.set("n", ",* *<C-O>:%s///gn<Left><Left>

-- Open the selected text in a split (i.e. should be a file).
vim.keymap.set("n", "<leader>o", '"oyaW:vsp <C-R>o<CR>')
vim.keymap.set("x", "<leader>o", '"oy<esc>:vsp <C-R>o<CR>')
vim.keymap.set("v", "<leader>o", '"oy<esc>:vsp <C-R>o<CR>')

vim.keymap.set("n", "<leader>O", '"oyaW:sp <C-R>o<CR>')
vim.keymap.set("x", "<leader>O", '"oy<esc>:sp <C-R>o<CR>')
vim.keymap.set("v", "<leader>O", '"oy<esc>:sp <C-R>o<CR>')

-- Folding
vim.keymap.set("n", "<leader>z", ":set wrap!<cr>")

-- Reselect when indenting
vim.keymap.set("n", "<", "<gv")
vim.keymap.set("n", ">", ">gv")

-- Move visual block
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Insert word of the line above
vim.keymap.set(
    "i",
    "<C-Y>",
    '<C-C>:let @z = @"<CR>mz :exec \'normal!\' (col(\'.\')==1 && col(\'$\')==1 ? \'k\' : \'kl\')<CR> :exec (col(\'.\')==col(\'$\') - 1 ? \'let @" = @_\' : \'normal! yw\')<CR> `zp:let @" = @z<CR>a'
)

-- Diff saved
-- command! DiffSaved call s:DiffWithSaved()

-- ------
-- Navigation
-- ------

-- Basic navigation
-- vim.keymap.set("n", "k gk
-- vim.keymap.set("n", "j gj

-- Split navigation
vim.keymap.set("n", "<c-h>", "<c-w>h")
vim.keymap.set("n", "<c-j>", "<c-w>j")
vim.keymap.set("n", "<c-k>", "<c-w>k")
vim.keymap.set("n", "<c-l>", "<c-w>l")

-- Buffers
vim.keymap.set("n", "<c-n>", ":bnext<cr>")
vim.keymap.set("n", "<c-p>", ":bprevious<cr>")

-- Split
vim.keymap.set("n", "<leader>nn", ":split <cr>")
vim.keymap.set("n", "<leader>vn", ":vsplit <cr>")

-- Resize windows using arrow keys
vim.keymap.set("n", "<up>", "<C-W>+")
vim.keymap.set("n", "<down>", "<C-W>-")
vim.keymap.set("n", "<left>", "3<C-W><")
vim.keymap.set("n", "<right>", "3<C-W>>")

-- Resize reset
vim.keymap.set("n", "==", ":wincmd = <cr>")

-- Remove buffer
vim.keymap.set("n", "<leader>x", ":bp|bd #<CR>")

-- Go to last active tab
-- au TabLeave * let g:lasttab = tabpagenr()
vim.keymap.set("n", "<silent><leader><Tab>", ':exe "tabn ".g:lasttab<cr>')
vim.keymap.set("v", "<silent><leader><Tab>", ':exe "tabn ".g:lasttab<cr>')

-- ------
-- Quickfix
-- ------

-- errors of LC
vim.keymap.set("n", "<leader>qq", "<Esc>:lopen 8<CR>")
vim.keymap.set("n", "<leader>qn", "<Esc>:lnext<CR>")
vim.keymap.set("n", "<leader>qp", "<Esc>:lprev<CR>")

-- search items of Rg
vim.keymap.set("n", "<leader>Qq", "<Esc>:copen 8<CR>")
vim.keymap.set("n", "<leader>Qn", "<Esc>:cnext<CR>")
vim.keymap.set("n", "<leader>Qp", "<Esc>:cprev<CR>")
