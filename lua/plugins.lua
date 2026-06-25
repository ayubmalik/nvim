vim.pack.add {
  -- tokyonight
  { src = 'https://github.com/folke/tokyonight.nvim', version = 'stable' },
  -- fzf-lua
  { src = 'https://github.com/ibhagwan/fzf-lua' },
  -- mason
  { src = 'https://github.com/williamboman/mason.nvim' },
  -- conform
  { src = 'https://github.com/stevearc/conform.nvim' },
  -- lualine
  { src = 'https://github.com/nvim-tree/nvim-web-devicons' },
  { src = 'https://github.com/nvim-lualine/lualine.nvim' },
  -- which-key
  { src = 'https://github.com/folke/which-key.nvim' },
  -- gitsigns
  { src = 'https://github.com/lewis6991/gitsigns.nvim' },
  -- treesitter
  { src = 'https://github.com/nvim-treesitter/nvim-treesitter' },
  { src = 'https://github.com/nvim-treesitter/nvim-treesitter-textobjects' },
  -- autopairs
  { src = 'https://github.com/windwp/nvim-autopairs' },
  -- disabled plugins (uncomment src to install)
  { src = 'https://github.com/sindrets/diffview.nvim' },
  { src = 'https://github.com/nvim-lua/plenary.nvim' },
  { src = 'https://github.com/kdheepak/lazygit.nvim' },
  { src = 'https://github.com/stevearc/oil.nvim' },
  { src = 'https://github.com/kylechui/nvim-surround', version = '^4.0.0' },
  { src = 'https://github.com/rafamadriz/friendly-snippets' },
  { src = 'https://github.com/saghen/blink.cmp', version = 'v1' },
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
vim.keymap.set('n', '<leader>sf', fzf.files,                    { desc = '[S]earch [F]iles' })
vim.keymap.set('n', '<leader>s.', fzf.oldfiles,                 { desc = '[S]earch Recent Files' })
vim.keymap.set('n', '<leader>sh', fzf.help_tags,                { desc = '[S]earch [H]elp' })
vim.keymap.set('n', '<leader>sk', fzf.keymaps,                  { desc = '[S]earch [K]eymaps' })
vim.keymap.set('n', '<leader>sr', fzf.resume,                   { desc = '[S]earch [R]esume' })
vim.keymap.set('n', '<leader>ss', fzf.lsp_document_symbols,     { desc = '[S]earch [S]ymbols' })
vim.keymap.set('n', '<leader>sw', fzf.lsp_live_workspace_symbols, { desc = '[S]earch [W]orkspace symbols' })
vim.keymap.set('n', '<leader>s/', fzf.live_grep,                { desc = '[S]earch in Project' })
vim.keymap.set('n', '<leader>/',  fzf.lgrep_curbuf,             { desc = 'Search current buffer' })
vim.keymap.set('n', '<leader><leader>', fzf.buffers,            { desc = 'Find buffers' })

-- mason
require('mason').setup()

-- which-key
require('which-key').setup {
  spec = {
    { '<leader>c', group = '[C]ode',      mode = { 'n', 'x' } },
    { '<leader>d', group = '[D]ocument' },
    { '<leader>h', group = 'Git [H]unk',  mode = { 'n', 'v' } },
    { '<leader>s', group = '[S]earch' },
    { '<leader>w', group = '[W]orkspace' },
  },
}

-- gitsigns
require('gitsigns').setup {
  signs = {
    add          = { text = '+' },
    change       = { text = '~' },
    delete       = { text = '_' },
    topdelete    = { text = '‾' },
    changedelete = { text = '~' },
  },
  signs_staged = {
    add          = { text = '+' },
    change       = { text = '~' },
    delete       = { text = '_' },
    topdelete    = { text = '‾' },
    changedelete = { text = '~' },
  },
  on_attach = function(bufnr)
    local gs = require 'gitsigns'
    local function map(mode, l, r, opts)
      opts = opts or {}
      opts.buffer = bufnr
      vim.keymap.set(mode, l, r, opts)
    end

    map('n', ']c', function()
      if vim.wo.diff then vim.cmd.normal { ']c', bang = true }
      else gs.nav_hunk 'next' end
    end, { desc = 'Jump to next git [c]hange' })
    map('n', '[c', function()
      if vim.wo.diff then vim.cmd.normal { '[c', bang = true }
      else gs.nav_hunk 'prev' end
    end, { desc = 'Jump to previous git [c]hange' })

    map('v', '<leader>hs', function() gs.stage_hunk { vim.fn.line '.', vim.fn.line 'v' } end, { desc = 'git [s]tage hunk' })
    map('v', '<leader>hr', function() gs.reset_hunk { vim.fn.line '.', vim.fn.line 'v' } end, { desc = 'git [r]eset hunk' })
    map('n', '<leader>hs', gs.stage_hunk,             { desc = 'git [s]tage hunk' })
    map('n', '<leader>hr', gs.reset_hunk,             { desc = 'git [r]eset hunk' })
    map('n', '<leader>hS', gs.stage_buffer,           { desc = 'git [S]tage buffer' })
    map('n', '<leader>hR', gs.reset_buffer,           { desc = 'git [R]eset buffer' })
    map('n', '<leader>hp', gs.preview_hunk,           { desc = 'git [p]review hunk' })
    map('n', '<leader>hi', gs.preview_hunk_inline,    { desc = 'git [i]nline preview hunk' })
    map('n', '<leader>hb', gs.blame_line,             { desc = 'git [b]lame line' })
    map('n', '<leader>hd', gs.diffthis,               { desc = 'git [d]iff against index' })
    map('n', '<leader>hD', function() gs.diffthis '@' end, { desc = 'git [D]iff against last commit' })
    map('n', '<leader>tb', gs.toggle_current_line_blame, { desc = '[T]oggle git [b]lame line' })
  end,
}

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
    lua        = { 'stylua' },
    go         = { 'gofmt' },
    javascript = { 'prettier' },
    typescript = { 'prettier' },
    typescriptreact = { 'prettier' },
    css        = { 'prettier' },
    html       = { 'prettier' },
    json       = { 'prettier' },
    yaml       = { 'prettier' },
    markdown   = { 'prettier' },
  },
}
-- manual format without save: uncomment if needed
-- vim.keymap.set('', '<leader>f', function()
--   require('conform').format { async = true, lsp_format = 'fallback' }
-- end, { desc = '[F]ormat buffer' })

-- treesitter
-- Parsers bundled in 0.12: lua, vim, vimdoc, query
-- Run :TSInstall go typescript javascript tsx css html after first launch
require('nvim-treesitter').setup()

require('nvim-treesitter-textobjects').setup {
  select = {
    enable = true,
    lookahead = true,
    keymaps = {
      ['af'] = '@function.outer',
      ['if'] = '@function.inner',
      ['ac'] = '@class.outer',
      ['ic'] = { query = '@class.inner', desc = 'Select inner part of a class region' },
      ['ao'] = '@comment.outer',
      ['as'] = { query = '@local.scope', query_group = 'locals', desc = 'Select language scope' },
    },
    selection_modes = {
      ['@parameter.outer'] = 'v',
      ['@function.outer']  = 'V',
      ['@class.outer']     = '<c-v>',
    },
    include_surrounding_whitespace = true,
  },
  swap = {
    enable = true,
    swap_next     = { ['<leader>a'] = { query = '@parameter.inner', desc = 'Swap with next parameter' } },
    swap_previous = { ['<leader>A'] = '@parameter.inner' },
  },
}

-- autopairs
require('nvim-autopairs').setup()

-- =============================================================================
-- Disabled plugins — uncomment to enable
-- =============================================================================

-- diffview
-- require('diffview').setup()

-- lazygit
-- require('lazygit')
-- vim.keymap.set('n', '<leader>lg', '<cmd>LazyGit<cr>', { desc = 'Open lazy git' })

-- oil
-- require('oil').setup()
-- vim.keymap.set('n', '-', '<cmd>Oil<cr>', { desc = 'Open oil file browser' })

-- surround (v4: default keymaps ys/ds/cs, no keymaps in setup)
-- require('nvim-surround').setup()

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
