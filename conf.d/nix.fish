if test -e '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.fish'
    . '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.fish'
    set fish_complete_path $fish_complete_path $HOME/.nix-profile/share/fish/vendor_completions.d
end

