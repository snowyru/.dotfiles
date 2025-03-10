#!/bin/bash
source /home/ldxt460s/.bashrc
WALLPAPERS_DIR=~/Pictures/Wallpapers
WALLPAPER=$(ls $WALLPAPERS_DIR | shuf -n 1)
/usr/bin/swww img $WALLPAPERS_DIR/$WALLPAPER --transition-type=random --transition-duration=0.8 --transition-fps=60

