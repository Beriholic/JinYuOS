#!/bin/sh
swaybg -i /home/beri/Pictures/wallpaper/wallhaven-o5g125.jpg -m fill &
OLD_PID=$!
while true; do
	sleep 295
	swaybg -i $(find /home/beri/Pictures/wallpaper/. | shuf -n1) -m fill &
	NEXT_PID=$!
	sleep 5
	kill $OLD_PID
	OLD_PID=$NEXT_PID
done
