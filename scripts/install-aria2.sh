#!/bin/bash

if [ -d /opt/aria2-1.36.0 ]; then
  sudo rm -rf /opt/aria2-1.36.0
fi

curl -fsSL https://gitlab.com/hecdelatorre/custom-built-software/-/raw/main/x64/aria2-1.36.0.txz.txt | base64 -d | sudo tar Jxvf - -C /opt

path_tem='export PATH="$PATH:/opt/aria2-1.36.0/bin"'

if [[ "$SHELL" == */bash* ]]; then
  sed -i '/export PATH.*\/opt\/aria2-1.36.0\/bin/d' ~/.bashrc
  echo $path_tem | tee -a ~/.bashrc
elif [[ "$SHELL" == */zsh* ]]; then
  sed -i '/export PATH.*\/opt\/aria2-1.36.0\/bin/d' ~/.zshrc
  echo $path_tem | tee -a ~/.zshrc
fi
