# nvim
nvim config.

This repo should be cloned to `~/.config/nvim~ .e.g

```
cd ~/config && git clone https://github.com/ayubmalik/nvim
```
~~on a mac run `mkdir -p ~/.config/nvim` first.~~

# Install vim-plug
Note to future self...read this! 😅

The nvim config uses [vim-plug](https://github.com/junegunn/vim-plug) so you will need to install that first.

## Ubuntu
```
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
```

## Mac
```
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
```

