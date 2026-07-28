function catroll --description 'Print files recursively with their paths'
    set -l patterns

    while test (count $argv) -ge 2; and test "$argv[1]" = -I
        set -a patterns "$argv[2]"
        set -e argv[1..2]
    end

    set -l find_args .

    if set -q patterns[1]
        set -a find_args \(
        set -l first 1

        for pattern in $patterns
            if test $first -eq 0
                set -a find_args -o
            end

            set -a find_args \
                -path "*/$pattern/*" \
                -o -path "*/$pattern" \
                -o -name "$pattern"
            set first 0
        end

        set -a find_args \) -prune -o
    end

    set -a find_args -type f -print0

    command find $find_args | while read --null file
        printf '### %s\n' "$file"
        command cat "$file"
        printf '\n'
    end
end
