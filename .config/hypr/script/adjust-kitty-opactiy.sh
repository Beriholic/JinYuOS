#!/bin/bash

# For Hyprland
if [[ $XDG_CURRENT_DESKTOP == "Hyprland" ]]; then
  sed -i 's/^background_opacity.*$/background_opacity 0.5/' ~/.config/kitty/kitty.conf
fi

# For KDE
if [[ $XDG_CURRENT_DESKTOP == "KDE" ]]; then
  sed -i 's/^background_opacity.*$/background_opacity 1.0/' ~/.config/kitty/kitty.conf
fi
