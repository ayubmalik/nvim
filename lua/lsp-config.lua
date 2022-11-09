-- LSP config using mason
require("mason").setup()

require("mason-lspconfig").setup({
  ensure_installed = {
    "sumneko_lua",
    "gopls",
    "tsserver",
  }
})


local api = vim.api
local cmp_nvim_lsp = require("cmp_nvim_lsp")
local capabilities = cmp_nvim_lsp.update_capabilities(vim.lsp.protocol.make_client_capabilities())

capabilities.textDocument.completion.completionItem.snippetSupport = true

local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)
  vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  vim.keymap.set('n', '<space>f', function() vim.lsp.buf.format { async = true } end, bufopts)
  vim.keymap.set("n", "[[", vim.diagnostic.goto_prev, bufopts)
  vim.keymap.set("n", "]]", vim.diagnostic.goto_next, bufopts)

end

local lsp_flags = {
  debounce_text_changes = 150,
  allow_incremental_sync = true,
  exit_timeout = false
}

-- Golang LSP config
function OrgImports(wait_ms)
  local params = vim.lsp.util.make_range_params()
  params.context = {only = {"source.organizeImports"}}
  local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, wait_ms)
  for _, res in pairs(result or {}) do
    for _, r in pairs(res.result or {}) do
     if r.edit then
      vim.lsp.util.apply_workspace_edit(r.edit, "utf-8")
    else
   vim.lsp.buf.execute_command(r.command)
     end
    end
  end
end

-- TODO(ayubm) use command group and only run for gopls?
api.nvim_create_autocmd( {"BufWritePre"}, {pattern = "*.go", command = "lua OrgImports(1000)"})

require('lspconfig').gopls.setup {
  capabilities = capabilities,
  on_attach = on_attach,
  flags = lsp_flags,
  settings = {
    gopls = {
      experimentalPostfixCompletions = true,
      analyses = {
        unusedparams = true,
        shadow = true,
      },
      staticcheck = true,
    },
  },
  init_options = {
    usePlaceholders = true,
  }
}

-- Lua LSP config
require("lspconfig").sumneko_lua.setup {
  capabilities = capabilities,
  on_attach = on_attach,
  flags = lsp_flags,

  settings = {
    Lua =  {
      diagnostics = {
        globals = { "vim" }
      }
    }
  }
}

-- Typescript LSP config
require("lspconfig").tsserver.setup {
  capabilities = capabilities,
  on_attach = on_attach,
  flags = lsp_flags,
}

