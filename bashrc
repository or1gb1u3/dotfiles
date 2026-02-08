#!/bin/bash
# Minimal server bashrc
# Source this or symlink to ~/.bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# History settings
HISTCONTROL=ignoreboth
HISTSIZE=10000
HISTFILESIZE=20000
shopt -s histappend

# Check window size after each command
shopt -s checkwinsize

# Make less more friendly
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# Enable color support of ls
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
elif [[ "$OSTYPE" == "darwin"* ]]; then
    alias ls='ls -G'
fi

# Source aliases and functions
DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

if [ -f "$DOTFILES_DIR/bash_aliases" ]; then
    source "$DOTFILES_DIR/bash_aliases"
elif [ -f ~/.bash_aliases ]; then
    source ~/.bash_aliases
fi

if [ -f "$DOTFILES_DIR/bash_functions" ]; then
    source "$DOTFILES_DIR/bash_functions"
elif [ -f ~/.bash_functions ]; then
    source ~/.bash_functions
fi

# Enable bash completion
if [ -f /etc/bash_completion ]; then
    source /etc/bash_completion
elif [ -f /usr/share/bash-completion/bash_completion ]; then
    source /usr/share/bash-completion/bash_completion
fi

# Git prompt (if available)
if [ -f /usr/share/git/completion/git-prompt.sh ]; then
    source /usr/share/git/completion/git-prompt.sh
    GIT_PS1_SHOWDIRTYSTATE=1
    GIT_PS1_SHOWUNTRACKEDFILES=1
fi

# Prompt: [user@host:dir]$ with git branch if available
if type __git_ps1 &>/dev/null; then
    PS1='\[\033[1;32m\][\u@\h:\[\033[1;34m\]\w\[\033[1;33m\]$(__git_ps1 " (%s)")\[\033[1;32m\]]\$\[\033[0m\] '
else
    PS1='\[\033[1;32m\][\u@\h:\[\033[1;34m\]\w\[\033[1;32m\]]\$\[\033[0m\] '
fi

# Add ~/bin to PATH if it exists
[ -d "$HOME/bin" ] && PATH="$HOME/bin:$PATH"
[ -d "$HOME/.local/bin" ] && PATH="$HOME/.local/bin:$PATH"
