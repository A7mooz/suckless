#!/bin/sh

# Uninstall/remove all the settings made by this repo

set -e

ref=$(realpath $(dirname $0))

SUDO=sudo

ORG_USER=${DOAS_USER:-${SUDO_USER:-${USER}}}

USER_HOME=$(getent passwd $ORG_USER | cut -d: -f6)

config_dir="$USER_HOME/.config"

if [[ ! -d $config_dir ]]; then $ref/scripts/confirm.sh "The directory '$config_dir' doesn't exit do you wish to continue? (y/n) " " " || exit
fi

suckless_dirs=($(ls $config_dir/suckless))

for dir in ${suckless_dirs[@]}; do
  echo -e "\nUninstalling $dir\n"
  cd $config_dir/suckless/$dir
  $SUDO make clean uninstall
done

echo ""

$ref/scripts/confirm.sh "Do you want to delete the directories made in the '$config_dir' directory? (y/n) " " " "Canaceled." || exit

dirs=($(ls -d $ref/.config/*/))

for dir in ${dirs[@]}; do
  echo -e "Removing $config_dir/$(basename $dir)"
  $SUDO rm -rf $config_dir/$(basename $dir)
done

echo ""