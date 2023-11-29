function ef --wraps cd --wraps ls --description "Change directory and list contents"
    cd $argv
    ls
end
