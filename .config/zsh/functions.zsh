catroll() {
  local -a patterns=() prune=()
  local first pattern file

  while [[ "$1" == "-I" && -n "$2" ]]; do
    patterns+=("$2")
    shift 2
  done

  if (( ${#patterns[@]} )); then
    prune=('(')
    first=1
    for pattern in "${patterns[@]}"; do
      (( first )) || prune+=(-o)
      prune+=(-path "*/$pattern/*" -o -path "*/$pattern" -o -name "$pattern")
      first=0
    done
    prune+=(')' -prune)
    find . "${prune[@]}" -o -type f -print0
  else
    find . -type f -print0
  fi | while IFS= read -r -d '' file; do
    print -r -- "### $file"
    command cat "$file"
    print
  done
}

copy_xdg_dir() {
  local src="$1"
  local dst="$2"

  if [[ ! -d "$src" ]]; then
    print "Пропуск: $src не существует"
    return 0
  fi

  if [[ -e "$dst" ]]; then
    print -u2 "Остановка: назначение уже существует: $dst"
    return 1
  fi

  mkdir -p "${dst:h}"
  rsync -a "$src/" "$dst/"

  print "Скопировано:"
  print "  $src"
  print "  -> $dst"
}

pubkey() {
  pbcopy < "${1:-$HOME/.ssh/id_ed25519.pub}" || return
  print 'Public key copied to pasteboard.'
}

shrug() {
  print -rn -- '¯\_(ツ)_/¯' | pbcopy || return
  print 'Copied to pasteboard.'
}

envp() {
  env |
    LC_ALL=C sort |
    bat --plain --language=ini --paging=never
}

lenvp() {
  launchctl print "gui/$(id -u)" 2>/dev/null |
    awk '
      /^[[:space:]]*environment = \{$/ {
        inside = 1
        next
      }

      inside && /^[[:space:]]*\}$/ {
        exit
      }

      inside {
        sub(/^[[:space:]]*/, "")
        separator = index($0, " => ")

        if (separator) {
          key = substr($0, 1, separator - 1)
          value = substr($0, separator + 4)
          print key "=" value
        }
      }
    ' |
    LC_ALL=C sort |
    bat --plain --language=ini --paging=never
}

