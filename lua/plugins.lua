local fn = vim.fn

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Install your plugins here
return packer.startup(function(use)
  use "wbthomason/packer.nvim" -- Have packer manage itself
  use "nvim-tree/nvim-web-devicons"
  use "folke/tokyonight.nvim"
  use {
    "nvim-lualine/lualine.nvim",
    requires = { "nvim-tree/nvim-web-devicons", opt = true }
  }

  use { "ibhagwan/fzf-lua" }
  use { "sindrets/diffview.nvim", requires = "nvim-lua/plenary.nvim" }

  -- lsp
  use "williamboman/mason.nvim"
  use "williamboman/mason-lspconfig.nvim"
  use "neovim/nvim-lspconfig"

  -- completion
  use {
    "hrsh7th/nvim-cmp",
    config = function() require('config.cmp') end,
  }
  use "hrsh7th/cmp-nvim-lsp"
  use "hrsh7th/cmp-nvim-lsp-document-symbol"
  use "hrsh7th/cmp-nvim-lua"
  use "hrsh7th/cmp-buffer"
  use "hrsh7th/cmp-path"
  use "hrsh7th/cmp-cmdline"
  use "saadparwaiz1/cmp_luasnip"
  use "rafamadriz/friendly-snippets"

  -- snippets
  use {
    "L3MON4D3/LuaSnip",
    require = { "rafamadriz/friendly-snippets" }
  }

end)

