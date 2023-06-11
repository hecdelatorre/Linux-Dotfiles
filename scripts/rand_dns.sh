#!/bin/bash

declare -A array_dns

dns1=("1.1.1.1" "2606:4700:4700::1111" "1.0.0.1" "2606:4700:4700::1001")
dns2=("9.9.9.9" "2620:fe::fe" "149.112.112.112" "2620:fe::9")
dns3=("208.67.222.222" "2620:119:35::35" "208.67.220.220" "2620:119:53::53")

array_dns[0]=${dns1[@]}
array_dns[1]=${dns2[@]}
array_dns[2]=${dns3[@]}

# Verificar si existe el archivo /etc/resolv.conf y borrarlo si existe
if [ -f "/etc/resolv.conf" ]; then
    rm /etc/resolv.conf
fi

# Obtener una posición aleatoria del arreglo
random_position=$((RANDOM % ${#array_dns[@]}))

# Obtener el arreglo correspondiente a la posición aleatoria
random_array=${array_dns[$random_position]}

# Agregar contenido al archivo /etc/resolv.conf
for element in ${random_array[@]}
do
  echo "nameserver $element" >> /etc/resolv.conf
done
