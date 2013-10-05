#!/bin/sh
# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files

# If not running interactively, don't do anything
[ -z "$PS1" ] && return


###History Lines###
# don't duplicate lines or lines starting with space in the history.
# See bash(1) for more options
export HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
export HISTSIZE=1000
export HISTFILESIZE=5000

# Exporting the path to path
export PATH="/opt/Komodo-Edit-8/bin:$PATH"

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# Add in the extra files if we have them
# Alias definitions.
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

#functions
if [ -f ~/.bash_functions ]; then
	. ~/.bash_functions
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

#file where all extra aterm setup is located
if [ -f ~/dotfiles/bash_aterm ]; then
    . ~/dotfiles/bash_aterm
fi

if [ -f ~/dotfiles/bash_git_functions ]; then
    . ~/dotfiles/bash_git_functions
fi

#setup the prompt now
if [ -f ~/dotfiles/bash_prompt ]; then
    . ~/dotfiles/bash_prompt
else    
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\][\u@\h]\[\033[00m\]{\[\033[01;34m\]\w\[\033[00m\]}\$ '
fi

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    #PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    TERM=rxvt-unicode
    ;;
*)
    ;;
esac

