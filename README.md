# nvim
neovim config for ayubmalik

# Install

This repo should be cloned to `~/.config/nvim`:

```
mkdir -p ~/.config
mv ~/.config/nvim ~/.config/_nvim 2>/dev/null
cd ~/.config
git clone git@github.com:ayubmalik/nvim.git
```

# NPM
Some of the plugins require `node` and `npm`. Use `nvm` to insall.

```
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash

# new window
nvm ls-remote
nvm install 20
```

# LazyVIM
Should install automatically

# Misc

Miscellaneous commands to set up a new machine/account.

# Golang

Install golang

```
cd ~/Downloads
curl -L https://go.dev/dl/go1.21.5.linux-amd64.tar.gz -o go1.21.5.linux-amd64.tar.gz
sudo rm -rf /usr/local/go && sudo tar -C /usr/local -xzf go1.21.5.linux-amd64.tar.gz
```

## ZSH

```
sh -c "$(wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"
```


