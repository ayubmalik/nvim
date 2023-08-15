require "plugins"
require "options"
require "keymap"
require "colorscheme"
require "completion"
require "lsp-config"

table.unpack = table.unpack or unpack -- 5.1 compatibility see https://github.com/hrsh7th/nvim-cmp/issues/1017

-- using fzf.lua instead
--require("telescope").setup {
--  defaults = {
--    initial_mode = "insert"
--  }
--}
