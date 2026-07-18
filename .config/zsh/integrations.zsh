export GPG_TTY="$(tty)"
export MANPAGER='bat -l man -p'

source <(fzf --zsh)
eval "$(atuin init zsh --disable-up-arrow)"
eval "$(zoxide init zsh)"
eval "$(direnv hook zsh)"
