-- setup LSP see :help lsp
vim.lsp.enable 'luals'
vim.lsp.enable 'gopls'

-- Setup LSP keymaps
vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(args)
    local opts = { buffer = args.buf }
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
    vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
  end,
})

-- TODO: apparently blink.cmp does not need the following
-- 	callback = function(ev)
-- 		local client = vim.lsp.get_client_by_id(ev.data.client_id)
-- 		if client and client:supports_method(vim.lsp.protocol.Methods.textDocument_completion) then
-- 			vim.opt.completeopt = { 'menu', 'menuone', 'noinsert', 'fuzzy', 'popup' }
-- 			vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
-- 			vim.keymap.set('i', '<C-Space>', function()
-- 				vim.lsp.completion.get()
-- 			end)
-- 		end
-- 	end,
-- })

vim.diagnostic.config {
  virtual_lines = false,
}

local function map(mode, lhs, rhs, description)
  local options = { noremap = true, silent = true, desc = description }
  vim.keymap.set(mode, lhs, rhs, options)
end

map('x', 'grm', '<cmd>lua require("jdtls").extract_method(true)<CR>', 'extract method')
map('n', 'gro', '<cmd>lua require("jdtls").organize_imports()<CR>', 'organise imports')
map('n', 'grv', '<cmd>lua require("jdtls").extract_variable()<CR>', 'extract variable')
map('v', 'grv', '<cmd>lua require("jdtls").extract_variable(true)<CR>', 'extract variable')
map('n', 'grc', '<cmd>lua require("jdtls").extract_constant()<CR>', 'extract constant')
map('v', 'grc', '<cmd>lua require("jdtls").extract_constant(true)<CR>', 'extract constant')
