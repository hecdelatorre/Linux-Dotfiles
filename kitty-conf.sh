#!/bin/bash

config_path="$HOME/.config/kitty"

if [ -d "$config_path" ]; then
    rm -rf "$config_path"/*
else
    mkdir -p "$config_path"
fi

kitty_txt="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"

base64 -d <<< $kitty_txt | xz -d > ~/.config/kitty/kitty.conf
