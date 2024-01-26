# A7mooz's suckless configuration

## Dependencies
1. `flameshot` - for screenshot taking
2. `xorg-xbacklight` - to control the back light
3. `pcmanfm` - for file management
4. `alsa-utils` - for audio management
5. `pipewire wireplumber pipewire-pulse pipewire-alsa` or `pulseaudio pulseaudio-alsa` - to enable pulse audio

Note: You need to enable using xbacklight with no password in the sudoers file like so:

```conf
%wheel ALL=(ALL) NOPASSWD: /usr/bin/xbacklight
```
replace `%wheel` with whatever group/user you want

Of course you may need more dependencies but I only included the ones that may not be on your system.
And the names are taken from the Arch repositories so yeah need to see what they are in your system.

Disclaimer: This project is not widely test and could break one's system if not careful. USE AT YOUR OWN RISK THERE ARE NO WARRANTIES.