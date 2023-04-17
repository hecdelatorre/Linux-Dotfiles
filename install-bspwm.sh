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
apt update
apt install -y "${packages[@]}"
