# Minimal server functions
# Portable across Linux/macOS

# Extract any archive
extract() {
    if [ -f "$1" ]; then
        case "$1" in
            *.tar.bz2)   tar xjf "$1"   ;;
            *.tar.gz)    tar xzf "$1"   ;;
            *.bz2)       bunzip2 "$1"   ;;
            *.rar)       unrar x "$1"   ;;
            *.gz)        gunzip "$1"    ;;
            *.tar)       tar xf "$1"    ;;
            *.tbz2)      tar xjf "$1"   ;;
            *.tgz)       tar xzf "$1"   ;;
            *.zip)       unzip "$1"     ;;
            *.Z)         uncompress "$1";;
            *.7z)        7z x "$1"      ;;
            *)           echo "'$1' cannot be extracted" ;;
        esac
    else
        echo "'$1' is not a valid file"
    fi
}

# Create directory and cd into it
mkcd() {
    mkdir -p "$1" && cd "$1"
}

# SSH with auto tmux attach
ssht() {
    ssh "$@" -t 'tmux attach || tmux new || /bin/bash'
}

# Random password generator
rpass() {
    LC_ALL=C tr -dc 'A-Za-z0-9!@#$%^&*' < /dev/urandom | head -c "${1:-16}"
    echo
}

# Quick system info (works on Linux and macOS)
mach() {
    echo "=== System ==="
    uname -a
    echo ""
    echo "=== Uptime ==="
    uptime
    echo ""
    echo "=== Memory ==="
    if command -v free &>/dev/null; then
        free -h
    else
        top -l 1 -s 0 | grep PhysMem
    fi
    echo ""
    echo "=== Disk ==="
    df -h / 2>/dev/null | tail -1
}

# Show terminal colors
term_colors() {
    for i in {0..255}; do
        printf "\x1b[38;5;${i}mcolor%-5s" "$i"
        if (( i % 8 == 7 )); then
            printf "\n"
        fi
    done
    printf "\x1b[0m\n"
}

# Quick HTTP server
serve() {
    local port="${1:-8000}"
    if command -v python3 &>/dev/null; then
        python3 -m http.server "$port"
    elif command -v python &>/dev/null; then
        python -m SimpleHTTPServer "$port"
    else
        echo "Python not found"
    fi
}

# Find large files
large() {
    find "${1:-.}" -type f -exec du -h {} + 2>/dev/null | sort -rh | head -20
}
