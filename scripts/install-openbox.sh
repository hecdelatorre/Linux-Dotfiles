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
  mirage

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

if [ -d ~/.config/openbox ]; then
  rm -rf ~/.config/openbox
fi

if [ -d ~/.config/tint2 ]; then
  rm -rf ~/.config/tint2
fi

if [ -d ~/.config/picom ]; then
  rm -rf ~/.config/picom
fi

if [ -d ~/.local/share/applications ]; then
  if [ -f ~/.local/share/applications/xterm.desktop ]; then
    rm -f ~/.local/share/applications/xterm.desktop
  fi
else
  mkdir -p ~/.local/share/applications
fi

if [ -d ~/.local/share/icons ]; then
  if [ -f ~/.local/share/icons/xterm.svg ]; then 
    rm -f ~/.local/share/icons/xterm.svg
  fi
else
  mkdir -p ~/.local/share/icons
fi

xterm_svg="/Td6WFoAAATm1rRGAgAhARwAAAAQz1jM4Ac8AxJdAB4Py4cR2M5mkQ+DHsr9ezPUf+m32igxdiVmIE0qCW1q9ylwOEETlQiK0Fsdk0viUoZ92eYvWaMHdwLoMb8QLB/rgT3F6OZFCMfLuA8Uama8dq3HGWCv/8F1+Gnu/sEmrB++YY6KGYKwQb97vrPciABm6Nab9RO/xf7YXjE7hCUGZjxL63ehGwPGO7UTjeXH2fkaBbGmCovUqvnT9o02BVpXtRcXroq8lJP/ApVayKrzG9S4DE1FBV3kcKLqI2yP/VhJ0rLmf86Re/wCiXC3UESk/ITRUP/bNSX5esI365OYK8s/EGiHc/3Z+6IYXL77TIyAYgBPYlaCEUHehK2Fu8w8z0eNPVlI36vJKpi07bGUS0WUBJc7K70gl8UewwOgIfgsZU4q2kZUqoOtZR5az/5GqFYyIfPjq+byPmpbgFldGBOUrwXYJzvlq+F2Ex8AqkPVRP+Z+2hXTljxqeDb/Hb/vRZhD5/M41kymviVZcPpY06dTXONBPOHJ5Qoh6cuTPs8OmXgl2IhsoruGKK7DFs5Vvuu+b8dfjnwtzzTK/ZT+YFlHOoS3XtYhrB/A2bZrobg7XQO8FlX96qFrnqZKwN37tzp5a+E6YyCIYt8K6LrFHM8ZAfS1ljp4OjNG3F2XORQgWzFVVuUniSburU7TBJELLx28hHOI/SXxDAIXc2biuZF7XpHClytx8lIUucRtzLi7HJ90Ld0ZbHiZCZRNJ8O1wJ1sJP6EdV1KeaSSPxzBMBB1uKxLfkaTb2UtpucToZaiTEiU7e/ccBvfSTfp8OaBeaVuyjzmmtmRoBPIH92iWtSsVsVglP8hFgVGyQ8IRw1DEBQUwGTo/VqmlpIRggqkDICjyNsOOOJoSfl/Dwbx9qjNjH4iYbVTv5NwiYuLI8d8peRG2PH7DnjSoTZvzo3BFpznEvq9RbuFWVgcMPnZY7w6WyzyaNwPJ1fAOmAGdlyM+9sL5Jkhg2DdPSuFyZDksykqe0R/yJA1yt1AoxiI7ICvm+YVWravkAa6yegeNP2+FARvr4LUWk1EiLTJYO5owAAAHXkX+ybeUoQAAGuBr0OAACu6oWKscRn+wIAAAAABFla"
base64 -d <<< $xterm_svg | xz -d > ~/.local/share/icons/xterm.svg

cat > ~/.local/share/applications/xterm.desktop << EOF
[Desktop Entry]
Name=Xterm
Comment=Terminal Emulator
Exec=/usr/bin/xterm
Icon=~/.local/share/icons/xterm.svg
Terminal=false
Type=Application
Categories=Utility;TerminalEmulator;
EOF

echo "Copying configuration..."

openbox_tint2="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"

base64 -d <<< $openbox_tint2 | tar Jxvf - -C ~/.config

cp -vf /etc/X11/xinit/xinitrc ~/.xinitrc
echo "Done"
