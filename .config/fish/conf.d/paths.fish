set -l preferred_paths "$HOME/.local/bin"

if set -q JAVA_HOME
    set -a preferred_paths "$JAVA_HOME/bin"
end

set -a preferred_paths \
    "$ASDF_DATA_DIR/shims" \
    "$HOMEBREW_PREFIX/opt/openjdk/bin" \
    "$HOME/develop/flutter/bin" \
    "$VCPKG_ROOT" \
    "$HOME/.cargo/bin"

fish_add_path --global --move --path $preferred_paths

fish_add_path --global --move --append --path \
    "$HOME/.pub-cache/bin" \
    /Applications/Docker.app/Contents/Resources/bin \
    "$HOME/.lmstudio/bin" \
    "$HOME/Library/Application Support/JetBrains/Toolbox/scripts"
