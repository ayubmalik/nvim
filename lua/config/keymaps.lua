-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local Util = require("lazyvim.util")

local function map(mode, lhs, rhs)
  local options = { noremap = true, silent = true }
  vim.keymap.set(mode, lhs, rhs, options)
end

-- if vim.lsp.buf.inlay_hint or vim.lsp.inlay_hint then
--   vim.keymap.set("n", "<leader>uh", function()
--     Util.toggle.inlay_hints()
--   end, { desc = "Toggle Inlay Hints" })
-- end

-- Normal
-- map("n", "<f2>", ":set relativenumber!<cr>")
-- map("n", "<f3>", ":set hlsearch!<cr>")
-- map("n", "<f4>", ":DiffviewOpen<cr>")
-- map("n", "<f5>", ":setlocal spell! spelllang=en_gb<cr>")
-- map("n", "<c-s>", ":update<cr>")
-- map("n", "<a-j>", ":m .+1<cr>")
-- map("n", "<a-k>", ":m .-2<cr>")

-- Insert
map("i", "kj", "<esc>")
-- map("i", "<c-s>", "<esc>:update<cr>") -- exit insert
map("i", "<c-d>", "<esc>lxi") -- delete a char

-- Visual
map("v", "<", "<gv")
map("v", ">", ">gv")
-- map("v", "<a-j>", ":m '>+1<cr>gv=gv")
-- map("v", "<a-k>", ":m '<-2<cr>gv=gv")

-- Disable arrow keys 😅
vim.opt.mouse = map("n", "<up>", "<nop>")
map("n", "<down>", "<nop>")
map("n", "<left>", "<nop>")
map("n", "<right>", "<nop>")
map("i", "<up>", "<nop>")
map("i", "<down>", "<nop>")
map("i", "<left>", "<nop>")
map("i", "<right>", "<nop>")
map("", "<up>", "<nop>")
map("", "<down>", "<nop>")
map("", "<left>", "<nop>")
map("", "<right>", "<nop>")
