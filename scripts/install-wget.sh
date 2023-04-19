#!/bin/bash

if [ -d /opt/wget-1.21.3 ]; then
  sudo rm -rf /opt/wget-1.21.3
fi

curl -fsSL https://gitlab.com/hecdelatorre/custom-built-software/-/raw/main/x64/wget-1.21.3.txz.txt | base64 -d | sudo tar Jxvf - -C /opt

path_tem='export PATH="$PATH:/opt/wget-1.21.3/bin"'

if [[ "$SHELL" == */bash* ]]; then
  sed -i '/export PATH.*\/opt\/wget-1.21.3\/bin/d' ~/.bashrc
  echo $path_tem | tee -a ~/.bashrc
elif [[ "$SHELL" == */zsh* ]]; then
  sed -i '/export PATH.*\/opt\/wget-1.21.3\/bin/d' ~/.zshrc
  echo $path_tem | tee -a ~/.zshrc
fi
