# README

## Key Mappings

Leader key: `Space`

| Plugin | Key | Mode | Description |
|--------|-----|------|-------------|
| **FZF** | `<leader>sf` | n | Search files |
| | `<leader>s.` | n | Search recent files |
| | `<leader>sh` | n | Search help tags |
| | `<leader>sk` | n | Search keymaps |
| | `<leader>sr` | n | Resume last search |
| | `<leader>ss` | n | Document symbols |
| | `<leader>sw` | n | Workspace symbols |
| | `<leader>s/` | n | Live grep in project |
| | `<leader>/` | n | Fuzzy search current buffer |
| | `<leader><leader>` | n | Find existing buffers |
| **Oil** | `-` | n | Open file browser |
| **Gitsigns** | `]c` / `[c` | n | Next / prev git change |
| | `<leader>hs` | n/v | Stage hunk |
| | `<leader>hr` | n/v | Reset hunk |
| | `<leader>hS` | n | Stage buffer |
| | `<leader>hu` | n | Undo stage hunk |
| | `<leader>hR` | n | Reset buffer |
| | `<leader>hp` | n | Preview hunk |
| | `<leader>hb` | n | Blame line |
| | `<leader>hd` | n | Diff against index |
| | `<leader>hD` | n | Diff against last commit |
| | `<leader>tb` | n | Toggle inline blame |
| | `<leader>tD` | n | Toggle show deleted |
| **LazyGit** | `<leader>lg` | n | Open LazyGit |
| **DAP** | `<F9>` | n | Start / Continue |
| | `<F7>` | n | Step Into |
| | `<F8>` | n | Step Over |
| | `<S-F8>` | n | Step Out |
| | `<leader>b` | n | Toggle breakpoint |
| | `<leader>B` | n | Set conditional breakpoint |
| | `<leader>du` | n | Toggle DAP UI |
| **Treesitter** | `<leader>w` | n | Init incremental selection |
| | `<Enter>` | n | Expand node selection |
| | `<Backspace>` | n | Shrink node selection |
| **TS Textobjects** | `af` / `if` | o/v | Around / inner function |
| | `ac` / `ic` | o/v | Around / inner class |
| | `ao` | o/v | Around comment |
| | `as` | o/v | Language scope |
| | `<leader>a` | n | Swap with next parameter |
| | `<leader>A` | n | Swap with previous parameter |
| **Conform** | `<leader>f` | n/v | Format buffer |
| **LSP** | `gd` | n | Go to definition |
| | `gD` | n | Go to declaration |
| | `K` | n | Hover documentation |
| | `gW` | n | Workspace symbols |
| | `grr` | n | Show references |
| | `gri` | n | Go to implementation |
| | `grn` | n | Rename symbol |
| | `gra` | n/v | Code actions |
| | `gO` | n | Document symbols |
| | `<C-s>` | i | Signature help |
| **Global** | `<Esc>` | n | Clear search highlight |
| | `<leader>q` | n | Open diagnostic quickfix |
| | `<F2>` | n | Toggle relative numbers |
| | `<F3>` | n | Toggle whitespace |
| | `kj` | i | Exit insert mode |
| | `<C-d>` | i | Delete char to the right |
| | `<A-j>` / `<A-k>` | n/v | Move line(s) down / up |
| | `<` / `>` | v | Indent, stay in visual mode |

---

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

## Neovim custom install

Read [Install Page](https://github.com/neovim/neovim/blob/master/INSTALL.md)

