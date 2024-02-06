#!/bin/sh

# Run this to sync your local settings with the repo

set -e

ref=$(dirname $(realpath $(dirname $0)))

ORG_USER=${DOAS_USER:-${SUDO_USER:-${USER}}}

USER_HOME=$(getent passwd $ORG_USER | cut -d: -f6)

dirs=($(ls -d $ref/.config/*/))

config_dir="$USER_HOME/.config"

for dir in ${dirs[@]}; do
	cp -r $config_dir/$(basename $dir)/* $ref/.config/$(basename $dir) || true
done

$ref/scripts/clean.sh