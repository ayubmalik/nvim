# README

## Key Mappings

See [KEY_MAPS.md](KEY_MAPS.md)

## Neovim Reset

Danger! This deletes all neovim config files.


```shell
rm -rf ~/.local/share/nvim
rm -rf ~/.local/state/nvim
rm -rf ~/.cache/nvim
```

## Tools Dependencies

```
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
- blink.cmp (added but setup commented out — using native `vim.lsp.completion`)

### Remaining
- **treesitter** + treesitter-textobjects (drop incremental selection — native in 0.12)
- **autopairs** — choose: `nvim-autopairs` or `mini.pairs`
- **surround** — choose: `nvim-surround` or `mini.surround`
- Delete `lua/lazyvim.lua` and remove `require 'lazyvim'` from `init.lua`
- Drop debug plugin (was disabled — delete entirely)

## Neovim custom install

Read [Install Page](https://github.com/neovim/neovim/blob/master/INSTALL.md)

