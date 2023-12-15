local fn = vim.fn

-- Automatically install lazy.vim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Install your plugins here
require("lazy").setup({

  "folke/tokyonight.nvim",
  { "nvim-lualine/lualine.nvim", dependencies = "nvim-tree/nvim-web-devicons" },
  { "sindrets/diffview.nvim", dependencies = "nvim-lua/plenary.nvim" },

  -- fzf
  { "junegunn/fzf", build = "./install --bin" },
  { "ibhagwan/fzf-lua", dependencies = "nvim-tree/nvim-web-devicons"},

  -- lsp
  "neovim/nvim-lspconfig",
  "williamboman/mason.nvim",
  "williamboman/mason-lspconfig.nvim",

  -- completion
  "hrsh7th/nvim-cmp",
  "hrsh7th/cmp-nvim-lua",
  "hrsh7th/cmp-nvim-lsp",
  "hrsh7th/cmp-nvim-lsp-document-symbol",
  "hrsh7th/cmp-buffer",
  "hrsh7th/cmp-path",
  "hrsh7th/cmp-cmdline",
  "saadparwaiz1/cmp_luasnip",

  -- snippets
  { "L3MON4D3/LuaSnip", dependencies = "rafamadriz/friendly-snippets" }

})

