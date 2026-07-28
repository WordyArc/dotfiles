function lenvp --description 'Print the launchd environment'
    set -l environment (
        launchctl print "gui/"(id -u) 2>/dev/null |
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
        '
    )

    if set -q argv[1]
        set -l patterns (string escape --style=regex -- $argv)
        set -l pattern (string join '|' -- $patterns)
        set environment (string match --entire --ignore-case --regex -- $pattern $environment)
    end

    string join \n -- $environment |
        LC_ALL=C sort |
        bat --plain --language=ini --paging=never
end
