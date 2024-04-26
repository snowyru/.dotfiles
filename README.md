# Snowyru Arch Linux Hyprland setup
This is my .config files and other setup configuration for my Arch Linux Hyprland system on my daily driver laptop.

##  (1) Hyprland install
1. Arch live boot
	1. Wifi connection using `iwctl station DEVICE connect SSID`
	2. On arch live boot use `curl -LO archfi.sf.net/archfi`
2. After arch install 
	1. Login to root
	2. Add user to wheel group with `useradd -m -G wheel -s /bin/bash username`
	3. set password with `passwd username`
	4. Enable sudo for wheel group with `EDITOR=vim visudo`
		1. Then uncomment `%wheel ALL=(ALL:ALL) NOPASSWD: ALL`
	5. Exit and log into username
3. Hyprland install
	1. connect to wifi using `nmtui`
	2. use `sudo pacman -S hyprland kitty gtk3`
	3. clone soldoestech hyprlandv4 using `git clone https://github.com/SolDoesTech/HyprV4.git`
	4. Then run the set-hypr script
## (2) .config
1. Clone the config files with `git clone https://github.com/snowyru/.dotfiles.git`
2. Copy the config files over into the .config directory
##  (3) pacman -S
#### All my packages I use 

install nvm (node version manager) `curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/(LATEST example: v0.39.7)/install.sh | bash`

`sudo pacman -S vim nvim neofetch base-devel cmatrix git-lfs`
`discord firefox libreoffice-still obs-studio timeshift`
`pipewire pipwire-alsa pipwire-jack pipwire-pulse wireplumber easyeffects qjackctl`

`yay -S github-desktop-bin`
`microsoft-edge-stable-bin`
`obsidian-bin`
`onedrive protonvpn`
`visual-studio-code-bin`
`whatsapp-for-linux`
`xremap`
`nvim-packer-git`

#### Notes
running a sudo required app like timeshift requires the -E command so I cannot use wofi like normal
use `sudo -E timeshift-gtk` to open it or with gparted use `sudo -E gparted`






