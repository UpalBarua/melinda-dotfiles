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

# fzf colors configuration
_gen_fzf_default_opts() {

local color00='#292828'
local color01='#32302f'
local color02='#504945'
local color03='#665c54'
local color04='#bdae93'
local color05='#ddc7a1'
local color06='#ebdbb2'
local color07='#fbf1c7'
local color08='#ea6962'
local color09='#e78a4e'
local color0A='#d8a657'
local color0B='#a9b665'
local color0C='#89b482'
local color0D='#7daea3'
local color0E='#d3869b'
local color0F='#bd6f3e'

export FZF_DEFAULT_OPTS="$FZF_DEFAULT_OPTS"\
" --color=bg+:$color01,bg:$color00,spinner:$color0C,hl:$color0D"\
" --color=fg:$color04,header:$color0D,info:$color0A,pointer:$color0C"\
" --color=marker:$color0C,fg+:$color06,prompt:$color0A,hl+:$color0D"
}

_gen_fzf_default_opts

