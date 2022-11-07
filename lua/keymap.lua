-- Map space as leader

vim.g.mapleader = " "

-- TODO(ayubm) use vim.keymap.set
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


-- Telescope
-- see https://github.com/nvim-telescope/telescope.nvim#getting-started
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})

