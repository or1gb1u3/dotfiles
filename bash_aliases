# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color'
    alias fgrep='fgrep --color'
    alias egrep='egrep --color'
fi

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

#Grep Colors
alias grep='grep -n --color=auto'

#History aliases
# -this is a handy command: h <search term>
#	-taken from dev.c-base.org/rc-files/rc-files/blobs/master/bashrc
alias h='history | grep $1'

#ls color and extention
#  alias ls='ls --color=auto'
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
  alias cd..='cd ..'
  alias ..='cd ..'
  alias ...='cd ../..'
  alias ....='cd ../../..'
  alias .....='cd ../../../..'
  
# standard commands
  alias ping='ping -c 3 '
  alias cat='cat -n '
  alias less='less -r'
  
## Add some shell exits
  alias :q=' exit'
  alias :Q=' exit'
  alias :x=' exit'

# Pacman alias
  #found and mopdified from arch wiki bash and pacman wiki pages
  alias pacupg='sudo pacman -Syu'        # '[u]pdate' # Synchronize with repositories and then upgrade packages that are out of date on the local system.
  alias pacin='sudo pacman -S'           # '[in]stall' # Install specific package(s) from the repositories
  alias pacins='sudo pacman -U'          # Install specific package not from the repositories but from a file 
  alias pacre='sudo pacman -R'           # '[r]emove' # Remove the specified package(s), retaining its configuration(s) and required dependencies
  alias pacrem='sudo pacman -Rns'        # '[r]emove [m]ore' # Remove the specified package(s), its configuration(s) and unneeded dependencies
  alias pacrep='pacman -Si'              # '[i]nfo' # Display information about a given package in the repositories
  alias pacreps='pacman -Ss'             # '[s]earch' # Search for package(s) in the repositories
  alias pacloc='pacman -Qi'              # Display information about a given package in the local database
  alias paclocs='pacman -Qs'             # Search for package(s) in the local database
  alias paclo='pacman -Qdt'				 # '[l]ist [o]rphans' # list all packages which are orphaned
  alias paclf='pacman -Ql'				 # '[l]ist [f]iles' # list all files installed by a given package
  alias pacexpl='pacman -D --asexp'		 # 'mark as [expl]icit' # mark one or more packages as explicitly installed 
  alias pacimpl='pacman -D --asdep'		 # 'mark as [impl]icit' # mark one or more packages as non explicitly installed

# Additional pacman alias
  alias pacupd='sudo pacman -Sy && sudo abs'     # Update and refresh the local package and ABS databases against repositories
  alias pacinsd='sudo pacman -S --asdeps'        # Install given package(s) as dependencies of another package
  alias pacmir='sudo pacman -Syy'                # Force refresh of all package lists after updating /etc/pacman.d/mirrorlist
  # '[r]emove [o]rphans' - recursively remove ALL orphaned packages
  alias pacro="pacman -Qtdq > /dev/null && sudo pacman -Rs \$(pacman -Qtdq | sed -e ':a;N;$!ba;s/\n/ /g')"

#tmux shortcuts
  alias tmuxn='tmux new -s '
  alias tmuxr='tmux a -t '
  alias tmuxl='tmux ls'
  alias tmuxk='tmux kill-session -t '
  alias ltmux="if tmux has-session -t $USER; then tmux attach -t $USER;  else tmux new -s $USER; fi"

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e'\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# a task finder to look up todo fixme
alias tasks='grep --exclude-dir=.git -rEI "TODO|FIXME" . 2>/dev/null'
