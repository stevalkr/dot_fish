function prof_leaks
    if test (count $argv) -lt 1
        echo "Usage: prof <program> [arguments...]" 1>&2
        return 1
    end

    set program (realpath -q $argv[1])
    if not test -f $program
        set program (which $argv[1])
    end
    if not test -f $program
        echo "Error: $program not found" 1>&2
        return 1
    end
    set -e argv[1]

    set output "/tmp/leaks_$(whoami)_$(basename $program).trace"
    echo "Profiling $program into $output" 1>&2

    rm -rf $output
    xcrun xctrace record \
        --template 'Leaks' \
        --no-prompt \
        --output $output \
        --target-stdout - \
        --launch -- $program $argv
    open $output
end
