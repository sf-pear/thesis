#!/bin/bash

# Define the mapping of machines to root paths
declare -A machine_to_path=(
    ["server"]="/home/sabf"
    ["local"]="/mnt/c/Users/sabri/Documents/github"
)

# Determine the hostname of the current machine
hostname=$(hostname)

# Replace the paths in all files that include them
root_path=${machine_to_path[$hostname]}
find /path/to/directory -type f -name "*.txt" -print0 |
while IFS= read -r -d $'\0' file; do
    sed -i "s|$root_path|/home/sabf|g" "$file"
    sed -i "s|/mnt/c/Users/sabri/Documents/github|/home/sabf|g" "$file"
done
