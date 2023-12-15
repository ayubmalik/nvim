require "options"
require "plugins"
require "colorscheme"
require "keymap"
require "colorscheme"
require "completion"
require "lsp-config"

-- required for backward compatibility
if not table.unpack then
  table.unpack = unpack
end

