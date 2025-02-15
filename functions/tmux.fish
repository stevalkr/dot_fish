function tmux
    function __fish_set_user_var
        if type -q base64
            printf "\033]1337;SetUserVar=%s=%s\007" "$argv[1]" (echo -n "$argv[2]" | base64)
        end
    end

    set -l ori_multiplexer_list $MULTIPLEXER_LIST
    set MULTIPLEXER_LIST "tmux,$ori_multiplexer_list"
    __fish_set_user_var IS_TMUX true

    command tmux $argv

    set MULTIPLEXER_LIST $ori_multiplexer_list
    __fish_set_user_var IS_TMUX false
end
