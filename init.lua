-- [[ Global options ]]
vim.g.have_nerd_font = true
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.g.clipboard = {
	name = 'xclip',
	copy = {
		['+'] = 'xclip -i -selection clipboard',
		['*'] = 'xclip -i -selection clipboard',
	},
	paste = {
		['+'] = 'xclip -o -selection clipboard',
		['*'] = 'xclip -o -selection clipboard',
	},
	cache_enabled = false,
}

-- files located in standard `lua` folder
require("config.options")
require("config.keymaps")
require("config.lazy")
require("config.lsp")
