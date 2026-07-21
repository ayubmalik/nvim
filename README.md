# Neovim Config

## Key Mappings

See [KEY_MAPS.md](KEY_MAPS.md)

## Plugin Tutorials

See [PLUGINS.md](PLUGINS.md) — nvim-autopairs, nvim-surround, treesitter-textobjects

## System Dependencies

```shell
sudo apt install make gcc ripgrep unzip git xclip
```

## LSP Servers

### gopls (Go)

```shell
go install golang.org/x/tools/gopls@latest
```

### lua-language-server (Lua)

```shell
sudo apt install lua-language-server
```

Or download the latest release from https://github.com/LuaLS/lua-language-server/releases and add to PATH.

## Migration: lazy.nvim → vim.pack (branch `migrate-12`)

### Done
- tokyonight, fzf-lua, mason, conform, lualine, which-key, gitsigns
- diffview, lazygit, oil (added but not enabled)
- autocmds, LSP (lua_ls, gopls, ts_ls, tailwindcss)
- treesitter + treesitter-textobjects (new API — no nvim-treesitter.configs)
- autopairs (nvim-autopairs)
- surround (nvim-surround v4, disabled — uncomment in plugins.lua to enable)
- blink.cmp (added but disabled — using native `vim.lsp.completion`)

## Neovim Reset

Deletes all Neovim data, state and cache. Run before a clean reinstall.

```shell
rm -rf ~/.local/share/nvim
rm -rf ~/.local/state/nvim
rm -rf ~/.cache/nvim
```

## Neovim Install

Read [Install Page](https://github.com/neovim/neovim/blob/master/INSTALL.md)
