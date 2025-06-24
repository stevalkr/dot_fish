if status is-interactive
    # Commands to run in interactive sessions can go here
    if command -q direnv
        direnv hook fish | source
    end

    if set -q TMUX
        function renew_env --on-event fish_focus_in
            set -l vars_to_sync MULTIPLEXER MULTIPLEXAER_LIST \
                I3SOCK \
                ZELLIJ_PANE_ID ZELLIJ \
                KITTY_WINDOW_ID KITTY_LISTEN_ON KITTY_PID \
                WEZTERM_PANE WEZTERM_UNIX_SOCKET WEZTERM_EXECUTABLE

            for var_name in $vars_to_sync
                set -l tmux_output $(command tmux showenv $var_name 2>/dev/null)
                if test -n "$tmux_output"
                    set -l parts $(string split -m 1 '=' -- $tmux_output)

                    if test (count $parts) -eq 2
                        set -gx $var_name $parts[2]
                    end
                end
            end
        end
    end
end
