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
export FZF_DEFAULT_OPTS='--color=fg:#f8f8f2,bg:#282a36,hl:#bd93f9 --color=fg+:#f8f8f2,bg+:#44475a,hl+:#bd93f9 --color=info:#ffb86c,prompt:#50fa7b,pointer:#ff79c6 --color=marker:#ff79c6,spinner:#ffb86c,header:#6272a4'
