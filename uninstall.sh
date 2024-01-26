#!/bin/sh

set -e

ref=$(realpath $(dirname $0))

ORG_USER=${DOAS_USER:-${SUDO_USER:-${USER}}}

USER_HOME=$(getent passwd $ORG_USER | cut -d: -f6)

dirs=($(ls -d */))

config_dir="$USER_HOME/.config/suckless"

if [[ ! -d $config_dir ]]; then ./confirm.sh "The directory '$config_dir' doesn't exit do you wish to continue? (y/n) " "" || exit
fi

for dir in ${dirs[@]}; do
  echo -e "\nUninstalling $dir\n"
  cd $config_dir/$dir
  make clean uninstall
  cd $ref
done

./confirm.sh "Do you want to delete the '$config_dir' directory? (y/n) " "Deleting..." "Canaceled." || exit

rm -rf $config_dir