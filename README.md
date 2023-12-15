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

# Plugin Prerequisites

# NPM
Some of the plugins require `node` and `npm`. Use `nvm` to insall.

```
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash

# new window
nvm ls-remote
nvm install 20
```

## Golang

The Go language server (gopls) needs Go.

```
cd ~/Downloads
curl -L https://go.dev/dl/go1.21.5.linux-amd64.tar.gz -o go1.21.5.linux-amd64.tar.gz
sudo rm -rf /usr/local/go && sudo tar -C /usr/local -xzf go1.21.5.linux-amd64.tar.gz
```

# Misc

Miscellaneous commands to set up a new machine/account.

## Oh My Zsh

```
sh -c "$(wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"
```
## Nerd Fonts 

```
mkdir -p ~/.local/share/fonts
pushd ~/.local/share/fonts
curl -L https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.1/DejaVuSansMono.zip -O
unzip DejaVuSansMono.zip
rm DejaVuSansMono.zip
fc-cache -fv
```

## .zshrc

```
# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="agnoster"

CASE_SENSITIVE="true"

HIST_STAMPS="yyyy-mm-dd"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

### Added by me ###
export GO_BIN=/usr/local/go/bin
export LOCAL_BIN=~/.local/bin
export PATH=${PATH}:${GO_BIN}:${LOCAL_BIN}

# aliases
alias b='./gradlew build'
alias cdprojects='cd ~/projects'
alias clip='xclip -selection clipboard'
alias dc='docker compose'
alias d='docker'
alias ga='git add'
alias gc='git commit'
alias gco='git checkout'
alias gcount='git shortlog -sn'
alias gd='git diff'
alias glg='git log --stat'
alias gl='git log'
alias glo='git log --oneline --decorate'
alias glow='glow -p'
alias gp='git push'
alias gs='git status'
alias gup='git pull --rebase'
alias gw='./gradlew'
alias k='kubectl'
alias ll='ls -lrt'
alias m='./mvnw'
alias nv=nvim
alias o='xdg-open'
alias powerdown='sudo cpupower frequency-set -g powersave'
alias powerinfo='sudo cpupower frequency-info'
alias powerup='sudo cpupower frequency-set -g performance'
alias rgf='rg --files | rg'
alias py3='/usr/bin/python3'
alias shred='shred -uz'
alias sound="gnome-control-center sound"
alias vim=nvim

# set vi mode
bindkey -v
bindkey '^R' history-incremental-search-backward

#fzf completion
source /usr/share/doc/fzf/examples/key-bindings.zsh
source /usr/share/doc/fzf/examples/completion.zsh

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/home/${USER}/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# start machine specific
alias cdprojects='cd ~/projects'
# end machine specific
```

