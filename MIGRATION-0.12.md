# Neovim 0.11.4 → 0.12.3 Migration Plan

## CRITICAL — Startup crash (fix first)

All four `lsp/*.lua` files must **return** their config table instead of
assigning into `vim.lsp.config['name']`. Neovim 0.12 loads these files with
`loadfile()` and expects a table return value.

| File | Status |
|---|---|
| `lsp/gopls.lua` | [x] fixed |
| `lsp/lua_ls.lua` | [x] fixed |
| `lsp/tailwindcss.lua` | [x] fixed |
| `lsp/ts_ls.lua` | [x] fixed |

**Old (0.11):**
```lua
vim.lsp.config['gopls'] = { cmd = { 'gopls' }, ... }
```
**New (0.12):**
```lua
return { cmd = { 'gopls' }, ... }
```

---

## BREAKING — Deprecated, will eventually error

### `lua/autocmds.lua:11` — `vim.highlight` renamed to `vim.hl`
```lua
-- before
vim.highlight.on_yank()
-- after
vim.hl.on_yank()
-- or (new 0.12 API)
vim.hl.hl_op({ higroup = 'IncSearch', on = 'yank' })
```

### `lua/lazyvim.lua:4` — `vim.loop` deprecated since 0.10
```lua
-- before
if not (vim.uv or vim.loop).fs_stat(lazypath) then
-- after
if not vim.uv.fs_stat(lazypath) then
```

### `lua/plugins/mason.lua:17` — `automatic_installation` silently ignored in mason-lspconfig v2
```lua
-- before
automatic_installation = true,
-- after (or false, since vim.lsp.enable() is called manually in lsp.lua)
automatic_enable = true,
```

### `lua/plugins/git.lua:76,85,86` — deprecated gitsigns functions
```lua
-- before
gitsigns.undo_stage_hunk
gitsigns.toggle_current_line_blame
gitsigns.toggle_deleted
-- after
-- undo_stage_hunk: stage an already-staged hunk (behavior changed in v1)
gitsigns.toggle { 'current_line_blame' }
gitsigns.toggle { 'deleted' }
```

---

## ADVISORY — No breakage, worth knowing

- `lua/lazyvim.lua:23-26` — `border = 'rounded'` in lazy UI is redundant;
  `vim.opt.winborder = 'rounded'` in `options.lua` already applies to all
  floats in 0.12.
- `lua/plugins/autocomplete.lua:31` — `fuzzy.implementation = 'lua'` is valid
  now; watch for blink.cmp v2 rename.
- `lua/plugins/treesitter.lua:9` — comment says "bundled in 0.11"; Markdown
  is now also highlighted by default in 0.12.
