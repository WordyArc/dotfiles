# Только интерактивные шеллы
[[ -o interactive ]] || return

# --- XDG (кэши/стейт не в $HOME) ---
export XDG_CACHE_HOME="${XDG_CACHE_HOME:-$HOME/.cache}"
export XDG_STATE_HOME="${XDG_STATE_HOME:-$HOME/.local/state}"
mkdir -p "$XDG_CACHE_HOME" "$XDG_STATE_HOME/zsh"

# --- History ---
HISTFILE="$XDG_STATE_HOME/zsh/history"
HISTSIZE=50000
SAVEHIST=50000
setopt HIST_IGNORE_SPACE
setopt APPEND_HISTORY

# --- Paths / Homebrew ---
typeset -U path PATH fpath FPATH

if [[ -x /opt/homebrew/bin/brew ]]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
elif [[ -x /usr/local/bin/brew ]]; then
  eval "$(/usr/local/bin/brew shellenv)"
fi

path=("$HOME/.local/bin" $path)

# --- Oh My Zsh ---
export ZSH="$HOME/.config/.oh-my-zsh"
ZSH_THEME="robbyrussell"

CASE_SENSITIVE="false"
HYPHEN_INSENSITIVE="false"
HIST_STAMPS="yyyy-mm-dd"

plugins=(git)

# OMZ cache + compdump в XDG cache
export ZSH_CACHE_DIR="$XDG_CACHE_HOME/oh-my-zsh"
export ZSH_COMPDUMP="$ZSH_CACHE_DIR/.zcompdump"
mkdir -p "$ZSH_CACHE_DIR"

if [[ -r "$ZSH/oh-my-zsh.sh" ]]; then
  source "$ZSH/oh-my-zsh.sh"
fi

# --- User configuration (лучше после OMZ, чтобы ты мог переопределять алиасы/настройки) ---
z_source() { [[ -r "$1" ]] && source "$1"; }

for f in \
  "$HOME/.config/shell/exports" \
  "$HOME/.config/shell/aliases" \
  "$HOME/.config/shell/functions" \
  "$HOME/.config/shell/external" \
  "$HOME/.config/shell/completions"
do
  z_source "$f"
done


export PATH=$PATH:/Users/viktor/.local/bin
eval "$(direnv hook zsh)"
# Added by LM Studio CLI (lms)
export PATH="$PATH:/Users/viktor/.lmstudio/bin"
# End of LM Studio CLI section

export VCPKG_ROOT="$HOME/develop/vcpkg"
export PATH="$VCPKG_ROOT:$PATH"
