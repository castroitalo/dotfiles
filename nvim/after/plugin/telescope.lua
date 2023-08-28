local builtin = require('telescope.builtin')
local telescope = require('telescope')

telescope.setup {
    pickers = {
        find_files = {
            hidden = true
        }
    }
}
vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
