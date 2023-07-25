#!/bin/bash
# Define an array named "name" with all file names in ../../.config/
name=( $(ls -1 ../../.config/) )

# Sync the folders in ~/.config/ that are listed in the "name" array to ../../.config/

# Loop through each folder name in the "name" array
for i in "${name[@]}"
do
    # Check if the folder exists in ~/.config/
    if [ -d "$HOME/.config/$i" ]; then
        # Sync the folder to ../../.config/
        rsync -avz "$HOME/.config/$i" ../../.config/
    fi
done
