function ws --wraps cd --wraps ls --description "Change directory based on argument and list contents"
    switch (count $argv)
        case 0
            cd ~/Documents
        case 1
            switch $argv[1]
                case stu
                    cd "/Users/walker/Library/Mobile Documents/com~apple~CloudDocs/STU"
                case '*'
                    echo "Unknown argument: $argv[1]. Defaulting to ~/Documents."
                    cd ~/Documents
            end
        case '*'
            echo "Too many arguments. Only one argument is supported."
            return 1
    end
    ls
end

