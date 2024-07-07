function prof
  if test (count $argv) -lt 1
    echo "Usage: prof <program> [arguments...]" 1>&2
    return 1
  end

  set program (realpath -q $argv[1])
  or set program (which $argv[1])
  set -e argv[1]

  set output "/tmp/cpu_profile_$(whoami)_$(basename $program).trace"
  echo "Profiling $program into $output" 1>&2

  rm -rf $output
  xcrun xctrace record \
    --template 'CPU Profiler' \
    --no-prompt \
    --output $output \
    --target-stdout - \
    --launch -- $program $argv
  open $output
end
