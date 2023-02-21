require "plugins"
require "options"
require "keymap"
require "colorscheme"
require "completion"
require "lsp-config"

-- general plugin config
require("telescope").setup {
  defaults = {
    initial_mode = "insert"
  }
}
