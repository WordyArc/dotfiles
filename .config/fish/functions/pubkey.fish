function pubkey --description 'Copy an SSH public key to the pasteboard'
    set -l key_path "$HOME/.ssh/id_ed25519.pub"

    if set -q argv[1]
        set key_path "$argv[1]"
    end

    pbcopy <"$key_path"; or return
    printf 'Public key copied to pasteboard.\n'
end
