status is-interactive; or return

abbr --add ll 'ls -lh'
abbr --add la 'ls -lah'
abbr --add cat 'bat --paging never --decorations never --plain'
abbr --add df 'df -h'
abbr --add -- - 'cd -'
abbr --add cls 'printf "\e[3J\e[H\e[2J"'

abbr --add vim nvim
abbr --add mc 'SHELL=/bin/bash mc'

abbr --add gadog 'PAGER="less -F -X" git log --all --decorate --oneline --graph'

abbr --add envp 'env | LC_ALL=C sort | bat --plain --language=ini --paging=never'
