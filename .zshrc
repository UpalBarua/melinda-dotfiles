# Zinit plugin manager
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"

# zsh plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab
zinit light qoomon/zsh-lazyload

# Load completions
autoload -Uz compinit && compinit
zinit cdreplay -q

# Keybindings
bindkey -e
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward
bindkey '^[w' kill-region

# History
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'

# Shell integrations
eval "$(starship init zsh)"
eval "$(fzf --zsh)"
eval "$(zoxide init --cmd cd zsh)"

# Sources
lazyload nvm -- 'source ~/.nvm/nvm.sh'

# Aliases
# Navigation
alias l="eza -l --icons --group-directories-first --sort=ext --no-user --no-permissions --no-quotes --no-time --no-filesize -T --level=1"
alias ll="eza -la --icons --group-directories-first --sort=ext --no-user --no-permissions --no-quotes --no-time --no-filesize -T --level=1"
alias q="exit"
alias c="clear"
alias k="killall -9"
# Programs
alias x="startx"
alias d="devour"
alias s="devour sxiv"
alias m="devour mpv"
alias z="devour zathura"
alias v="nvim"
alias sv="sudo nvim"
alias vim="nvim"
alias t="tmux"
alias lg="lazygit"
alias vc="vscodium"
alias bt="btop"
alias ht="htop"
alias lf="lfub"
alias nf="fastfetch"
alias pf="pfetch"
alias ytd="yt-dlp"
alias yta="yt-dlp -f 140"
alias ytv1="yt-dlp -f 140+137"
alias ytv2="yt-dlp -f 140+299"
alias tr="transmission-remote"
# pacman
alias unlock="sudo rm /var/lib/pacman/db.lck"
alias clean='sudo pacman -Rns $(pacman -Qtdq)'
alias mirrorup="sudo reflector --verbose --country 'Bangladesh,India,China,Hong Kong' -l 30 --age 12 --protocol https --sort rate --save /etc/pacman.d/mirrorlist"
# confirm before overwriting
alias cp="cp -iv"
alias mv='mv -i'
alias rm='trash-put'
# colorize grep output
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
