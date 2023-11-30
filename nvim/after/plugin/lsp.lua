local lsp = require('lsp-zero')

lsp.preset('recommended')

-- Language servers (installation and setup)
require('mason').setup({})
require('mason-lspconfig').setup({
	ensure_installed = {
		'clangd',
		'docker_compose_language_service',
		'dockerls',
		'emmet_ls',
		'html',
		'intelephense',
		'tsserver'
	}
})

lsp.setup_servers({
    'clangd',
    'docker_compose_language_service',
    'dockerls',
    'emmet_ls',
    'html',
    'intelephense',
    'tsserver'
})

-- Mapping
local cmp = require('cmp')
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = lsp.defaults.cmp_mappings({
	['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
	['<C-n>'] = cmp.mapping.select_next_item(cmp_select)
})
