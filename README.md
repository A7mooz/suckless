# A7mooz's suckless configuration

## Dependencies
1. `flameshot` - for screenshot taking
1. `xorg-xbacklight` - to control the back light
1. `pcmanfm` - for file management
1. `alsa-utils` - for audio management
1. `pipewire wireplumber pipewire-pulse pipewire-alsa` or `pulseaudio pulseaudio-alsa` - to enable pulse audio

Note: You need to enable using xbacklight with no password in the sudoers file like so:

```
%wheel ALL=(ALL) NOPASSWD: /usr/bin/xbacklight
```
replace `%wheel` with whatever group/user you want

## Fonts
`ttf-hack`, `ttf-font-awesome`, and `ttf-nerd-fonts-symbols`

Of course you may need more dependencies but I only included the ones that may not be on your system.
And the names are taken from the Arch repositories so you need to see what they are in your system.

You can run this on arch-based systems to install all the required packages:
```sh
sudo pacman -S --needed $(cat dependencies.txt) $(cat fonts.txt)
```

**Disclaimer**: This project is not widely test and could break one's system if not careful. USE AT YOUR OWN RISK THERE ARE NO WARRANTIES.
