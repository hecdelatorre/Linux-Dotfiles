#!/bin/bash

if [ -d /opt/sqlite-3.41.2 ]; then
  sudo rm -rf /opt/sqlite-3.41.2
fi

curl -fsSL https://gitlab.com/hecdelatorre/custom-built-software/-/raw/main/x64/sqlite-3.41.2.txz.txt | base64 -d | sudo tar Jxvf - -C /opt

path_tem='export PATH="$PATH:/opt/sqlite-3.41.2/bin"'

if [[ "$SHELL" == */bash* ]]; then
  sed -i '/export PATH.*\/opt\/sqlite-3.41.2\/bin/d' ~/.bashrc
  echo $path_tem | tee -a ~/.bashrc
elif [[ "$SHELL" == */zsh* ]]; then
  sed -i '/export PATH.*\/opt\/sqlite-3.41.2\/bin/d' ~/.zshrc
  echo $path_tem | tee -a ~/.zshrc
fi
