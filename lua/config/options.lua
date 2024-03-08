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
opt.cmdheight = 1 -- more space in the neovim command line for displaying messages
opt.conceallevel = 0 -- so that `` is visible in markdown files
opt.confirm = true -- confirm to save changes before exiting modified buffer
opt.cursorline = true -- highlight the current line
opt.errorbells = false -- disable beep
opt.expandtab = true -- convert tabs to spaces
opt.fileencoding = "utf-8" -- the encoding written to a file
opt.foldenable = false -- folds open
opt.hidden = true -- hide buffers instead of unload
opt.history = 64 -- ex command history size
opt.hlsearch = true -- highlight all matches on previous search pattern
opt.ignorecase = false -- ignore case in search patterns
opt.magic = true -- regex special chars magic
opt.mouse = "" -- allow the mouse to be used in neovim
opt.number = true -- set numbered lines
opt.numberwidth = 4 -- set number column width to 2 {default 4}
opt.pumheight = 10 -- pop up menu height
opt.relativenumber = true -- set relative numbered lines
opt.ruler = true -- show line and column number
opt.scrolloff = 0 -- scroll offset
opt.shiftwidth = 2 -- the number of spaces inserted for each indentation
opt.showmode = false -- we don't need to see things like -- INSERT -- anymore
opt.showtabline = 2 -- always show tabs
opt.sidescrolloff = 0 -- side scroll offset
opt.signcolumn = "no" -- always show the sign column, otherwise it would shift the text each time
opt.smartcase = true -- smart case
opt.smartindent = true -- make indenting smarter again
opt.softtabstop = 2 -- softtabstop
opt.splitbelow = true -- force all horizontal splits to go below current window
opt.splitright = true -- force all vertical splits to go to the right of current window
opt.swapfile = false -- creates a swapfile
opt.tabstop = 2 -- insert 2 spaces for a tab
opt.termguicolors = true -- set term gui colors (most terminals support this)
opt.timeoutlen = 1000 -- time to wait for a mapped sequence to complete (in milliseconds)
opt.undofile = true -- enable persistent undo
opt.updatetime = 500 -- faster completion (4000ms default)
opt.visualbell = true -- use visual bells
opt.wrap = false -- display lines as one long line
opt.writebackup = false -- if file is being edited by another program (or was written to file while editing with another program), it's not allowed to be edited
