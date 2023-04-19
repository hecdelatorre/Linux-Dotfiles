#!/bin/bash

if [ -d /opt/gcc-11.3.0 ]; then
  sudo rm -rf /opt/gcc-11.3.0
fi

curl -fsSL https://gitlab.com/hecdelatorre/custom-built-software/-/raw/main/x64/gcc-11.3.0.txz.txt | base64 -d | sudo tar Jxvf - -C /opt

path_tem='export PATH="$PATH:/opt/gcc-11.3.0/bin"'

if [[ "$SHELL" == */bash* ]]; then
  sed -i '/export PATH.*\/opt\/gcc-11.3.0\/bin/d' ~/.bashrc
  echo $path_tem | tee -a ~/.bashrc
elif [[ "$SHELL" == */zsh* ]]; then
  sed -i '/export PATH.*\/opt\/gcc-11.3.0\/bin/d' ~/.zshrc
  echo $path_tem | tee -a ~/.zshrc
fi
