#!/bin/bash

if [ -d /opt/wget2-2.0.1 ]; then
  sudo rm -rf /opt/wget2-2.0.1
fi

curl -fsSL https://gitlab.com/hecdelatorre/custom-built-software/-/raw/main/x64/wget2-2.0.1.txz.txt | base64 -d | sudo tar Jxvf - -C /opt

path_tem='export PATH="$PATH:/opt/wget2-2.0.1/bin"'

if [[ "$SHELL" == */bash* ]]; then
  sed -i '/export PATH.*\/opt\/wget2-2.0.1\/bin/d' ~/.bashrc
  echo $path_tem | tee -a ~/.bashrc
elif [[ "$SHELL" == */zsh* ]]; then
  sed -i '/export PATH.*\/opt\/wget2-2.0.1\/bin/d' ~/.zshrc
  echo $path_tem | tee -a ~/.zshrc
fi
