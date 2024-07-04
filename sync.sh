#!/usr/bin/env bash

help() {
    echo "Usage: $0 [options]"
    echo "Options:"
    echo "  --overwrite-locals, -ol  Overwrite local configuration files"
    echo "  --overwrite-users,  -ou  Overwrite user configuration files"
    echo "  --help, -h               Show this help message"
    exit 0
}

overwrite_locals=false
overwrite_users=false

while true; do
    case $1 in
        --overwrite-locals | -ol)
            overwrite_locals=true
            break
            ;;
        --overwrite-users | -ou)
            overwrite_users=true
            break
            ;;
        --help | -h)
            help
            ;;
        *)
            echo "Invalid option: $1"
            help
            exit 1
            ;;
    esac
done

declare -a configs=("hypr" "waybar" "terminator" "pcmanfm")

if [[ "$overwrite_locals" = true ]]; then
  for config in "${configs[@]}"; do
    local_config_path=".config/$config"
    rm -rf $local_config_path
    mkdir -p $local_config_path
    cp -r ~/.config/$config/* $local_config_path/
  done
fi

if [[ "$overwrite_users" = true ]]; then
  for config in "${configs[@]}"; do
    user_config_path="$HOME/.config/$config"
    rm -rf "$user_config_path"
    mkdir -p "$user_config_path"
    cp -r .config/$config/* $user_config_path/
  done
fi
        

