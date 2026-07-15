export ZSH="$HOME/.config/.oh-my-zsh"
export ZSH_CACHE_DIR="$XDG_CACHE_HOME/oh-my-zsh"
export ZSH_COMPDUMP="$XDG_CACHE_HOME/zsh/zcompdump-$ZSH_VERSION"

ZSH_THEME=""
HIST_STAMPS="yyyy-mm-dd"
plugins=(git)

source "$ZSH/oh-my-zsh.sh"
