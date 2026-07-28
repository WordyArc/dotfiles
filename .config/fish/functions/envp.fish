function envp --description 'Print and filter the process environment'
    set -l environment (env)

    if set -q argv[1]
        set -l patterns (string escape --style=regex -- $argv)
        set -l pattern (string join '|' -- $patterns)
        set environment (string match --entire --ignore-case --regex -- $pattern $environment)
    end

    string join \n -- $environment |
        LC_ALL=C sort |
        bat --plain --language=ini --paging=never
end
