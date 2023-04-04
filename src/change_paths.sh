#!/bin/bash

LOCAL_NAME="beastie"
HOSTNAME=$(hostname)

# Set the old and new file paths based on the hostname
if [[ $HOSTNAME == LOCAL_NAME ]]; then
  LOCAL_PATH="/mnt/c/Users/sabri/Documents/github/"
  REMOTE_PATH="/home/sabf/"
else
  LOCAL_PATH="/home/sabf/"
  REMOTE_PATH="/mnt/c/Users/sabri/Documents/github/"
fi

# Replace file paths based on the old and new paths, excluding the script file
find . -type f -not -name "$(basename $0)" -exec sed -i "s|$REMOTE_PATH|$LOCAL_PATH|g" {} \;



