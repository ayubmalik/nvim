require "options"
require "keymap"
require "plugins"
require "colorscheme"
require "completion"
require "lsp-config"

-- general plugin config
require("telescope").setup {
  defaults = {
    initial_mode = "insert"
  }
}
