#!/usr/bin/env bash

SELECTION_METHOD="manual"
THEME_MODE="dark"
MATUGEN_TYPE="auto"
THEME_ONLY_SWITCH="false"

WALLPAPER_STATE_FILE="$HOME/.local/state/wallpaper.txt"
WALLPAPER_DIRS=(
  "$HOME/Pictures/Wallpapers"
  "$HOME/Pictures/wallpapers"
)

usage() {
  echo "Usage: $0 [options]"
  echo "A versatile script to set wallpapers and switch color themes."
  echo ""
  echo "Wallpaper Changing Modes (choose one):"
  echo "  (no args)         Open a file chooser to manually select a wallpaper (default)."
  echo "  --random          Select a random wallpaper from preset directories."
  echo ""
  echo "Theme Control:"
  echo "  --mode <mode>     Set the color scheme. <mode> can be 'dark' or 'light'. Defaults to 'dark'."
  echo "  --type <type>     Set the matugen color generation type. Use 'auto' for default. See list below."
  echo "  --no-switch       Only regenerate the theme for the CURRENT wallpaper."
  echo ""
  echo "Other:"
  echo "  -h, --help        Show this help message."
  echo ""
  echo "Available types for --type:"
  echo "  auto, scheme-content, scheme-expressive, scheme-fidelity, scheme-fruit-salad,"
  echo "  scheme-monochrome, scheme-neutral, scheme-rainbow, scheme-tonal-spot"
  echo ""
  echo "Examples:"
  echo "  $0                                      # Manually select a wallpaper, apply dark theme with auto type."
  echo "  $0 --random --type scheme-fruit-salad   # Set random wallpaper with a specific color type."
  echo "  $0 --mode light --no-switch --type scheme-tonal-spot # Switch current wallpaper's theme to light using a specific type."
}

while [[ "$#" -gt 0 ]]; do
  case $1 in
  --random)
    SELECTION_METHOD="random"
    shift
    ;;
  --no-switch)
    THEME_ONLY_SWITCH="true"
    shift
    ;;
  --mode)
    if [ -n "$2" ] && [[ "$2" != --* ]]; then
      if [[ "$2" == "dark" || "$2" == "light" ]]; then
        THEME_MODE="$2"
        shift 2
      else
        echo "Error: Invalid value for --mode. Use 'dark' or 'light'." >&2
        exit 1
      fi
    else
      echo "Error: The --mode option requires an argument ('dark' or 'light')." >&2
      exit 1
    fi
    ;;
  --type)
    if [ -n "$2" ] && [[ "$2" != --* ]]; then
      case "$2" in
      auto | scheme-content | scheme-expressive | scheme-fidelity | scheme-fruit-salad | scheme-monochrome | scheme-neutral | scheme-rainbow | scheme-tonal-spot)
        MATUGEN_TYPE="$2"
        shift 2
        ;;
      *)
        echo "Error: Invalid value for --type. See --help for a list of valid types." >&2
        exit 1
        ;;
      esac
    else
      echo "Error: The --type option requires an argument." >&2
      exit 1
    fi
    ;;
  -h | --help)
    usage
    exit 0
    ;;
  *)
    echo "Unknown parameter: $1" >&2
    usage
    exit 1
    ;;
  esac
done

run_matugen() {
  local img_path="$1"
  local matugen_cmd=("matugen" "image" "$img_path" "-m" "$THEME_MODE")

  if [ "$MATUGEN_TYPE" != "auto" ]; then
    matugen_cmd+=("--type" "$MATUGEN_TYPE")
    echo "Using generation type: $MATUGEN_TYPE"
  else
    echo "Using default (auto) generation type."
  fi

  "${matugen_cmd[@]}"
}

if [ "$THEME_ONLY_SWITCH" == "true" ]; then
  echo "Mode: Switching theme for the current wallpaper..."
  if [ ! -r "$WALLPAPER_STATE_FILE" ]; then
    echo "Error: Wallpaper state file not found at '$WALLPAPER_STATE_FILE'." >&2
    notify-send "Error: Wallpaper state file not found."
    exit 1
  fi

  image_path=$(cat "$WALLPAPER_STATE_FILE")
  if [ -z "$image_path" ] || [ ! -f "$image_path" ]; then
    echo "Error: Invalid or empty path in state file: '$image_path'." >&2
    notify-send "Error: Invalid wallpaper path in cache."
    exit 1
  fi

  echo "Applying theme: $THEME_MODE"
  echo "Using cached wallpaper: $image_path"
  run_matugen "$image_path"
  notify-send "Theme switched successfully!"
  exit 0
fi

image_path=""
if [ "$SELECTION_METHOD" == "manual" ]; then
  echo "Mode: Manual wallpaper selection..."
  cd "$(xdg-user-dir PICTURES)" || exit 1
  image_path=$(yad --width 1200 --height 800 --file --add-preview --large-preview --title='Choose wallpaper')
else
  echo "Mode: Random wallpaper selection..."
  image_path=$(find "${WALLPAPER_DIRS[@]}" -type f \( -iname "*.jpg" -o -iname "*.png" \) 2>/dev/null | shuf -n 1)
fi

if [ -n "$image_path" ]; then
  echo "Selected wallpaper: $image_path"
  echo "Applying theme: $THEME_MODE"

  run_matugen "$image_path"
  swww img "$image_path" --transition-type any --transition-fps 165

  mkdir -p "$(dirname "$WALLPAPER_STATE_FILE")"
  echo "$image_path" >"$WALLPAPER_STATE_FILE"

  notify-send "Wallpaper and theme set successfully!"
else
  notify-send "Operation canceled or no image file found. No changes were made."
  exit 1
fi
