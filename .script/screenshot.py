#!/bin/python
import time
import os

screenshot_path="$HOME/Pictures/screenshot"

if not os.path.exists(screenshot_path):
    os.system(f'mkdir -p "{screenshot_path}"')
    
file_name=time.time()

os.system(f'grim -g "$(slurp)" ${screenshot_path}/{file_name}.png')
os.system(f'wl-copy < "{screenshot_path}"/"{file_name}.png"')
os.system('notify-send -u  low "Shot!"')
