fish_add_path --global --move --path "$HOME/.local/bin"

fish_add_path --global --move --append --path \
    /Applications/Docker.app/Contents/Resources/bin \
    "$HOME/.lmstudio/bin" \
    "$HOME/Library/Application Support/JetBrains/Toolbox/scripts"
