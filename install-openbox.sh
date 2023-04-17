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
  openbox
  tint2
  sddm
  menu

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

# Check if ~/.config/openbox directory exists
if [ -d ~/.config/openbox ]; then
  echo "Deleting ~/.config/openbox directory..."
  rm -r ~/.config/openbox
  echo "Done!"
else
  echo "~/.config/openbox directory doesn't exist."
fi

# Check if ~/.config/tint2 directory exists
if [ -d ~/.config/tint2 ]; then
  echo "Deleting ~/.config/tint2 directory..."
  rm -r ~/.config/tint2
  echo "Done!"
else
  echo "~/.config/tint2 directory doesn't exist."
fi

echo "Copying configuration..."
curl -fsSL https://gitlab.com/hecdelatorre/scripts/-/raw/main/back/openbox-tint2.txz | tar Jxvf - -C ~/.config

cp -vf /etc/X11/xinit/xinitrc ~/.xinitrc
echo "Done"
