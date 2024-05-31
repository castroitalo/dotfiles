-- Default options:
require('kanagawa').setup({
	commentStyle = { italic = false },
	keywordStyle = { italic = false}
})

-- setup must be called before loading
vim.cmd("colorscheme kanagawa")
