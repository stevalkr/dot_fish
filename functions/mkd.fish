function mkd --wraps cd --description "Make and change directory"
    mkdir $argv
    cd $argv[1]
end
