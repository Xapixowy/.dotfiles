# Load: Oh My Zsh
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME=""
plugins=(git zsh-autosuggestions zsh-syntax-highlighting zsh-completions)
source $ZSH/oh-my-zsh.sh

# Load: Starship
eval "$(starship init zsh)"

# Load: Brew
eval "$(/opt/homebrew/bin/brew shellenv)"

# Load: bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
[ -s "/Users/xapixowy/.bun/_bun" ] && source "/Users/xapixowy/.bun/_bun"

# Load: nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# Load: Angular CLI
source <(ng completion script)

# Aliases: General
alias ls='ls -G'
alias ll='ls -lG'
alias neofetch='fastfetch'
alias python='python3'

# Aliases: Git
alias ga='git add'
alias gap='ga --patch'
alias gb='git branch'
alias gba='gb --all'
alias gc='git commit'
alias gca='gc --amend --no-edit'
alias gce='gc --amend'
alias gco='git checkout'
alias gcl='git clone --recursive'
alias gd='git diff --output-indicator-new=" " --output-indicator-old=" "'
alias gds='gd --staged'
alias gi='git init'
alias gl='git log --graph --all --pretty=format:"%C(magenta)%h %C(white) %an  %ar%C(red)  %D%n%s%n"'
alias gm='git merge'
alias gn='git checkout -b'  # new branch
alias gp='git push'
alias gr='git reset'
alias gs='git status --short'
alias gu='git pull'

# Aliases: Tmux
alias tm='tmux'
alias tmas='tmux attach-session'
alias tmks='tmux kill-session'
alias tmkw='tmux kill-window'
alias tmls='tmux list-sessions'
alias tmns='tmux new-session'

# Display random Pokemon
pokemon-colorscripts -r --no-title
