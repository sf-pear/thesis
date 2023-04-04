#!/bin/bash

# Check that both arguments are provided
if [[ $# -ne 2 ]]; then
  echo "Usage: $0 old_path new_path"
  exit 1
fi

# Replace the old file path with the new file path in all files in the current directory
find . -type f -exec sed -i "s|$1|$2|g" {} \;

# Usage: ./replace_file_paths.sh /mnt/c/Users/sabri/Documents/github/ /home/sabf/
