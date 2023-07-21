#!/bin/bash
swww init

cnt=$(cat $HOME/.config/hypr/scripts/swww/lastwallpaper.txt)

WALLPAPER_DIR="$HOME/Pictures/wallpaper"

WALLPAPERS=("$WALLPAPER_DIR"/*)

CURRENT_WALLPAPER="${WALLPAPERS[$cnt]}"

while true; do
	CURRENT_WALLPAPER="${WALLPAPERS[$cnt]}"

	swww img "$CURRENT_WALLPAPER"
	# echo "$CURRENT_WALLPAPER"

	((cnt++))

	rm ./lastwallpaper.txt

	echo $cnt >$HOME/.config/hypr/scripts/swww/lastwallpaper.txt

	if [ $cnt -ge ${#WALLPAPERS[@]} ]; then
		counter=0
	fi

	sleep 15m
done
