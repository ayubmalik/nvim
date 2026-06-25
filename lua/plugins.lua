vim.pack.add {
  -- tokyonight
  {
    src = 'https://github.com/folke/tokyonight.nvim',
    version = 'stable',
  },
  -- fzf-lua
  { src = 'https://github.com/ibhagwan/fzf-lua' },
  -- blink.cmp
  { src = 'https://github.com/rafamadriz/friendly-snippets' },
  { src = 'https://github.com/saghen/blink.cmp', version = 'v1' },
  -- mason
  { src = 'https://github.com/williamboman/mason.nvim' },
}

-- tokyonight
require('tokyonight').setup {
  on_colors = function(colors)
    colors.bg = '#15151e'
  end,
}
vim.cmd.colorscheme 'tokyonight-night'
vim.cmd.hi 'Comment gui=none'

-- fzf-lua
local fzf = require 'fzf-lua'
fzf.setup {
  defaults = {
    file_icons = false,
    git_icons = false,
    color_icons = false,
  },
}
vim.keymap.set('n', '<leader>sf', fzf.files, { desc = '[S]earch [F]iles' })
vim.keymap.set('n', '<leader>s.', fzf.oldfiles, { desc = '[S]earch Recent Files' })
vim.keymap.set('n', '<leader>sh', fzf.help_tags, { desc = '[S]earch [H]elp' })
vim.keymap.set('n', '<leader>sk', fzf.keymaps, { desc = '[S]earch [K]eymaps' })
vim.keymap.set('n', '<leader>sr', fzf.resume, { desc = '[S]earch [R]esume' })
vim.keymap.set('n', '<leader>ss', fzf.lsp_document_symbols, { desc = '[S]earch [S]ymbols' })
vim.keymap.set('n', '<leader>sw', fzf.lsp_live_workspace_symbols, { desc = '[S]earch [W]orkspace symbols' })
vim.keymap.set('n', '<leader>s/', fzf.live_grep, { desc = '[S]earch in Project' })
vim.keymap.set('n', '<leader>/', fzf.lgrep_curbuf, { desc = 'Search current buffer' })
vim.keymap.set('n', '<leader><leader>', fzf.buffers, { desc = 'Find buffers' })

-- mason
require('mason').setup()

-- blink.cmp
-- require('blink.cmp').setup {
--   keymap = { preset = 'enter' },
--   appearance = {
--     nerd_font_variant = 'mono',
--   },
--   completion = {
--     documentation = { auto_show = false },
--     list = { max_items = 100 },
--     menu = {
--       min_width = 30,
--       max_height = 15,
--       draw = {
--         columns = {
--           { 'label', 'label_description', gap = 1 },
--           { 'kind_icon', 'kind' },
--         },
--       },
--     },
--   },
--   sources = {
--     default = { 'lsp', 'path', 'snippets', 'buffer' },
--   },
--   fuzzy = { implementation = 'lua' },
-- }
