#!/bin/bash

if [ -d /opt/curl-8.0.1 ]; then
  sudo rm -rf /opt/curl-8.0.1
fi

wget -qO - https://gitlab.com/hecdelatorre/custom-built-software/-/raw/main/x64/curl-8.0.1.txz.txt | base64 -d | sudo tar Jxvf - -C /opt

path_tem='export PATH="$PATH:/opt/curl-8.0.1/bin"'

if [[ "$SHELL" == */bash* ]]; then
  sed -i '/export PATH.*\/opt\/curl-8.0.1\/bin/d' ~/.bashrc
  echo $path_tem | tee -a ~/.bashrc
elif [[ "$SHELL" == */zsh* ]]; then
  sed -i '/export PATH.*\/opt\/curl-8.0.1\/bin/d' ~/.zshrc
  echo $path_tem | tee -a ~/.zshrc
fi
