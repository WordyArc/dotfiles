if command -v bat >/dev/null; then
  export MANPAGER='bat -l man -p'
  alias cat='bat'
fi
