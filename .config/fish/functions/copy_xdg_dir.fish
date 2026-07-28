function copy_xdg_dir --description 'Copy an XDG directory without overwriting' --argument-names src dst
    if not test -d "$src"
        printf 'Пропуск: %s не существует\n' "$src"
        return 0
    end

    if test -e "$dst"
        printf 'Остановка: назначение уже существует: %s\n' "$dst" >&2
        return 1
    end

    mkdir -p (path dirname "$dst"); or return
    rsync -a "$src/" "$dst/"; or return

    printf 'Скопировано:\n'
    printf '  %s\n' "$src"
    printf '  -> %s\n' "$dst"
end
