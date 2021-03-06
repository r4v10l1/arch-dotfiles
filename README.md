<div align="center">
	<h1>My dotfiles and configurations for arch</h1>
	<b>
        Installation process of <a href="https://dwm.suckless.org/">dwm</a> in <a href="https://archlinux.org/">arch</a> / <a href="https://garudalinux.org/">garuda linux</a>.
    </b><br>
	Simple version <a href="https://github.com/r4v10l1/dwm-lite">here</a>.<br><br>
	<a href="https://github.com/r4v10l1/arch-dotfiles/network/members"><img src="https://img.shields.io/github/forks/r4v10l1/arch-dotfiles.svg?style=for-the-badge&logo=archlinux" alt="Forks"></a>
	<a href="https://github.com/r4v10l1/arch-dotfiles/stargazers"><img src="https://img.shields.io/github/stars/r4v10l1/arch-dotfiles.svg?style=for-the-badge&logo=archlinux" alt="Stars"></a>
</div>

## Table of contents
1. [Keys](#keys)
2. [Installation requirements](#installation-requirements)
3. [Installation process](#installation-process)
	- [dwm](#dwm)
	- [st](#st)
	- [dmenu](#dmenu)
	- [xmenu](#xmenu)
	- [slock](#slock)
	- [bashrc](#bashrc)
	- [xinitrc](#xinitrc)
	- [ssh](#ssh)
	- [Scripts](#scripts)
	- [nvim](#nvim)
4. [Extra](#extra)
4. [Todo](#todo)
5. [Screenshots](#screenshots)

## Keys:
All the keys and shortcuts can be found [here](https://github.com/r4v10l1/arch-dotfiles/blob/main/dwm-cheatsheet.md).

## Installation requirements:
### Files:
This file structure will be used in the process explanation.

1. Create folders.
	
	```bash
	mkdir -p ~/000/GITHUB
	``` 
2. Clone the repo to `~/000/GITHUB`.
	
	```bash
	cd ~/000/GITHUB
	git clone https://github.com/r4v10l1/arch-dotfiles
	```

### Packages:
Install the required packages for `ras`:
```bash
sudo pacman -S feh compton acpi picom
```
The required packages for `dwm`:
```bash
sudo pacman -S xorg xorg-xinit
```
The required packages for `surf`:
```bash
sudo pacman -S hspell aspell nuspell libvoikko
```
And the required fonts from the aur:
```bash
yay -S ttf-font-awesome dina-font
```

## Installation process:
### dwm
We will install dwm 6.2.
```bash
cd ~/000/GITHUB/arch-dotfiles/DWM-6.2
# rm config.h
sudo make clean install
```

### st
Make the `.font` folder and copy the powerline font in there.
```bash
cd ~/000/GITHUB/arch-dotfiles/fonts
mkdir ~/.fonts
cp -r powerline-fonts ~/.fonts
c-list | grep power  # Check that all is fine
```
We will install 0.8.2 because of the extensions.
```bash
cd ~/000/GITHUB/arch-dotfiles/ST-0.8.2
# rm config.h
sudo make clean install  # Prepare for the errors?
```
You can scroll the terminal with <kbd>Shift</kbd>+<kbd>Mouse Wheel</kbd>.

### dmenu
Enter the `DMENU` folder and install.
```bash
cd ~/000/GITHUB/custom_arch/DMENU/
sudo make clean install
```

### xmenu
Enter the `XMENU` folder and install.
```bash
cd ~/000/GITHUB/custom_arch/XMENU/
sudo make clean install
```

### slock
Enter the `SLOCK` folder and install.
```bash
cd ~/000/GITHUB/custom_arch/SLOCK/
sudo make clean install
```

### .bashrc
Make a backup and copy the `.bashrc` to `~/.bashrc`
```bash
cp ~/.bashrc ~/.bashrc.bak  # Make a backup
cd ~/000/GITHUB/arch-dotfiles/dotfiles/bashrc  # Yes it is a folder
cp bashrc ~/.bashrc  # Copy the actual file
```
Need to ~~download~~ copy `.git-prompt.sh`
```bash
#curl -o ~/.git-prompt.sh https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh
cp ~/000/GITHUB/arch-dotfiles/dotfiles/bashrc/git-prompt.sh ~/.git-prompt.sh
```
Add it to the `.bashrc` if you use your own:
```bash
echo "source ~/.git-prompt.sh" >> ~/.bashrc
```

### .xinitrc
Make a backup and copy the `.xinitrc` to `~/.xinitrc`
```bash
cp ~/.xinitrc ~/.xinitrc.bak  # Make a backup (The file might not exist!)
cd ~/000/GITHUB/custom_arch/dotfiles/xinitrc  # Yes it is a folder
cp xinitrc ~/.xinitrc  # Copy the actual file
```
Add `startx` to the `~/.bash_profile`
```bash
echo "startx" >> ~/.bash_profile  # Append to the file
```

### ssh
Configuring ssh depends on your needs, but I recommend what the [install gentoo wiki](https://wiki.installgentoo.com/wiki/Home_server/Remote_access) recommends.  
For my configuration file make sure you have ssh installed and enabled, and follow the [`README.md`](https://github.com/r4v10l1/arch-dotfiles/tree/main/dotfiles/ssh) in the ssh folder.  
Copy the `sshd_config` file to `/etc/ssh/sshd_config`. Make sure you change the `AllowUsers` part to allow login only with the user you want.

### Scripts
- Group 1

	```bash
	cat ~/000/GITHUB/arch-dotfiles/Scripts/Group1/README.txt  # Copy to /usr/local/bin
	# Just do what the file says
	```
- Group 2

	```bash
	cat ~/000/GITHUB/arch-dotfiles/Scripts/Group2/README.txt
	# Change the file name from 'dwmbar' to '.dwmbar' and copy it to ~
	# Just do what the file says
	```

### nvim
[Go to the vim-dotfiles repository.](https://github.com/r4v10l1/vim-dotfiles)

## Extra
- You might need to edit the grub config to launch garuda linux in terminal mode. [Help here.](https://forum.garudalinux.org/t/how-to-open-garuda-linux-in-text-console/7613)
- You might need to install `iwd`, `dialog` and `dhcpcd`.
- For natural scrolling, you can install `xf86-input-libinput` and add this to `/etc/X11/xorg.conf.d/30-touchpad.conf`:

	```conf
	Section "InputClass"
		Identifier "r4v10l1-rocks"
		Driver "libinput"
		Option "Tapping" "on"
		Option "NaturalScrolling" "true"
	EndSection
	```
- For audio and microphone, install `alsa-utils`. Then enable and change volumes with the `alsamixer` command.

	```bash
	sudo pacman -S alsa-utils alsa-plugins alsa-lib pulseaudio-alsa pulseaudio
	alsamixer
	speaker-test -c 8  # Test the speakers
	```
	- You can use `mvp` to play videos.
	- You can use `musikcube` for music.
- For screenshots you can use `maim`.

	```bash
	sudo pacman -S maim
	maim FILENAME.png -d 2
	# Will save the screenshot to a file with a 2 second delay.
	```
- Added low battery alerts using [xmenu](https://github.com/r4v10l1/arch-dotfiles/tree/main/XMENU) and [acpi](https://github.com/r4v10l1/arch-dotfiles/blob/main/Scripts/Group1/poweralert.sh#L7)
- For custom keys like XF86NNNNNNNNN, install `xbindkeys`, run `xbindkeys -d > ~/.xbindkeysrc` and copy `xbindkeysrc` to `~/.xbindkeysrc`.

	```bash
	sudo pacman -S xbindkeys
	xbindkeys -d > ~/.xbindkeysrc
	cp ~/000/GITHUB/arch-dotfiles/dotfiles/xbindkeysrc/xbindkeysrc ~/.xbindkeysrc
	```

## Todo
- [ ] Add [tag-previews](https://dwm.suckless.org/patches/tag-previews/) to dwm.

## Screenshots
![dwm-screenshot-1](images/dwm-5.png)
![dwm-screenshot-3](images/dwm-3.png)
![dwm-lite-mix](images/dwm-lite-mix.png)
![slock-1](images/lockscreen-1.png)
