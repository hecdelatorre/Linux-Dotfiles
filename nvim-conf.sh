#!/bin/bash

cat > ~/.vimrc << EOF
syntax enable
set number
set relativenumber
set numberwidth=3
set mouse=a
set clipboard=unnamedplus
set showcmd
set ruler
set showmatch
set laststatus=2
set noshowmode 	
set encoding=utf-8
set expandtab
set shiftwidth=2
set softtabstop=2
filetype plugin indent on
EOF

# Check if ~/.config directory exists
if [ ! -d ~/.config ]; then
  echo "Creating ~/.config directory..."
  mkdir ~/.config
  echo "Done!"
else
  echo "~/.config directory already exists."
fi

# Check if ~/.config/nvim directory exists
if [ -d ~/.config/openbox ]; then
  echo "Deleting ~/.config/nvim directory..."
  rm -r ~/.config/nvim
  echo "Done!"
else
  echo "~/.config/nvim directory doesn't exist."
fi

echo "Copying configuration..."
curl -fsSL https://gitlab.com/hecdelatorre/scripts/-/raw/main/back/nvim.txz | tar Jxvf - -C ~/.config/
