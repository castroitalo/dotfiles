-- Remaps
vim.g.mapleader = ' '

--     - General remap
vim.keymap.set('n', '<leader>pv', vim.cmd.Ex)
vim.api.nvim_set_keymap('n', '<leader>pv', ':Ex<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<M-k>', ':m \'<-2<CR>gv=gv<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<M-j>', ':m \'>+1<CR>gv=gv<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-d>', '<C-d>zz', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-u>', '<C-u>zz', { noremap = true, silent = true })
vim.api.nvim_set_keymap('x', '<leader>p', '[["_dP]]', { noremap = true, silent = true })

--     - Tabs
vim.api.nvim_set_keymap('n', 'te', ':tabedit<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'tn', ':tabn<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'tp', ':tabp<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'td', ':tabc<CR>', { noremap = true, silent = true })

--     - Splits
vim.api.nvim_set_keymap('n', 'ss', ':split<CR><C-w>w', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'sv', ':vsplit<CR><C-w>w', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-H>', '<C-w>h', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-L>', '<C-w>l', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-J>', '<C-w>j', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-K>', '<C-w>k', { noremap = true, silent = true })

-- Function to copy selected text to clipboard
function CopyToClipboard()
    local selected_text = vim.fn.getreg('"')
    vim.fn.setreg('+', selected_text)
end

vim.api.nvim_set_keymap('v', '<leader>y', [[:lua CopyToClipboard()<CR>]], { noremap = true, silent = true })


