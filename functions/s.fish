function s --wraps='ssh -Y -L 8888:localhost:8888' --wraps='kitty +kitten ssh -Y -L 8888:localhost:8888' --description 'alias s kitty +kitten ssh -Y -L 8888:localhost:8888'
  kitty +kitten ssh -Y -L 8888:localhost:8888 $argv
        
end
