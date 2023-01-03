#! /bin/bash
mount -o remount,size=2G /run/archiso/cowspace
ping -c 10 1.1.1.1
if [ $? -eq 0 ]
then
  pacman -Sy && pacman -S reflector --noconfirm --needed
  reflector --verbose --latest 10 --country Mexico,"United States",Canada --age 12 --protocol https --sort rate --save /etc/pacman.d/mirrorlist && pacman -Sy
  pacman -S git base-devel --needed --noconfirm
  useradd -m -G wheel -s /bin/zsh hred
  echo -e "pass\npass" | passwd hred
  echo 'hred ALL= (ALL)ALL' | tee -a /etc/sudoers
fi