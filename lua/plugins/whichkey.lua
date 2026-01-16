-- [[ start which key ]]
return {
  'folke/which-key.nvim',
  event = 'VeryLazy',
  opts = {
    icons = {
      -- keys = {},
    },
  },

  -- Document existing key chains
  spec = {
    { '<leader>c', group = '[C]ode', mode = { 'n', 'x' } },
    { '<leader>d', group = '[D]ocument' },
    { '<leader>h', group = 'Git [H]unk', mode = { 'n', 'v' } },
    { '<leader>s', group = '[S]earch' },
    { '<leader>w', group = '[W]orkspace' },
  },
}
