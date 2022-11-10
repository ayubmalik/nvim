-- Map space as leader
vim.g.mapleader = " "

-- TODO(ayubm) use vim.keymap.set
local function map(mode, lhs, rhs)
  local options = { noremap = true, silent = true }
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- Normal
map("n", "<f2>", ":24Lex<cr>")
map("n", "<f3>", ":set relativenumber!<cr>")
map("n", "<f4>", ":set hlsearch!<cr>")
map("n", "<f5>", ":setlocal spell! spelllang=en_GB<cr>")
map("n", "<c-s>", ":update<cr>")
map("n", "<a-J>", ":m .+1<cr>")
map("n", "<a-k>", ":m .-2<cr>")

-- Insert
map("i", "kj", "<esc>")
-- map("i", "<c-s>", "<esc>:update<cr>a") -- stay insert
map("i", "<c-s>", "<esc>:update<cr>") -- exit insert
map("i", "<c-d>", "<esc>lxi")

-- Visual
map("v", "<", "<gv")
map("v", ">", ">gv")
map("v", "<a-j>", ":m '>+1<cr>gv=gv")
map("v", "<a-k>", ":m '<-2<cr>gv=gv")

-- Terminal
map("n","<leader>t", ":split | resize 16 | terminal<cr>")
map("t", "<esc>", "<c-\\><c-n>")

vim.api.nvim_create_autocmd(
  { "TermOpen" },
  { pattern = {"*"}, command = "startinsert" }
)

-- Disable arrow keys 😅
map("n", "<up>", "<nop>")
map("n", "<down>", "<nop>")
map("n", "<left>", "<nop>")
map("n", "<right>", "<nop>")

-- Telescope
-- see https://github.com/nvim-telescope/telescope.nvim#getting-started
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})

