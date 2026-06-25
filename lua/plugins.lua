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
  -- conform
  { src = 'https://github.com/stevearc/conform.nvim' },
  -- lualine
  { src = 'https://github.com/nvim-tree/nvim-web-devicons' },
  { src = 'https://github.com/nvim-lualine/lualine.nvim' },
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

-- lualine
require('lualine').setup {
  options = {
    globalstatus = true,
  },
  sections = {
    lualine_a = { 'mode' },
    lualine_b = { 'branch', 'diff' },
    lualine_c = { 'filename' },
    lualine_x = { 'encoding', 'fileformat', 'filetype' },
    lualine_y = { 'progress' },
    lualine_z = { 'location' },
  },
}

-- conform
require('conform').setup {
  notify_on_error = false,
  format_on_save = function(bufnr)
    local disable_filetypes = { c = true, cpp = true }
    return {
      timeout_ms = 2000,
      lsp_format = disable_filetypes[vim.bo[bufnr].filetype] and 'never' or 'fallback',
    }
  end,
  formatters_by_ft = {
    lua = { 'stylua' },
    go = { 'gofmt' },
    javascript = { 'prettier' },
    typescript = { 'prettier' },
    typescriptreact = { 'prettier' },
    css = { 'prettier' },
    html = { 'prettier' },
    json = { 'prettier' },
    yaml = { 'prettier' },
    markdown = { 'prettier' },
  },
}
-- manual format without save: uncomment if needed
-- vim.keymap.set('', '<leader>f', function()
--   require('conform').format { async = true, lsp_format = 'fallback' }
-- end, { desc = '[F]ormat buffer' })

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
