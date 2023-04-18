#! /bin/bash
echo "Updated on: $(date +"%H:%M:%S - %d/%m/%Y")" | tee -a ~/update.log
sudo pacman -Syu --noconfirm
sudo shutdown -h now