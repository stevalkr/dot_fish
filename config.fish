if status is-interactive
    # Commands to run in interactive sessions can go here
    if command -q direnv
        direnv hook fish | source
    end
end
