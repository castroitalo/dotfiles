local lspconfig = require('lspconfig')

lspconfig.emmet_ls.setup({
    capabilities = capabilities,
    filetypes = { 
        "css", 
        "html", 
        "javascript", 
        "javascriptreact", 
        "less", 
        "sass", 
        "scss", 
        "svelte", 
        "pug", 
        "typescriptreact", 
        "vue",
        "php"
    },
    init_options = {
        html = {
            options = {
                ["bem.enabled"] = true,
            },
        },
    }
})

local lsp = require('lsp-zero').preset({})

lsp.on_attach(function(client, bufnr)
    lsp.default_keymaps({buffer = bufnr})
end)

lsp.setup()
