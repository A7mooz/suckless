#!/bin/sh

set -e

ref=$(realpath $(dirname $0))

SUDO=sudo

ORG_USER=${DOAS_USER:-${SUDO_USER:-${USER}}}

if [[ "$(id -u)" == "0" && $ORG_USER != "root" ]] then $ref/scripts/confirm.sh "Do you want to continue as root? (it's gonna try to detect the original user but it's better to run as the original user)? (y/n) " " " || exit
fi

USER_HOME=$(getent passwd $ORG_USER | cut -d: -f6)

dirs=($(ls -d $ref/.config/*/))

config_dir="$USER_HOME/.config"

[[ ! -d $config_dir ]] && mkdir $config_dir

for dir in ${dirs[@]}; do
  if [[ ! -d "$config_dir/$(basename $dir)" ]] then cp -r $dir $config_dir && echo -e "Copying $dir" 
  else $ref/scripts/confirm.sh "'$config_dir/$(basename $dir)' already exists do you want to replace it? (y/n) " "Replacing \"$config_dir/$(basename $dir)\" with \"$dir\"" "Skipping \"$config_dir/$(basename $dir)\"" && (mkdir -p $ref/backup/$(basename $dir) && cp -r $config_dir/$(basename $dir)/* backup/$(basename $dir) ; cp -r $dir $config_dir) || true
  fi
done

echo -e "\n"

$ref/scripts/confirm.sh "Do you want to to install the suckless utilities (asks for $SUDO password)? (y/n) " " " " " || exit

SUCKLESS="$config_dir/suckless"
dirs=($(ls -d $SUCKLESS/*/))

for dir in ${dirs[@]}; do
	echo -e "\nInstalling $dir\n"
	cd $dir
	$SUDO make clean install
  echo ""
done

[[ ! -f $USER_HOME/.fehbg ]] && $ref/scripts/confirm.sh "Do you want to add the wallpaper? (y/n) " "Creating $USER_HOME/.fehbg" " " || exit

cp -r $ref/Pictures $USER_HOME

echo "#!/bin/sh" > $USER_HOME/.fehbg

echo "feh --no-fehbg --bg-fill '$USER_HOME/Pictures/Wallpapers/wallhaven-475y63_1920x1080.png' " >> $USER_HOME/.fehbg

echo ""