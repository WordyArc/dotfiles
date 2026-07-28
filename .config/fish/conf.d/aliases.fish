status is-interactive; or return

alias ll 'ls -lh'
alias la 'ls -lah'
alias cat 'bat --paging never --decorations never --plain'
alias df 'df -h'

# Fish function names cannot be "-".
abbr --add -- - 'cd -'
alias cls 'printf "\e[3J\e[H\e[2J"'

alias vim nvim
alias mc 'env SHELL=/bin/bash mc'

alias gadog 'PAGER="less -F -X" git log --all --decorate --oneline --graph'
