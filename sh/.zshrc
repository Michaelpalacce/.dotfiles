# Uncomment below for profiling. Also uncomment last line of the file
# zmodload zsh/zprof

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# ------------------------------ UPDATE ---------------------------------

# Remove Auto update to speedup starting up the terminal
# Uncomment the following line to change how often to auto-update (in days).
zstyle ':omz:update' frequency 13
DISABLE_AUTO_UPDATE="true" 

# ------------------------------ THEME ---------------------------------

ZSH_THEME="bira"

# ------------------------------ Completion ---------------------------------
# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"
COMPLETION_WAITING_DOTS="true"

# ------------------------------ PLUGINS ---------------------------------

zstyle ':omz:plugins:git' lazy yes
zstyle ':omz:plugins:nvm' lazy yes
# you need nvim in there since Copilot uses node...
zstyle ':omz:plugins:nvm' lazy-cmd nvim

export NVM_LAZY_LOAD=true
plugins=(
    git 
    zsh-autosuggestions 
    nvm
)

# ------------------------------ HACKS --------------------------------

autoload -Uz compinit

() {
  if [[ $# -gt 0 ]]; then
    compinit
  else
    compinit -C
  fi
} ${ZDOTDIR:-$HOME}/.zcompdump(N.mh+24)

# ------------------------------ Source modules ---------------------------------

source $ZSH/oh-my-zsh.sh

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

if [ -f ~/.zsh_aliases ]; then
    . ~/.zsh_aliases
fi

if [ -f ~/.zsh_secrets ]; then
    . ~/.zsh_secrets 
fi

# Source all files under ~/.zsh-config
for config_file in ~/.zsh-config/*; do
    . $config_file
done

# ------------------------------ HISTORY ---------------------------------

# Keep 10000 lines of history within the shell and save it to ~/.zsh_history:
HISTCONTROL=ignoreboth
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history
setopt histignorealldups sharehistory
HIST_STAMPS="dd/mm/yyyy"

# ------------------------------ ALIASES ---------------------------------

# Use emacs keybindings even if our EDITOR is set to vi
bindkey -e

# Profiling
# zprof
