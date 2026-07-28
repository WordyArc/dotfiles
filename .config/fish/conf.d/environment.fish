# -- XDG -------------------------------------------------------
set -q XDG_CONFIG_HOME; or set -gx XDG_CONFIG_HOME "$HOME/.config"
set -q XDG_DATA_HOME; or set -gx XDG_DATA_HOME "$HOME/.local/share"
set -q XDG_STATE_HOME; or set -gx XDG_STATE_HOME "$HOME/.local/state"
set -q XDG_CACHE_HOME; or set -gx XDG_CACHE_HOME "$HOME/.cache"

# -- Editors ---------------------------------------------------
set -q EDITOR; or set -gx EDITOR nvim
set -q VISUAL; or set -gx VISUAL $EDITOR

# -- Homebrew --------------------------------------------------
if test -x /opt/homebrew/bin/brew
    /opt/homebrew/bin/brew shellenv | source
end

set -gx HOMEBREW_NO_ANALYTICS 1

# -- Shell -----------------------------------------------------
set -gx MANPAGER 'bat -l man -p'
set -gx VIRTUAL_ENV_DISABLE_PROMPT 1
set -gx LESSHISTFILE "$XDG_STATE_HOME/less/history"

# -- Development tools -----------------------------------------
set -gx DOCKER_DEFAULT_PLATFORM linux/amd64

if set -q HOMEBREW_PREFIX
    set -gx DOTNET_ROOT "$HOMEBREW_PREFIX/opt/dotnet/libexec"
end

set -gx VCPKG_ROOT "$HOME/develop/vcpkg"

set -gx DOCKER_CONFIG "$XDG_CONFIG_HOME/docker"
set -gx ANDROID_USER_HOME "$XDG_DATA_HOME/android"
set -gx IPYTHONDIR "$XDG_DATA_HOME/ipython"
set -gx KONAN_DATA_DIR "$XDG_CACHE_HOME/konan"

# -- AI CLI tools ----------------------------------------------
set -gx CLAUDE_CONFIG_DIR "$XDG_DATA_HOME/claude"
set -gx CODEX_HOME "$XDG_DATA_HOME/codex"
set -gx COPILOT_HOME "$XDG_DATA_HOME/copilot"

# -- SDKMAN ----------------------------------------------------
set -gx SDKMAN_DIR "$XDG_DATA_HOME/sdkman"

# -- asdf ------------------------------------------------------
set -gx ASDF_DATA_DIR "$XDG_DATA_HOME/asdf"
set -gx ASDF_CONFIG_FILE "$XDG_CONFIG_HOME/asdf/.asdfrc"
