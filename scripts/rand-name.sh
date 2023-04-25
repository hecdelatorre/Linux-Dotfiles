#!/bin/bash

read -p "Ingresa una ruta: " ruta

if [ ! -d "$ruta" ]; then
  echo "La ruta ingresada no es válida"
  exit 1
fi

for archivo in "$ruta"/*; do
  if [ -f "$archivo" ]; then
    extension="${archivo##*.}"
    nuevo_nombre="$(uuidgen -s -r | cut -c -8).$extension"
    mv -vf "$archivo" "$ruta/$nuevo_nombre"
  fi
done
