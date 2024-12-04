#!/bin/bash

# Create a temp directory to contain placeholder files.
tmp_dir=$(mktemp -d)

# Get paths of files to test from standard input.
while read p; do
  fname=$(basename "$p")
  tmp_path=$tmp_dir/$fname
  if [[ -e $tmp_path ]]; then
    q=$(cat "$tmp_path")
    echo "duplicate: $p"
    echo "    first: $q"
  else
    echo $p > "$tmp_path" 
  fi
done

exit
