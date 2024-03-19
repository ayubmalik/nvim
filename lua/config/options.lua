-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- options
local opt = vim.opt
opt.autoindent = true -- indent next line same as current
opt.autowrite = false -- auto write
opt.autoread = true -- auto read changed files
opt.backup = false -- creates a backup file
opt.clipboard = "unnamedplus" -- allows neovim to access the system clipboard
opt.cmdheight = 2 -- more space in the neovim command line for displaying messages
opt.conceallevel = 0 -- so that `` is visible in markdown files
opt.errorbells = false -- disable beep
opt.fileencoding = "utf-8" -- the encoding written to a file
opt.foldenable = false -- folds open
opt.hidden = true -- hide buffers instead of unload
opt.history = 64 -- ex command history size
opt.hlsearch = true -- highlight all matches on previous search pattern
opt.ignorecase = false -- ignore case in search patterns
opt.magic = true -- regex special chars magic
opt.mouse = "" -- allow the mouse to be used in neovim
opt.numberwidth = 4 -- set number column width to 2 {default 4}
opt.ruler = true -- show line and column number
opt.showtabline = 2 -- always show tabs
opt.softtabstop = 2 -- softtabstop
opt.swapfile = false -- creates a swapfile
opt.timeoutlen = 1000 -- time to wait for a mapped sequence to complete (in milliseconds)
opt.updatetime = 500 -- faster completion (4000ms default)
opt.visualbell = true -- use visual bells
opt.writebackup = false -- if file is being edited by another program (or was written to file while editing with another program), it's not allowed to be edited
