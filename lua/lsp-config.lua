-- LSP config using mason
require("mason").setup()

require("mason-lspconfig").setup({
  ensure_installed = {
    "lua_ls",
    "gopls",
    -- "pyright",
    "tsserver"
  }
})

local function map(mode, lhs, rhs)
  local options = { noremap = true, silent = true }
  vim.keymap.set(mode, lhs, rhs, options)
end

local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())
capabilities.textDocument.completion.completionItem.snippetSupport = true

local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  map("n", "gd", vim.lsp.buf.definition)
  map("n", "gD", vim.lsp.buf.declaration)
  map("n", "gr", vim.lsp.buf.references)
  map("n", "gI", vim.lsp.buf.implementation)
  map("n", "K", vim.lsp.buf.hover)
  map("n", "<C-k>", vim.lsp.buf.signature_help)
  map("n", "<leader>wa", vim.lsp.buf.add_workspace_folder)
  map("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder)
  map("n", "<leader>wl", function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end)
  map("n", "<leader>D", vim.lsp.buf.type_definition)
  map("n", "<leader>ca", vim.lsp.buf.code_action)
  map("v", "<leader>ca", vim.lsp.buf.range_code_action)
  map("n", "<leader>rn", vim.lsp.buf.rename)
  map("n", "<leader>f", function() vim.lsp.buf.formatting({ async = true }) end)
  map("n", "<leader>dd", vim.diagnostic.open_float)
  map("n", "[[", vim.diagnostic.goto_prev)
  map("n", "]]", vim.diagnostic.goto_next)
  map("n", "<leader>q", vim.diagnostic.setloclist)

  vim.diagnostic.config({ virtual_text = false })
end

local lsp_flags = {
  debounce_text_changes = 150,
  allow_incremental_sync = true,
  exit_timeout = false
}

-- Golang LSP config
function OrgImports(wait_ms)
  local params = vim.lsp.util.make_range_params()
  params.context = { only = { "source.organizeImports" } }
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

local golang_grp = vim.api.nvim_create_augroup("golang", { clear = true })
vim.api.nvim_create_autocmd({ "BufWritePre" }, { group = golang_grp, pattern = "*.go", command = "lua OrgImports(1000)" })
vim.api.nvim_create_autocmd({ "BufWritePre" }, { group = golang_grp, pattern = "*.go", command = "lua vim.lsp.buf.formatting_sync()" })

-- gopls setup
require("lspconfig").gopls.setup {
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
require("lspconfig").lua_ls.setup {
  capabilities = capabilities,
  on_attach = on_attach,
  flags = lsp_flags,

  settings = {
    Lua = {
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

-- Python LSP configuration
--require("lspconfig").pyright.setup {
--  capabilities = capabilities,
--  on_attach = on_attach,
--  flags = lsp_flags,
--}
