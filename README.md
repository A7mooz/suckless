# A7mooz's suckless configuration

Cloning the repositry (you must include the submodules)
```sh
git clone --recurse-submodules https://github.com/A7mooz/suckless.git
```
also pass `--depth 1 --shallow-submodules` if you're not planning to contribute and want to clone faster 

## Dependencies
1. `flameshot` - for screenshot taking
1. `xorg-xbacklight` or `acpilight` - to control the back light
1. `clipmenu` - for clipboard with dmenu
1. `rofimoji` - to select emojis to type
1. `pcmanfm` - for file management
1. `alsa-utils` - for audio management
1. `pipewire wireplumber pipewire-pulse pipewire-alsa` or `pulseaudio pulseaudio-alsa` - to enable pulse audio

Note: You need to enable using xbacklight with no password in the sudoers (even when using `acpilight`) file like so:

```
%wheel ALL=(ALL) NOPASSWD: /usr/bin/xbacklight
```
replace `%wheel` with whatever group/user you want

## Fonts
`ttf-hack`, `ttf-hack-nerd`, `ttf-nerd-fonts-symbols` and an emoji font like `noto-fonts-emoji` or `ttf-joypixels`

Of course you may need more dependencies but I only included the ones that may not be on your system.
And the names are taken from the Arch repositories so you need to see what they are in your system.

You can run this on [Arch](https://archlinux.org)-based systems to install all the required packages:
```sh
sudo pacman -S --needed $(cat dependencies.txt) $(cat fonts.txt)
```
![2024-02-08_17-34](https://github.com/A7mooz/suckless/assets/57980136/5474fdd3-c250-42ab-872a-22cc69a767b6)

**Disclaimer**: This project is not widely test and could break one's system if not careful. USE AT YOUR OWN RISK THERE ARE NO WARRANTIES.
