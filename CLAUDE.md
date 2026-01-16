# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Architecture Overview

This is a Neovim configuration built from scratch using modern Neovim features (0.10+) with a minimal, intentional plugin selection. The configuration is structured modularly using Lua and leverages Neovim's built-in LSP client with native LSP configuration.

### Core Structure

- **init.lua**: Entry point that loads all core modules in order: options, keymaps, autocmds, lsp, and lazy.nvim
- **lua/**: Main configuration directory
  - **options.lua**: Editor settings (line numbers, clipboard, search behavior, splits, etc.)
  - **keymaps.lua**: Global keybindings
  - **autocmds.lua**: Autocommands (yank highlighting, terminal tweaks)
  - **lsp.lua**: LSP setup using `vim.lsp.enable()` with LspAttach autocmd for keybindings
  - **lazyvim.lua**: lazy.nvim plugin manager bootstrap and setup
  - **plugins/**: Plugin specifications (each file returns a lazy.nvim spec)
- **lsp/**: LSP server-specific configurations (gopls.lua, luals.lua) using `vim.lsp.config`
- **after/ftplugin/**: Filetype-specific settings (go.lua, lua.lua, etc.)

### Key Architecture Decisions

**Native LSP Configuration**: Uses Neovim's built-in `vim.lsp.enable()` and `vim.lsp.config` instead of lspconfig plugin. LSP servers are configured in dedicated files under `lsp/` directory, then enabled in `lua/lsp.lua`.

**Plugin Management**: lazy.nvim auto-loads all files in `lua/plugins/` directory. Each plugin file returns a lazy.nvim spec table.

**Two-Part LSP Setup**: Mason downloads/installs LSP server binaries (gopls, lua-language-server), while vim.lsp APIs configure and run them. This avoids the nvim-lspconfig plugin in favor of Neovim's native LSP support.

**Minimal Dependencies**: Intentionally avoids over-engineering. No unnecessary abstractions, helpers, or feature flags. Arrow keys are disabled to enforce hjkl navigation.

## LSP Configuration

### Enabled Language Servers

- **lua_ls**: Lua (configured in lsp/luals.lua)
- **gopls**: Go (configured in lsp/gopls.lua)

### Adding a New LSP Server

1. Create `lsp/<server-name>.lua` with `vim.lsp.config['<server-name>']` table
2. Add `vim.lsp.enable '<server-name>'` to `lua/lsp.lua`
3. Add server to mason's `ensure_installed` list in `lua/plugins/mason.lua`

Example structure for new LSP config:
```lua
vim.lsp.config['server-name'] = {
  cmd = { 'server-executable' },
  filetypes = { 'filetype' },
  root_markers = { 'marker-file', '.git' },
  settings = { ... },
}
```

### LSP Keybindings (set on LspAttach)

- `gd`: Go to definition
- `gD`: Go to declaration
- `gr`: Show references
- `gi`: Go to implementation
- `K`: Hover documentation
- `<leader>rn`: Rename symbol
- `<leader>ca`: Code actions
- `gO`: Document symbols
- `gW`: Workspace symbols

## Code Formatting

Formatting is handled by conform.nvim (lua/plugins/conform.lua):

- **Auto-format on save**: Enabled for most filetypes (disabled for C/C++)
- **Manual format**: `<leader>f` in any mode
- **Formatters by filetype**:
  - Lua: stylua
  - Go: gofmt
  - JavaScript/TypeScript/React: prettier/prettierd
  - HTML/CSS/JSON/YAML/Markdown: prettier

## Filetype-Specific Settings

Filetype settings are in `after/ftplugin/<filetype>.lua`:

- **Go**: Uses tabs (not spaces), shiftwidth=4, tabstop=4
- **Lua**: 2-space indentation
- **TypeScript/JavaScript React**: 2-space indentation
- **YAML**: 2-space indentation

When adding filetype settings, create a new file in `after/ftplugin/` named after the filetype.

## Key Plugin Functionality

### FZF (lua/plugins/fzf.lua)

Fuzzy finding with fzf-lua (no file/git icons):

- `<leader>sf`: Search files
- `<leader>s.`: Search recent files
- `<leader>sh`: Search help
- `<leader>sk`: Search keymaps
- `<leader>sr`: Resume last search
- `<leader>ss`: Document symbols
- `<leader>sw`: Workspace symbols
- `<leader>s/`: Grep in project
- `<leader>/`: Search in current buffer
- `<leader><leader>`: Find buffers

### Oil.nvim (lua/plugins/oil.lua)

File explorer that edits directories like buffers:

- `-`: Open oil file browser

### Autocomplete (lua/plugins/autocomplete.lua)

blink.cmp provides completion with 'enter' preset:

- Sources: LSP, path, snippets, buffer
- No automatic documentation display (show with manual trigger)

### Treesitter (lua/plugins/treesitter.lua)

Syntax highlighting and incremental selection:

- `<leader>w`: Init selection
- `<Enter>`: Expand selection
- `<Backspace>`: Shrink selection

Installed parsers: go, java, lua, vim, vimdoc, query, typescript, javascript, html

## Global Keybindings

**Custom mappings** (see lua/keymaps.lua):

- `<Esc>`: Clear search highlighting
- `<leader>q`: Open diagnostic quickfix
- `<F2>`: Toggle relative line numbers
- `<F3>`: Toggle whitespace display
- `kj` (insert): Exit insert mode
- `<C-d>` (insert): Delete char from right
- `<A-j>/<A-k>`: Move lines up/down (normal and visual)
- Arrow keys: Disabled (enforces hjkl)

**Leader key**: Space

## System Dependencies

Required tools (from README.md):

```bash
sudo apt install make gcc ripgrep unzip git xclip
```

Also ensure external formatters are installed:

- stylua (Lua formatting)
- gofmt (comes with Go)
- prettier or prettierd (JS/TS/web formatting)

## Plugin System

This config uses lazy.nvim which:

- Auto-installs on first launch to `~/.local/share/nvim/lazy/lazy.nvim`
- Loads all plugin specs from `lua/plugins/*.lua`
- Does NOT auto-check for updates (checker.enabled = false)
- Uses rounded borders for UI

To add a new plugin, create a new file in `lua/plugins/` that returns a lazy.nvim spec table.

## Neovim Reset

To completely reset the Neovim environment:

```bash
rm -rf ~/.local/share/nvim
rm -rf ~/.local/state/nvim
rm -rf ~/.cache/nvim
```

Then restart Neovim to trigger fresh installation.
