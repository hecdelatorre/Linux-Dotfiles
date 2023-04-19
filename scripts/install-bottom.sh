#!/bin/bash

if [ -d /opt/bottom ]; then
  sudo rm -rf /opt/bottom
fi

sudo mkdir -p /opt/bottom

curl -fsSL https://github.com/ClementTsang/bottom/releases/download/0.8.0/bottom_x86_64-unknown-linux-gnu.tar.gz | sudo tar zxvf - -C /opt/bottom

path_tem='export PATH="$PATH:/opt/bottom"'

if [[ "$SHELL" == */bash* ]]; then
  sed -i '/export PATH.*\/opt\/bottom/d' ~/.bashrc
  echo $path_tem | tee -a ~/.bashrc
elif [[ "$SHELL" == */zsh* ]]; then
  sed -i '/export PATH.*\/opt\/bottom/d' ~/.zshrc
  echo $path_tem | tee -a ~/.zshrc
fi
