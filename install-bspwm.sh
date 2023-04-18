#!/bin/bash

# Package categories:
# System utilities
# Window manager
# Desktop environment
# Multimedia
# File managers
# Text editors
# Terminal emulator
# Application launcher
# Compositor
# Image viewer
# Screen capture
# Screen locker
# Network
# Themes and icons
# Fonts
# Programming
# Document viewer
# Archive manager

# Package list
packages=(
  # System utilities
  xorg
  sudo
  ssh
  git

  # Window manager
  bspwm 
  sxhkd 
  polybar
  sddm

  # Desktop environment
  lxappearance

  # Multimedia
  pulseaudio
  smplayer
  volumeicon-alsa

  # File managers
  pcmanfm
  ranger

  # Text editors
  vim
  nano

  # Terminal emulator
  xterm

  # Application launcher
  rofi

  # Compositor
  picom

  # Image viewer
  feh

  # Screen capture
  scrot

  # Screen locker
  xautolock
  slock

  # Network
  network-manager
  network-manager-gnome
  avahi-daemon
  gvfs-backends
  gvfs-fuse
  cifs-utils
  smbclient

  # Themes and icons
  numix-gtk-theme
  numix-icon-theme

  # Fonts
  fonts-firacode
  fonts-noto-cjk

  # Programming
  python3
  python3-pip

  # Document viewer
  evince

  # Archive manager
  engrampa
)

# Install packages
sudo apt update
sudo apt install -y "${packages[@]}"

if [ ! -d ~/.config ]; then
  mkdir ~/.config
fi

if [ -d ~/.config/bspwm ]; then
  rm -rf ~/.config/bspwm
fi

if [ -d ~/.config/polybar ]; then
  rm -rf ~/.config/polybar
fi

if [ -d ~/.config/sxhkd ]; then
  rm -rf ~/.config/sxhkd
fi

echo "Copying configuration..."

bspwm_polybar_sxhkd="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"

base64 -d <<< $bspwm_polybar_sxhkd | tar Jxvf - -C ~/.config

cp -vf /etc/X11/xinit/xinitrc ~/.xinitrc
echo "Done"
