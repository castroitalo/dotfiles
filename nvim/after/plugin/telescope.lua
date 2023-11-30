local telescope = require('telescope.builtin')

vim.keymap.set('n', '<leader>pf', telescope.find_files, {})

require('telescope').setup {
    pickers = {
        find_files = {
            hidden = true
        }
    }
}
