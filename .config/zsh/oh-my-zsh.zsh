export ZSH="$HOME/.config/.oh-my-zsh"

# ZSH_THEME="robbyrussell"
ZSH_THEME=""

CASE_SENSITIVE="false"
HYPHEN_INSENSITIVE="false"
HIST_STAMPS="yyyy-mm-dd"

plugins=(git)

export ZSH_CACHE_DIR="$XDG_CACHE_HOME/oh-my-zsh"
export ZSH_COMPDUMP="$ZSH_CACHE_DIR/.zcompdump-$ZSH_VERSION"
mkdir -p "$ZSH_CACHE_DIR"

if [[ -r "$ZSH/oh-my-zsh.sh" ]]; then
  source "$ZSH/oh-my-zsh.sh"
fi

