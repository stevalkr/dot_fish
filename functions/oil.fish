function oil
  nvim -c ":Oil $argv"

  set cwd_dir (echo $TMPDIR/vim_cwd)
    if test -f $cwd_dir
        set new_cwd (cat $cwd_dir)
        cd $new_cwd
    else
        echo "Error: $cwd_dir does not exist."
        return 1
    end
end
