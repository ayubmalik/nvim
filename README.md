# nvim
neovim config for krakenflex

# Install

This repo should be cloned to `~/.config/nvim`:

```
mkdir -p ~/.config
mv ~/.config/nvim ~/.config/_nvim 2>/dev/null
cd ~/.config
git clone git@bitbucket.org:ayubmalik/nvim.git
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

~~~
# Packer

It is safer to install packer manually

```
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer._nvim
```
Once installed, restart nvim and then:

```
:PackerClean | PackerInstall
```
~~~


