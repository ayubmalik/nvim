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

## Neovim custom install

Read [Install Page](https://github.com/neovim/neovim/blob/master/INSTALL.md)

