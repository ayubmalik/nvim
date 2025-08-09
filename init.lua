-- [[ globals here ]]
vim.g.have_nerd_font = true
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

require('options')
require('keymaps')
require('autocmds')
require('lsp')
require('lazyvim')
