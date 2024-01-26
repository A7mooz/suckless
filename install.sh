#!/bin/sh

set -e

ref=$(realpath $(dirname $0))

ORG_USER=${DOAS_USER:-${SUDO_USER:-${USER}}}

USER_HOME=$(getent passwd $ORG_USER | cut -d: -f6)

dirs=($(ls -d */))

config_dir="$USER_HOME/.config/suckless"

if [[ -d $config_dir ]]; then ./confirm.sh "The file '$config_dir' already exists do wish to continue? (y/n) " "" || exit
fi

[[ ! -d $config_dir ]] && mkdir -p $config_dir


for dir in ${dirs[@]}; do
  echo -e "\nInstalling $dir\n"
  [[ ! -d "$config_dir/$dir" ]] && cp -r $dir $config_dir
  cd $config_dir/$dir
  make clean install
  cd $ref
done