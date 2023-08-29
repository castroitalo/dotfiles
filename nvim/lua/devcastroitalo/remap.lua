-- Change leader key to space
vim.g.mapleader = " "

-- General remap
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("v", "<M-k>", ":m '<-2<CR>gv=gv")
vim.keymap.set("v", "<M-j>", ":m '>+1<CR>gv=gv")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set('x', '<leader>p', [["_dP]])
vim.keymap.set('n', '<C-a>', 'gg<S-v>G')

-- Tabs
vim.keymap.set('n', 'te', ':tabedit<Return>', { silent = true })
vim.keymap.set('n', 'tn', ':tabn<Return>', { silent = true })
vim.keymap.set('n', 'tp', ':tabp<Return>', { silent = true })
vim.keymap.set('n', 'td', ':tabc<Return>', { silent = true })

-- Create splits
vim.keymap.set('n', 'ss', ':split<Return><C-w>w', { silent = true })
vim.keymap.set('n', 'sv', ':vsplit<Return><C-w>w', { silent = true })

-- Jump between split
vim.keymap.set("n", "<C-H>", "<C-w>h")
vim.keymap.set("n", "<C-L>", "<C-w>l")
vim.keymap.set("n", "<C-J>", "<C-w>j")
vim.keymap.set("n", "<C-K>", "<C-w>k")
