-- setup LSP see :help lsp
vim.lsp.enable 'luals'
vim.lsp.enable 'gopls'

-- Setup LSP keymaps
-- Note: grn (rename), gra (code action), grr (references), gri (implementation),
-- gO (document symbols), <C-s> (signature help) are 0.11 defaults.
vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(args)
    local opts = { buffer = args.buf }
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', 'gW', vim.lsp.buf.workspace_symbol, opts)
  end,
})

vim.diagnostic.config {
  virtual_lines = false,
}
