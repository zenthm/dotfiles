# Set XDG base directories
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.config/zsh/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "$XDG_CACHE_HOME/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
    source "$XDG_CACHE_HOME/p10k-instant-prompt-${(%):-%n}.zsh"
fi

autoload -Uz compinit && compinit

# Aliases
alias ls="eza"
alias ll="eza -alh"
alias tree="eza --tree"
alias cat="bat -p"

# Configure history settings
export HISTFILE="$HOME/.histfile"
export HISTSIZE=1000
export SAVEHIST=1000

# Set path directories
export PATH="$PATH:$HOME/.cargo/bin"
export FPATH="$FPATH:$XDG_CONFIG_HOME/zsh/.zfunc"

# Set zinit installation directory and GitHub repository
export ZINIT_HOME="$XDG_DATA_HOME/zinit/zinit.git"
export ZINIT_REPO="https://github.com/zdharma-continuum/zinit.git"

# Ensure that zinit is installed
if [[ ! -d $ZINIT_HOME ]] then;
    git clone $ZINIT_REPO $ZINIT_HOME
fi

# Load zinit
source "$ZINIT_HOME/zinit.zsh"

# Install and load plugins with zinit
zinit ice depth=1
zinit light romkatv/powerlevel10k

zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-syntax-highlighting

zinit snippet OMZP::archlinux
zinit snippet OMZP::command-not-found
zinit snippet OMZP::git
zinit snippet OMZP::github
zinit snippet OMZP::pip
zinit snippet OMZP::pre-commit
zinit snippet OMZP::python

# Set the language
export LANG=en_PH.UTF-8
export LC_ALL=en_PH.UTF-8

# Set neovim as the default editor
export EDITOR="nvim"

# Initialize zoxide as the cd command
eval "$(zoxide init --cmd cd zsh)"

# To customize prompt, run `p10k configure` or edit ~/.config/zsh/.p10k.zsh.
if [[ -r "$XDG_CONFIG_HOME/zsh/.p10k.zsh" ]] then;
    source "$XDG_CONFIG_HOME/zsh/.p10k.zsh"
fi
