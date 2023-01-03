#! /bin/bash
echo "Updated on: $(date +"%H:%M:%S - %d/%m/%Y")" >> update.log
sudo apt update && sudo apt upgrade -y
sudo shutdown -h now