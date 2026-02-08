# Minimal server aliases
# Portable across Linux/macOS

# Directory navigation
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

# ls variants
alias l='ls -CF'
alias ll='ls -alF'
alias la='ls -A'

# Safety nets
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

# Colorize (works on both Linux and macOS)
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# Git shortcuts
alias gs='git status'
alias ga='git add'
alias gc='git commit'
alias gd='git diff'
alias gp='git push'
alias gl='git log --oneline -20'
alias gco='git checkout'
alias gb='git branch'

# Typo fixes
alias got='git'
alias get='git'

# Vim-style exits
alias :q='exit'
alias :x='exit'

# Tmux shortcuts
alias tmuxn='tmux new -s'
alias tmuxr='tmux attach -t'
alias tmuxl='tmux list-sessions'
alias tmuxk='tmux kill-session -t'

# History search
alias h='history | grep'

# Find TODOs in code
alias tasks='grep -rEI "TODO|FIXME" . --exclude-dir=.git 2>/dev/null'

# Quick clear with context
alias clr='clear; echo "$(whoami)@$(hostname):$(pwd)"'

# Network
alias ports='netstat -tulanp 2>/dev/null || lsof -i -P -n'
alias myip='curl -s ifconfig.me'
