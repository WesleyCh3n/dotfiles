#!/usr/bin/env bash

## If alacritty.yml does not exist, raise an alert
[[ ! -f ~/.config/alacritty/alacritty.yml ]] && \
    notify-send "alacritty.yml does not exist" && exit 0

## Fetch background_opacity from alacritty.yml
opacity=$(awk '$1 == "background_opacity:" {print $2; exit}' \
    ~/.config/alacritty/alacritty.yml)


## Assign toggle opacity value
case $opacity in
  1)
    toggle_opacity=0.8
    ;;
  *)
    toggle_opacity=1
    ;;
esac

echo now set opacity to $toggle_opacity

## Replace opacity value in alacritty.yml
sed -i -- "s/background_opacity: $opacity/background_opacity: $toggle_opacity/" \
    ~/.config/alacritty/alacritty.yml
