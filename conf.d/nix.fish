if test -e '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.fish'
    . '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.fish'
    set fish_complete_path $fish_complete_path $HOME/.nix-profile/share/fish/vendor_completions.d
    set fish_function_path $fish_function_path $HOME/.nix-profile/share/fish/vendor_functions.d
    set -x __ETC_PROFILE_NIX_SOURCED 1
end
