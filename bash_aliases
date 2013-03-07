#git aliases
alias gs='git status '
alias ga='git add '
alias gb='git branch '
alias gc='git commit'
alias gd='git diff'
alias go='git checkout '
alias gk='gitk --all&'
alias gx='gitx --all'

alias got='git '
alias get='git '

#History aliases
# -this is a handy command: h <search term>
#	-taken from dev.c-base.org/rc-files/rc-files/blobs/master/bashrc
alias h='history | grep $1'

#ls color and extention
  alias ls='ls --color=auto'
  alias l='ls -CF'
  alias ll='ls -alF'
  alias la='ls -A'

# Cleaning
  alias clr='clear;echo "Currently logged in on $(tty), as $(whoami) in directory $(pwd)."'
  alias trash="sudo rm -rf ~/.local/share/Trash"

  alias rm='rm -vi'
  alias cp='cp -vi'
  alias mv='mv -vi'
# Directory navigation aliases
  alias ..='cd ..'
  alias ...='cd ../..'
  alias ....='cd ../../..'
  alias .....='cd ../../../..'
