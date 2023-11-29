complete --command arc -f -a compress --description "Compress files" --condition "__fish_use_subcommand"
complete --command arc -f --condition "__fish_seen_subcommand_from compress"
complete --command arc -f -s e -l extreme --description "Extreme mode" --condition "__fish_seen_subcommand_from compress"
complete --command arc -r -s o -l output --description "Output filename" --condition "__fish_seen_subcommand_from compress"
complete --command arc -f -a "(__fish_complete_path)" --description "Extreme mode" --condition "__fish_seen_subcommand_from compress && __fish_seen_argument -s o -l output"

complete --command arc -f -a decompress --description "Decompress archive" --condition "__fish_use_subcommand"
complete --command arc -f -s o -l output --description "Output directory" --condition "__fish_seen_subcommand_from decompress"
complete --command arc -f -s h -l help --description "Print help"
