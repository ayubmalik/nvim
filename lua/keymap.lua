function map(mode, lhs, rhs)
  local options = { noremap = true, silent = true }
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- Normal
map("n", "<f2>", ":set relativenumber!<cr>")
map("n", "<f3>", ":set hlsearch!<cr>")
map("n", "<c-s>", ":update<cr>")
map("n", "<a-j>", ":m .+1<cr>")
map("n", "<a-k>", ":m .-2<cr>")

-- Insert
map("i", "kj", "<esc>")
map("i", "<c-s>", "<esc>:update<cr>a")
map("i", "<c-d>", "<esc>lxi")

-- Visual
map("v", "<", "<gv")
map("v", ">", ">gv")
map("v", "<a-j>", ":m '>+1<cr>gv=gv")
map("v", "<a-k>", ":m '<-2<cr>gv=gv")

