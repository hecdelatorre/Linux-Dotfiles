#! /bin/bash
echo "Note: This script must be executed by root"
read -p "Tell me the user to add to sudo: " user
if [ -d /home/$user ]
then
  gpasswd -a $user sudo
fi
