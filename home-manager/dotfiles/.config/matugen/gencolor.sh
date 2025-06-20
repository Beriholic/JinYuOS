#!/usr/bin/env bash

cd "$(xdg-user-dir PICTURES)" || exit 1

image_path=$(yad --width 1200 --height 800 --file --add-preview --large-preview --title='Choose wallpaper')

if [ -n "$image_path" ]; then
    matugen image $image_path
    swww img "$image_path"
fi
