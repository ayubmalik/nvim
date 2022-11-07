function map(mode, lhs, rhs)
  local options = { noremap = true, silent = true }
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- Normal
map("n", "<F2>", ":set relativenumber!<cr>")
map("n", "<F3>", ":set hlsearch!<cr>")
map("n", "<C-s>", ":update<cr>")
map("n", "<A-j>", ":m .+1<cr>")
map("n", "<A-k>", ":m .-2<cr>")

-- Insert
map("i", "kj", "<esc>")
map("i", "<C-s>", "<esc>:update<cr>a")
map("i", "<C-d>", "<esc>lxi")

-- Visual
map("v", "<", "<gv")
map("v", ">", ">gv")
map("v", "<A-j>", ":m '>+1<cr>gv=gv")
map("v", "<A-k>", ":m '<-2<cr>gv=gv")

