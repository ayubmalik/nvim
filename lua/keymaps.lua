-- [[ Keymaps ]]
-- See :help vim.keymap.set()

local function map(mode, lhs, rhs, description)
  local options = { noremap = true, silent = true, desc = description }
  vim.keymap.set(mode, lhs, rhs, options)
end

map('n', '<Esc>', '<cmd>nohlsearch<CR>')
map('n', '<leader>q', vim.diagnostic.setloclist, 'Open diagnostic [Q]uickfix list')
map('n', '<F2>', ':set relativenumber!<cr>', 'toggle relative line numbers')
map('n', '<F3>', ':set list!<cr>', 'toggle whitespace')
map('i', 'kj', '<esc>', 'exit insert on kj')
map('i', '<c-d>', '<esc>lxi', 'delete char from right')

map('v', '<', '<gv', 'visual indent')
map('v', '>', '>gv', 'visual indent')

map('n', '<a-j>', ':m .+1<cr>', 'move line down')
map('n', '<a-k>', ':m .-2<cr>', 'move line up')
map('v', '<a-j>', ":m '>+1<cr>gv=gv", 'move line down')
map('v', '<a-k>', ":m '<-2<cr>gv=gv", 'move line up')

map('n', '<up>', '<nop>', 'disable arrow keys 😅')
map('n', '<down>', '<nop>', 'disable arrow keys')
map('n', '<left>', '<nop>', 'disable arrow keys')
map('n', '<right>', '<nop>', 'disable arrow keys')
map('i', '<up>', '<nop>', 'disable arrow keys')
map('i', '<down>', '<nop>', 'disable arrow keys')
map('i', '<left>', '<nop>', 'disable arrow keys')
map('i', '<right>', '<nop>', 'disable arrow keys')
map('', '<up>', '<nop>', 'disable arrow keys')
map('', '<down>', '<nop>', 'disable arrow keys')
map('', '<left>', '<nop>', 'disable arrow keys')
map('', '<right>', '<nop>', 'disable arrow keys')
map('n', '-', '<cmd>Oil<cr>', 'oil plugin')

-- this should work by default but does not unless added
map('n', 'gO', vim.lsp.buf.document_symbol, 'document symbols')
map('n', 'gW', vim.lsp.buf.workspace_symbol, 'workspace symbols')
