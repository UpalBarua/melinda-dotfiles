setopt rcs
export XDG_DATA_HOME=${XDG_DATA_HOME:="$HOME/.local/share"}
export XDG_CONFIG_HOME=${XDG_CONFIG_HOME:="$HOME/.config"}
export XDG_STATE_HOME=${XDG_STATE_HOME:="$HOME/.local/state"}
export XDG_CACHE_HOME=${XDG_CACHE_HOME:="$HOME/.cache"}
export EDITOR="nvim"
export BROWSER="brave-nightly" 
export TERMINAL="alacritty" 
export EXA_ICON_SPACING="2" 
export TERM='xterm-256color'
export VISUAL='nvim'
export FZF_DEFAULT_OPTS='--color=fg:#f8f8f2,bg:#282a36,hl:#bd93f9 --color=fg+:#f8f8f2,bg+:#44475a,hl+:#bd93f9 --color=info:#ffb86c,prompt:#50fa7b,pointer:#ff79c6 --color=marker:#ff79c6,spinner:#ffb86c,header:#6272a4'
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.local/bin/toggles:$PATH"
export PATH="$HOME/.emacs.d/bin:$PATH"
export PATH="$HOME/.tmuxifier/bin:$PATH"
export PNPM_HOME=${XDG_DATA_HOME:="$HOME/.local/share/pnpm"} 
export PATH="$PNPM_HOME:$PATH"

