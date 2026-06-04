# ========================
# Zinit plugin manager setup
# ========================
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
source "${ZINIT_HOME}/zinit.zsh"

# ========================
# Zsh plugins (loaded with Zinit)
# ========================
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-autosuggestions

zinit ice wait'0' lucid 
zinit light zsh-users/zsh-completions

zinit ice wait'0' lucid
zinit light Aloxaf/fzf-tab

# ========================
# Completion system
# ========================
autoload -Uz compinit
compinit -C
zinit cdreplay -q

# ========================
# Keybindings
# ========================
KEYTIMEOUT=10
bindkey -e
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward
bindkey '^[w' kill-region

# ========================
# History settings
# ========================
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE

setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups
setopt auto_cd
setopt interactive_comments
setopt glob_dots

# ========================
# Completion styling
# ========================
zstyle ':completion:*' completer _expand _complete _ignored _correct _approximate
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path "$HOME/.cache/zsh/zcompcache"
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no

# ========================
# fzf-tab
# ========================
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:*' use-fzf-default-opts yes

# ========================
# Shell integrations 
# ========================
eval "$(starship init zsh)"
eval "$(fzf --zsh)"
eval "$(zoxide init --cmd cd zsh)"

# ========================
# Aliases
# ========================
# General
alias l="eza -l --icons --group-directories-first --sort=ext --no-user --no-permissions --no-quotes"
alias ll="eza -la --icons --group-directories-first --sort=ext --no-user --no-permissions --no-quotes"
alias q="exit"
alias c="clear"
alias k="pkill -9"

# Programs
alias v="nvim"
alias sv="sudo nvim"
alias vim="nvim"
alias lg="lazygit"
alias bt="btop"
alias ht="htop"
alias nf="fastfetch"

# Pacman - Archlinux
alias unlock="sudo rm /var/lib/pacman/db.lck"
alias clean='sudo pacman -Rns $(pacman -Qtdq)'
alias mirrorup="sudo reflector --verbose --country 'Bangladesh,India,China,Hong Kong,Vietnam,Thailand,Taiwan,Singapore' -l 25 --age 12 --protocol https --sort rate --save /etc/pacman.d/mirrorlist"

# Confirm before overwriting
alias cp="cp -iv"
alias mv='mv -i'

# Colorize grep output
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

# ========================
# Sesh session manager 
# ========================
function sesh-sessions() {
  {
    exec </dev/tty
    exec <&1
    local session
    session=$(sesh list -t -c | fzf --height 40% --reverse --border-label ' sesh ' --border --prompt '⚡  ')
    zle reset-prompt > /dev/null 2>&1 || true
    [[ -z "$session" ]] && return
    sesh connect $session
  }
}

zle     -N             sesh-sessions
bindkey -M emacs '\es' sesh-sessions
bindkey -M vicmd '\es' sesh-sessions
bindkey -M viins '\es' sesh-sessions
