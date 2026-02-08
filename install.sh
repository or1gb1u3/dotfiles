#!/bin/bash
# Simple dotfiles installer
# Creates symlinks from ~ to this directory

set -e

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Files to symlink
FILES=(
    "bashrc:.bashrc"
    "bash_aliases:.bash_aliases"
    "bash_functions:.bash_functions"
    "tmux.conf:.tmux.conf"
    "vimrc:.vimrc"
)

backup_dir="$HOME/.dotfiles_backup/$(date +%Y%m%d_%H%M%S)"

echo "Dotfiles installer"
echo "=================="
echo "Source: $DOTFILES_DIR"
echo ""

for item in "${FILES[@]}"; do
    src="${item%%:*}"
    dest="${item##*:}"
    src_path="$DOTFILES_DIR/$src"
    dest_path="$HOME/$dest"

    if [ ! -f "$src_path" ]; then
        echo "SKIP: $src (not found)"
        continue
    fi

    # Backup existing file if it's not already a symlink to us
    if [ -e "$dest_path" ] && [ ! -L "$dest_path" ]; then
        mkdir -p "$backup_dir"
        mv "$dest_path" "$backup_dir/$dest"
        echo "BACKUP: $dest -> $backup_dir/$dest"
    elif [ -L "$dest_path" ]; then
        rm "$dest_path"
    fi

    ln -s "$src_path" "$dest_path"
    echo "LINK: $dest -> $src_path"
done

echo ""
echo "Done! Backup location: $backup_dir"
echo ""
echo "To apply changes:"
echo "  source ~/.bashrc"
echo "  tmux source ~/.tmux.conf  (if in tmux)"
