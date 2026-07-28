function lenvp --description 'Print the launchd environment'
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
        ' |
        LC_ALL=C sort |
        bat --plain --language=ini --paging=never
end
