#!/bin/python
import datetime
import os

screenshot_path="$HOME/Pictures/screenshot"

if not os.path.exists(screenshot_path):
    os.system(f'mkdir -p "{screenshot_path}"')
    
file_name="-".join(str(datetime.datetime.now()).split('.')[0].split(' '))
pick_size=os.popen('slurp','r').read().replace("\n","")

os.system(f'grim -g "{pick_size}" "{screenshot_path}"/"{file_name}.png"')
os.system(f'wl-copy < "{screenshot_path}"/"{file_name}.png"')
os.system('notify-send -u  low "Shot!"')
