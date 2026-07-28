set -g fisher_path "$__fish_user_data_dir/fisher"

if not contains -- "$fisher_path/functions" $fish_function_path
    set -g fish_function_path \
        $fish_function_path[1] \
        "$fisher_path/functions" \
        $fish_function_path[2..-1]
end

if not contains -- "$fisher_path/completions" $fish_complete_path
    set -g fish_complete_path \
        $fish_complete_path[1] \
        "$fisher_path/completions" \
        $fish_complete_path[2..-1]
end

if test -d "$fisher_path/conf.d"
    for plugin_config in $fisher_path/conf.d/*.fish
        source $plugin_config
    end
end
