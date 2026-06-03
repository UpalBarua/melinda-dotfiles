# XDG Base Directory Specification
export XDG_DATA_HOME=~/.local/share
export XDG_CONFIG_HOME=~/.config
export XDG_STATE_HOME=~/.local/state
export XDG_CACHE_HOME=~/.cache

# Editor and terminal preferences
export TERM='kitty'
export TERMINAL='kitty' 
export EDITOR='nvim'
export VISUAL='nvim'
export BROWSER='brave' 

# exa/eza configuration
export EZA_ICON_SPACING="2"

# Add local binaries to PATH
[ -d ~/.local/bin ] && export PATH=~/.local/bin:$PATH

# pnpm configuration
export PNPM_HOME="$XDG_DATA_HOME/pnpm"
export PATH="$PNPM_HOME:$PATH"

# ========================
# Java GUI workaround for tiling WMs
# ========================
export _JAVA_AWT_WM_NONREPARENTING=1

# ========================
# FZF colors
# ========================
export FZF_DEFAULT_OPTS="
	--color=fg:#908caa,bg:#191724,hl:#ebbcba
	--color=fg+:#e0def4,bg+:#26233a,hl+:#ebbcba
	--color=border:#403d52,header:#31748f,gutter:#191724
	--color=spinner:#f6c177,info:#9ccfd8
	--color=pointer:#c4a7e7,marker:#eb6f92,prompt:#908caa"
