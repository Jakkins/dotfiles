#!/usr/bin/env bash

# save ~/.config/hypr/hyprland.conf
# save ~/.config/waybar
# save ~/.config/terminator
declare -a configs=("hypr" "waybar" "terminator" "pcmanfm")

for config in "${configs[@]}"; do
  local_config_path=".config/$config"
  
  rm -rf $local_config_path
  mkdir -p $local_config_path
  cp -r ~/.config/$config/* $local_config_path/
done