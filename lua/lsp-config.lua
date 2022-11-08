-- LSP config using mason

require("mason").setup()

require("mason-lspconfig").setup({
    ensure_installed = {
        "sumneko_lua",
        "gopls",
        "tsserver",
    }
})


local capabilities = require('cmp_nvim_lsp').default_capabilities()
require('lspconfig').gopls.setup {
    capabilities = capabilities
}

require("lspconfig").sumneko_lua.setup {
    capabilities = capabilities
}

require("lspconfig").tsserver.setup {
    capabilities = capabilities
}

