#! /bin/bash
echo "Updated on: $(date +"%H:%M:%S - %d/%m/%Y")" | tee -a update.log
sudo apt update && sudo apt upgrade -y