# Snowyru Linux installation guides

My brief instructions on how to install and apply my configs

## Snowyru Arch Linux Hyprland setup

Breif instruction on how I install Arch linux with Hyprland using archfi and SolDoesTech HyprV4 config

<details>

### (1) Hyprland installi

1. Arch live boot
   1. Wifi device name `iwctl device list`
   2. Wifi connection using `iwctl station DEVICE connect SSID`
   3. On arch live boot use `curl -LO archfi.sf.net/archfi`
   4. then run it `sh ./archfi`
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

### (2) .config

1. Clone the config files with `git clone https://github.com/snowyru/.dotfiles.git`
2. Copy the config files over into the .config directory

### (3) pacman -S

#### All my packages I use

install nvm (node version manager) replace with latest version `curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash`
Then install node with `nvm install lts` or the latest version

`sudo pacman -S vim neovim fastfetch grep base-devel cmatrix git-lfs`
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

### Notes

running a sudo required app like timeshift requires the -E command so I cannot use wofi like normal
use `sudo -E timeshift-gtk` to open it or with gparted use `sudo -E gparted`

</details>


## Snowyru Fedora Linux KDE Plasma setup

Breif instruction on how I install Fedora 40 linux with KDE Plasma v6.1

<details>

### (1) Follow gui install from the fedora kde spin

https://fedoraproject.org/spins/

### (2) Optimise the dnf config file

Edit the dnf.conf file to allow for the fastestmirror, parallel downloads, keeping chached downloads and allow press enter to proceed.

sudo vi /etc/dnf/dnf.conf

```
fastestmirror=True
max_parallel_downloads=5
defaultyes=True
keepcache=True
```

No run an update with  `sudo dnf update`

### (3) Allow for wider selection of packages (rpm fusion, flathub)

1. Enable rpm fusion
   1. https://rpmfusion.org/Configuration
2. Enable flathub
   1. https://flatpak.org/setup/Fedora

### (4) Install base-essentials 

1. `sudo dnf groupinstall "Development Tools" "Development Libraries"`

### (5) Backup and restore with konsave (optional - can just redo all customisation themes)

1. https://github.com/Prayag2/konsave
2. konsave is a cli backup tool that creates a .knsv file that is roughly 120MB (so I didn't upload this to github)
3. Install with python 3 as instructed
4. Save your config with `konsave -s <profile name>`
5. Export that config with `konsave -e <profile name>`
6. Restore that config with `konsave -i <path to the file>` and apply with `konsave -a <profile name>`

### (6) Restore shortcuts (keybinds)

1. kde plasma provides a button in the shortcut settings page to import and export shortcuts.
2. There is a shortcut file exported in the plasma directory in this repo. Note that there are keybinds for polonium (tiling wm) downloaded from the kwinScripts settings store.

### (7) dnf install

#### All my packages I use

` sudo dnf install timeshift fastfetch kitty kvantum python3-pip cmatrix neovim`

` flatpak install flathub com.ktechpit.whatsie com.visualstudio.code md.obsidian.Obsidian com.obsproject.Studio org.shotcut.Shotcut com.microsoft.Edge com.protonvpn.www io.github.shiftey.Desktop `

### Note:

By default fedora names the hostname 'fedora'. Which can be change using this  `sudo hostnamectl set-hostname "New_Custom_Name" `

Timeshift restore does not restore however it does backup all files which can be acessed using a file manager

I use xremap as a universal keyremapper in wayland. Using the autostart in KDE settings I autostart the konsole using the `xremap.desktop` file provided to be placed in `~/.config/autostart/`. This launches a terminal to prompt for the password to run xremap

For discord the flatpak kept on crashing so I used this method instead
`sudo dnf install https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm`
`sudo dnf update`
`sudo dnf install discord`

For remote desktop apps to work install the x11 version of kde
`sudo dnf install plasma-workspace-x11.x86_64`
or `sudo dnf install plasma-workspace-x11 kwin-x11`

To apply slight transparency and no border and title bars to all windows use the window rules settings and select unimportant then apply the rule

</details>
