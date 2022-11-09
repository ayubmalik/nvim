-- LSP config using mason

require("mason").setup()

require("mason-lspconfig").setup({
    ensure_installed = {
        "sumneko_lua",
        "gopls",
        "tsserver",
    }
})


local capabilities = vim.lsp.protocol.make_client_capabilities()
require('lspconfig').gopls.setup {
    capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)
}

require("lspconfig").sumneko_lua.setup {
    capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities),
    settings = {
        Lua =  {
            diagnostics = {
                globals = { "vim" }
            }
        }
    }
}

require("lspconfig").tsserver.setup {
    capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)
}

