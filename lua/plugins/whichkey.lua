-- [[ start which key ]]
return {
  'folke/which-key.nvim',
  event = 'VimEnter', -- Sets the loading event to 'VimEnter'
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
    { '<leader>t', group = '[T]est' },
    { '<leader>w', group = '[W]orkspace' },
  },
}
