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
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.local/bin/toggles:$PATH"
export PATH="$HOME/.emacs.d/bin:$PATH"
export PATH="$HOME/.tmuxifier/bin:$PATH"
export PNPM_HOME=${XDG_DATA_HOME:="$HOME/.local/share/pnpm"} 
export PATH="$PNPM_HOME:$PATH"
export FZF_DEFAULT_OPTS="$FZF_DEFAULT_OPTS \
  --highlight-line \
  --info=inline-right \
  --ansi \
  --layout=reverse \
  --border=none
  --color=bg+:#2d3f76 \
  --color=bg:#1e2030 \
  --color=border:#589ed7 \
  --color=fg:#c8d3f5 \
  --color=gutter:#1e2030 \
  --color=header:#ff966c \
  --color=hl+:#65bcff \
  --color=hl:#65bcff \
  --color=info:#545c7e \
  --color=marker:#ff007c \
  --color=pointer:#ff007c \
  --color=prompt:#65bcff \
  --color=query:#c8d3f5:regular \
  --color=scrollbar:#589ed7 \
  --color=separator:#ff966c \
  --color=spinner:#ff007c \
"

BEMOJI_PICKER_CMD="/usr/local/bin/dmenu"
