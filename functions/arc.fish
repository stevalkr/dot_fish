function arc --argument-names cmd --description "A xz-tar wrapper"
  set --local num_threads $(cat /proc/cpuinfo | grep '^processor' | wc -l)

  switch $cmd
    case compress
      argparse 'h/help' 'o/output=' 'e/extreme' -- $argv[2..-1]
      if set --query _flag_help
        echo "Usage: arc compress [options] <file1> <file2> ..."
        echo "Options:"
        echo "  -o, --output <filename> : Specify the output filename (required)"
        echo "  -e, --extreme           : Use extreme compression and full threads"
        echo "  -h, --help              : Print this help message"
      else
        set --local input_filenames $argv
        set --local output_filename "$_flag_output.tar.xz"

        set --local thrd_flag
        set --local comp_flag

        if set --query _flag_extreme
          set comp_flag -vze9
          set thrd_flag -T $num_threads
        else
          set comp_flag -vz
          set thrd_flag -T $(math "ceil($num_threads / 2)")
        end

        echo -e "RUNNING: \n \
    tar -c $input_filenames | xz $comp_flag $thrd_flag > $output_filename"
        tar -c $input_filenames | xz $comp_flag $thrd_flag > $output_filename

        echo "Files compressed to $output_filename"
      end
    case decompress
      argparse 'h/help' 'o/output=' -- $argv[2..-1]
      if set --query _flag_help
        echo "Usage: arc decompress [options] <file>"
        echo "Options:"
        echo "  -o, --output <path>     : Specify the output path"
        echo "  -h, --help              : Print this help message"
      else
        set --local input_filename $argv

        if set --query _flag_output
          set --local output_directory $_flag_output
          echo -e "RUNNING: \n \
    tar -xvf $input_filename -C $output_directory"
          tar -xvf $input_filename -C $output_directory
        else
          echo -e "RUNNING: \n \
    tar -xvf $input_filename"
          tar -xvf $input_filename
        end
      end

    case '*'
      echo "Usage: arc compress   [options] <file1> <file2> ..."
      echo "       arc decompress [options] <file>"
      echo "Options:"
      echo "  -h, --help              : Print this help message"
      echo "  For more options see help message for each command"
  end
end
