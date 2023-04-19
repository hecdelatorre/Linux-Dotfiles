#!/bin/bash

if [ -d /opt/pfetch-0.6.0 ]; then
  sudo rm -rf /opt/pfetch-0.6.0
fi

curl -fsSL https://github.com/dylanaraps/pfetch/archive/refs/tags/0.6.0.tar.gz | sudo tar zxvf - -C /opt

path_tem='export PATH="$PATH:/opt/pfetch-0.6.0"'

if [[ "$SHELL" == */bash* ]]; then
  sed -i '/export PATH.*\/opt\/pfetch/d' ~/.bashrc
  echo $path_tem | tee -a ~/.bashrc
elif [[ "$SHELL" == */zsh* ]]; then
  sed -i '/export PATH.*\/opt\/pfetch/d' ~/.zshrc
  echo $path_tem | tee -a ~/.zshrc
fi
