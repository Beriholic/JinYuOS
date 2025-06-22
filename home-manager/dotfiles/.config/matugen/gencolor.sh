#!/usr/bin/env bash
cd "$(xdg-user-dir PICTURES)" || exit 1

image_path=$(yad --width 1200 --height 800 --file --add-preview --large-preview --title='Choose wallpaper')

if [ -n "$image_path" ]; then
  matugen image "$image_path" -m "dark"

  swww img "$image_path" --transition-type any --transition-fps 165

  echo "$image_path" >"$HOME"/.local/state/wallpaper.txt
fi
