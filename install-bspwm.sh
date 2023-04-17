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

# Check if ~/.config directory exists
if [ ! -d ~/.config ]; then
  echo "Creating ~/.config directory..."
  mkdir ~/.config
  echo "Done!"
else
  echo "~/.config directory already exists."
fi

# Check if ~/.config/bspwm directory exists
if [ -d ~/.config/bspwm ]; then
  echo "Deleting ~/.config/bspwm directory..."
  rm -r ~/.config/bspwm
  echo "Done!"
else
  echo "~/.config/bspwm directory doesn't exist."
fi

# Check if ~/.config/polybar directory exists
if [ -d ~/.config/polybar ]; then
  echo "Deleting ~/.config/polybar directory..."
  rm -r ~/.config/polybar
  echo "Done!"
else
  echo "~/.config/polybar directory doesn't exist."
fi

echo "Copying configuration..."
curl -fsSL https://gitlab.com/hecdelatorre/scripts/-/raw/main/back/bspwm-polybar.txz | tar Jxvf - -C ~/.config

cp -vf /etc/X11/xinit/xinitrc ~/.xinitrc
echo "Done"
