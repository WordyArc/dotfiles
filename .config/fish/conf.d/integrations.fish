status is-interactive; or return

if set -l gpg_tty (tty 2>/dev/null)
    set -gx GPG_TTY $gpg_tty
end

if type -q fzf
    fzf --fish | source
end

if type -q atuin
    atuin init fish --disable-up-arrow | source
end

if type -q zoxide
    zoxide init fish | source
end

if type -q direnv
    direnv hook fish | source
end
