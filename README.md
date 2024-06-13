# Snowyru Arch Linux Hyprland setup
This is my .config files and other setup configuration for my Arch Linux Hyprland system on my daily driver laptop.

##  (1) Hyprland install
1. Arch live boot
	1. Wifi device name `iwctl device list`
 	2. Wifi connection using `iwctl station DEVICE connect SSID`
	3. On arch live boot use `curl -LO archfi.sf.net/archfi`
 	4. Make it executable with `chmod +x archfi` then run it `./archfi`
2. After arch install 
	1. Login to root
 	2. Connect to wifi using `nmtui`
	3. Add user to wheel group with `useradd -m -G wheel -s /bin/bash username`
	4. set password with `passwd username`
	5. Enable sudo for wheel group with `EDITOR=vim visudo`
		1. Then uncomment `%wheel ALL=(ALL:ALL) NOPASSWD: ALL`
	6. Exit and log into username
3. Hyprland install
	1. use `sudo pacman -S hyprland kitty gtk3 git base-devel`
	2. clone soldoestech hyprlandv4 using `git clone https://github.com/SolDoesTech/HyprV4.git`
	3. Then run the set-hypr script
## (2) .config
1. Clone the config files with `git clone https://github.com/snowyru/.dotfiles.git`
2. Copy the config files over into the .config directory
##  (3) pacman -S
#### All my packages I use 

install nvm (node version manager) replace with latest version `curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash`
Then install node with `nvm install lts` or the latest version

`sudo pacman -S vim neovim neofetch grep base-devel cmatrix git-lfs`
`discord firefox libreoffice-still obs-studio timeshift`
`pipewire pipewire-alsa pipewire-jack pipewire-pulse wireplumber easyeffects qjackctl`

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






