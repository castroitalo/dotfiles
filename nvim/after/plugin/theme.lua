require("monokai-pro").setup({
    transparent_background = false,
    terminal_colors = false,
    devicons = false,
    styles = {
        comment = { italic = false },
        keyword = { italic = false }, 
        type = { italic = false }, 
        storageclass = { italic = false }, 
        structure = { italic = false }, 
        parameter = { italic = false }, 
        annotation = { italic = false },
        tag_attribute = { italic = false }
    },
    filter = "classic"
})

-- setup must be called before loading
vim.cmd([[colorscheme monokai-pro]])
