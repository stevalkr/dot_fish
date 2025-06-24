function fish_greeting
    if not set --query IN_NIX_SHELL
        echo Good Enough is Good Enough!

        set -l tmux_info $(tmux ls 2>/dev/null | wc -l | string trim)
        if test $tmux_info -gt 0
            set_color yellow
            echo -n "$tmux_info"
            set_color green
            echo " tmux session(s) running."
            set_color normal
        end
    end
end
