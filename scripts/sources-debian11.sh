#!/bin/bash
#
cp -vf /etc/apt/sources.list /etc/apt/sources.list.back
cat > /etc/apt/sources.list << EOF
deb http://mirror.dal.nexril.net/debian/ bullseye main
deb-src http://mirror.dal.nexril.net/debian/ bullseye main

deb http://mirrors.ocf.berkeley.edu/debian-security/ bullseye-security main
deb-src http://mirrors.ocf.berkeley.edu/debian-security/ bullseye-security main

deb http://mirror.dal.nexril.net/debian/ bullseye-updates main
deb-src http://mirror.dal.nexril.net/debian/ bullseye-updates main
EOF

apt update
