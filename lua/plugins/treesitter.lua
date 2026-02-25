-- [[ start tree sitter ]]
return {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  config = function()
    local configs = require 'nvim-treesitter.configs'

    configs.setup {
      -- lua, vim, vimdoc, query are bundled with nvim 0.11
      ensure_installed = {
        'go',
        'typescript',
        'javascript',
        'html',
      },
      auto_install = true,
      sync_install = false,
      highlight = { enable = true },
      indent = { enable = true },

      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = '<leader>w', -- set to `false` to disable one of the mappings
          node_incremental = '<Enter>',
          scope_incremental = false,
          node_decremental = '<Backspace>',
        },
      },
    }
  end,
}
