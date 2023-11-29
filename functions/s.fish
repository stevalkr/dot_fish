function s --wraps='ssh -Y -L 8888:localhost:8888' --description 'alias s ssh -Y -L 8888:localhost:8888'
  ssh -Y -L 8888:localhost:8888 $argv
        
end
