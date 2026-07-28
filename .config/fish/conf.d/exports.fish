# -- Shell -----------------------------------------------------
set -gx LESSHISTFILE "$XDG_STATE_HOME/less/history"

# -- Docker ----------------------------------------------------
set -gx DOCKER_CONFIG "$XDG_CONFIG_HOME/docker"

# -- Android and Kotlin ----------------------------------------
set -gx ANDROID_USER_HOME "$XDG_DATA_HOME/android"
set -gx KONAN_DATA_DIR "$XDG_CACHE_HOME/konan"

# -- IPython ---------------------------------------------------
set -gx IPYTHONDIR "$XDG_DATA_HOME/ipython"

# -- AI CLI tools ----------------------------------------------
set -gx CLAUDE_CONFIG_DIR "$XDG_DATA_HOME/claude"
set -gx CODEX_HOME "$XDG_DATA_HOME/codex"
set -gx COPILOT_HOME "$XDG_DATA_HOME/copilot"

# -- SDKMAN ----------------------------------------------------
set -gx SDKMAN_DIR "$XDG_DATA_HOME/sdkman"

# -- asdf ------------------------------------------------------
set -gx ASDF_DATA_DIR "$XDG_DATA_HOME/asdf"
set -gx ASDF_CONFIG_FILE "$XDG_CONFIG_HOME/asdf/.asdfrc"
