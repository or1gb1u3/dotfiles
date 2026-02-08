# Minimal Server Dotfiles

Portable dotfiles for quickly setting up new servers and development environments. Works on Linux and macOS with no external dependencies.

## Files

| File | Description |
|------|-------------|
| `bashrc` | Main bash config with prompt, history, completions |
| `bash_aliases` | Git shortcuts, navigation, tmux, safety aliases |
| `bash_functions` | extract, mkcd, ssht, rpass, mach, serve, large |
| `tmux.conf` | C-a prefix, vim keys, clean status bar |
| `vimrc` | Minimal vim config, no plugins |
| `install.sh` | Symlink installer with automatic backup |

## Installation

```bash
git clone https://github.com/or1gb1u3/dotfiles.git ~/dotfiles
cd ~/dotfiles
chmod +x install.sh
./install.sh
source ~/.bashrc
```

## Key Bindings

### Tmux

| Binding | Action |
|---------|--------|
| `C-a \|` | Split vertical |
| `C-a -` | Split horizontal |
| `C-a t` | 25% bottom split |
| `C-a h/j/k/l` | Navigate panes (vim-style) |
| `C-a H/J/K/L` | Resize panes |
| `C-a C-h/C-l` | Previous/next window |
| `C-a Escape` | Enter copy mode |
| `C-a p` | Paste buffer |
| `C-a r` | Reload config |

### Vim

| Binding | Action |
|---------|--------|
| `Ctrl-h/j/k/l` | Navigate splits |
| `\w` | Quick save |
| `Esc` | Clear search highlight |
| `\' \" ( [ {` | Quick pairs (insert mode) |

## Aliases

```bash
# Git
gs, ga, gc, gd, gp, gl, gco, gb

# Navigation
.., ..., ....

# Tmux
tmuxn <name>    # new session
tmuxr <name>    # attach session
tmuxl           # list sessions
tmuxk <name>    # kill session

# Utilities
h <term>        # search history
tasks           # find TODO/FIXME in code
:q / :x         # exit shell (vim-style)
```

## Functions

```bash
extract <file>      # extract any archive
mkcd <dir>          # mkdir and cd
ssht <host>         # ssh with auto tmux
rpass [length]      # random password (default 16)
mach                # system info
serve [port]        # python http server
large [dir]         # find large files
```
