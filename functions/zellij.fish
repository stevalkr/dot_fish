function zellij
    function __fish_set_user_var
        if type -q base64
            printf "\033]1337;SetUserVar=%s=%s\007" "$argv[1]" (echo -n "$argv[2]" | base64)
        end
    end

    set -l ori_multiplexer_list $MULTIPLEXER_LIST
    set -gx MULTIPLEXER_LIST "zellij,$ori_multiplexer_list"
    __fish_set_user_var IS_ZELLIJ true

    command zellij $argv

    set -gx MULTIPLEXER_LIST $ori_multiplexer_list
    __fish_set_user_var IS_ZELLIJ false
end
