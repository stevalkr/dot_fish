function snapshot --description "Manage btrfs snapshots"
    switch $argv[1]
    case create
        switch $argv[2]
        case /home/share
            sudo btrfs subvolume snapshot -r /home/share /home/snapshots/share_$(date +%Y_%m_%d)
        case '*'
            echo "location not set!"
        end

    case list
        sudo btrfs subvolume list $argv[2]

    case '*'
        echo "snapshot create/list [location]"
    end
end

