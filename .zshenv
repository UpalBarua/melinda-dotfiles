# Enable reading of .zshrc (zsh only)
setopt rcs

# XDG Base Directory Specification
export XDG_DATA_HOME=~/.local/share
export XDG_CONFIG_HOME=~/.config
export XDG_STATE_HOME=~/.local/state
export XDG_CACHE_HOME=~/.cache

# Editor and terminal preferences
export TERM='alacritty'
export TERMINAL="alacritty" 
export EDITOR="nvim"
export VISUAL='nvim'
export BROWSER="brave" 

# exa/eza configuration
export EXA_ICON_SPACING="2"

# Add local binaries to PATH
[ -d ~/.local/bin ] && export PATH=~/.local/bin:$PATH

# pnpm configuration
export PNPM_HOME="$XDG_DATA_HOME/pnpm"
export PATH="$PNPM_HOME:$PATH"

# clipmenud configuration
export CM_DIR=$HOME/.cache/
export CM_MAX_CLIPS=100
export CM_OUTPUT_CLIP=1
export CM_HISTLENGTH=20

# For running java swing guis
export _JAVA_AWT_WM_NONREPARENTING=1

# fzf colors configuration
export FZF_DEFAULT_OPTS=" \
--color=bg+:#313244,bg:#1E1E2E,spinner:#F5E0DC,hl:#F38BA8 \
--color=fg:#CDD6F4,header:#F38BA8,info:#CBA6F7,pointer:#F5E0DC \
--color=marker:#B4BEFE,fg+:#CDD6F4,prompt:#CBA6F7,hl+:#F38BA8 \
--color=selected-bg:#45475A \
--color=border:#6C7086,label:#CDD6F4"
