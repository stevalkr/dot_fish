if test -f /opt/homebrew/bin/brew && not set -q HOMEBREW_PREFIX
    eval "$(/opt/homebrew/bin/brew shellenv)"
end
