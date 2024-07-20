#!/bin/bash
# Define an array named "name" with all file names in ../../.config/
name=($(ls -1 ../.config/))

# Sync the folders in ~/.config/ that are listed in the "name" array to ../../.config/

# Loop through each folder name in the "name" array
for i in "${name[@]}"; do
	# Check if the folder exists in ~/.config/
	if [ -d "$HOME/.config/$i" ]; then
		# Sync the folder to ../../.config/
		rsync -av --delete "$HOME/.config/$i" ../.config 
	fi
done

rsync -av --delete "$HOME/.script" ../

pacman -Qqen > ../package/packages-repository.txt
yay -Qqem >../package/packages-AUR.txt
