# Migration Context

Migrating nvim config from lazy.nvim to vim.pack (Neovim 0.12 built-in package manager).
One change at a time — wait for user confirmation before making the next change.

## Branch: `migrate-12`

## New file: `lua/plugins.lua`
All vim.pack plugins go here — `vim.pack.add {}` block at top, setup calls in same order below.

## init.lua status
- `require 'options'` ✅
- `require 'keymaps'` ✅
- `require 'plugins'` ✅
- `require 'autocmds'` ❌ commented out
- `require 'lsp'` ❌ commented out — needs `vim.lsp.completion.enable()` added to LspAttach before enabling
- `require 'lazyvim'` ❌ commented out — delete once migration complete

## Migrated to vim.pack ✅
- tokyonight (`version = 'stable'`)
- fzf-lua (no version pin)
- blink.cmp (`version = 'v1'`) + friendly-snippets
  - kept `fuzzy = { implementation = 'lua' }` — no build hook in vim.pack
  - dropped `opts_extend` and `enabled = true` (lazy.nvim-specific)

## Still in `lua/plugins/` — NOT yet migrated
- which-key
- conform.nvim
- oil.nvim
- treesitter + treesitter-textobjects
- lualine
- autopairs
- surround
- gitsigns, lazygit, diffview
- mason (mason-lspconfig to be DROPPED)
- debug (was disabled — drop entirely)
- nvim-web-devicons (dependency, review when needed)

## Key decisions
- blink.cmp KEPT — not replacing with native vim.lsp.completion (user wants buffer word source)
- mason-lspconfig to be DROPPED — vim.lsp.config handles LSP config natively
- treesitter incremental selection block to be REMOVED — now native in 0.12 via `v_an`/`v_in`/`v_]n`/`v_[n`
- debug plugin to be DROPPED

## vim.pack version pitfall
`version = 'stable'` only works if repo has a branch/tag named `stable`.
blink.cmp uses `version = 'v1'` (branch). Always check available tags from error if version fails.
