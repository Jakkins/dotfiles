#!/usr/bin/env bash

BASE_DIR="$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

# save ~/.config/hypr/hyprland.conf
mkdir -p .config/hypr
rm -f $BASE_DIR/.config/hypr/hyprland.conf
cp ~/.config/hypr/hyprland.conf ./.config/hypr/hyprland.conf

# save ~/.config/waybar
rm -rf $BASE_DIR/.config/waybar
mkdir -p .config/waybar
cp ~/.config/waybar/* .config/waybar/


