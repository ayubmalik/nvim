vim.pack.add {
  -- tokyonight
  {
    src = 'https://github.com/folke/tokyonight.nvim',
    version = 'stable',
  },
}

require('tokyonight').setup {
  on_colors = function(colors)
    colors.bg = '#15151e'
  end,
}

vim.cmd.colorscheme 'tokyonight-night'
vim.cmd.hi 'Comment gui=none'
