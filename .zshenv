setopt rcs
export XDG_DATA_HOME=${XDG_DATA_HOME:="$HOME/.local/share"}
export XDG_CONFIG_HOME=${XDG_CONFIG_HOME:="$HOME/.config"}
export XDG_STATE_HOME=${XDG_STATE_HOME:="$HOME/.local/state"}
export XDG_CACHE_HOME=${XDG_CACHE_HOME:="$HOME/.cache"}
export EDITOR="nvim"
export BROWSER="brave-nightly" 
export TERMINAL="ghostty" 
export EXA_ICON_SPACING="2" 
export TERM='xterm-256color'
export VISUAL='nvim'
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.local/bin/toggles:$PATH"
export PATH="$HOME/.emacs.d/bin:$PATH"
export PATH="$HOME/.tmuxifier/bin:$PATH"
export PNPM_HOME=${XDG_DATA_HOME:="$HOME/.local/share/pnpm"} 
export PATH="$PNPM_HOME:$PATH"

# FZF
	export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS' 
	--color=fg:#c0caf5,bg:-1,hl:#bb9af7
	--color=fg+:#c0caf5,bg+:-1,hl+:#7dcfff
	--color=info:#7aa2f7,prompt:#7dcfff,pointer:#7dcfff 
	--color=marker:#9ece6a,spinner:#9ece6a,header:#9ece6a'

# clipmenud
export CM_DIR=$HOME/.cache/
export CM_MAX_CLIPS=100
export CM_OUTPUT_CLIP=1
export CM_HISTLENGTH=10
