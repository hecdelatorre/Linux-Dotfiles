#!/bin/bash

if [ -d /opt/nvim-linux64 ]; then
  sudo rm -rf /opt/nvim-linux64
fi

curl -fsSL https://github.com/neovim/neovim/releases/download/stable/nvim-linux64.tar.gz | sudo tar zxvf - -C /opt

path_tem='export PATH="$PATH:/opt/nvim-linux64/bin"'

if [[ "$SHELL" == */bash* ]]; then
  sed -i '/export PATH.*\/opt\/nvim-linux64\/bin/d' ~/.bashrc
  echo $path_tem | tee -a ~/.bashrc
elif [[ "$SHELL" == */zsh* ]]; then
  sed -i '/export PATH.*\/opt\/nvim-linux64\/bin/d' ~/.zshrc
  echo $path_tem | tee -a ~/.zshrc
fi
