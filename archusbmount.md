# Mounting an exFAT USB on Arch Linux (CLI) — Quick Guide

This guide shows the commands and minimal explanation required to mount an exFAT-formatted USB device on Arch Linux using the command line.

---

## 1 — Prerequisites
- Arch Linux (up-to-date).
- Root or sudo privileges.
- Install exfatprogs (recommended):
```bash
sudo pacman -Syu exfatprogs
```
Notes:
- exfatprogs provides mkfs.exfat, fsck.exfat, etc. Modern kernels (>= 5.7) include a native exFAT driver.
- Legacy exfat-fuse/exfat-utils are deprecated; use only if required.

---

## 2 — Identify the USB device & partition
Insert the USB, then run:
```bash
lsblk -f
# or
blkid
# or check kernel messages
dmesg | tail -n 20
```
Typical device names: `/dev/sdb`, partition `/dev/sdb1`. Confirm the partition contains `exfat` as TYPE or FSTYPE.

---

## 3 — Create mount point
```bash
sudo mkdir -p /mnt/usb
```

---

## 4 — Mount temporarily (one-off)
Basic mount (kernel driver):
```bash
sudo mount -t exfat /dev/sdb1 /mnt/usb
```
Mount with ownership/permission options (set owner to UID 1000, GID 1000 and readable by owner/group):
```bash
sudo mount -t exfat -o uid=1000,gid=1000,umask=0022 /dev/sdb1 /mnt/usb
```
Notes:
- Replace `1000` with your user UID/GID (`id -u`, `id -g`).
- If your system uses exfat-fuse (legacy), the helper may be `mount.exfat-fuse`:
```bash
sudo mount.exfat-fuse /dev/sdb1 /mnt/usb
```

---

## 5 — Verify mounted and list files
```bash
mount | grep /mnt/usb
ls -la /mnt/usb
```

---

## 6 — Unmount and safe removal
```bash
sudo umount /mnt/usb
sync         # ensure writes flushed
# then remove USB
```

---

## 7 — Make mount persistent (fstab)
Find a stable identifier (UUID or PARTUUID):
```bash
blkid /dev/sdb1
# or
lsblk -o NAME,UUID,PARTUUID,FSTYPE,MOUNTPOINT
```
Example fstab entry using UUID (replace with the actual UUID):
```
# /etc/fstab
UUID=YOUR-UUID-HERE  /mnt/usb  exfat  rw,uid=1000,gid=1000,umask=0022,noauto  0  0
```
- `noauto` prevents auto-mount at boot. Remove it if you want automatic mounting.
- Prefer UUID or PARTUUID over `/dev/sdXn` to avoid device renaming issues.

After editing fstab, mount with:
```bash
sudo mount /mnt/usb
```

---

## 8 — Create or repair an exFAT filesystem
- Create:
```bash
sudo mkfs.exfat -n MYLABEL /dev/sdb1
```
- Repair:
```bash
sudo fsck.exfat /dev/sdb1
```

---

## 9 — Troubleshooting
- "unknown filesystem type 'exfat'": ensure exfatprogs installed and kernel supports exFAT. For older kernels, install fuse/exfat-fuse packages.
- Device not listed in lsblk: check `dmesg` for errors, try replugging or another USB port.
- Permission problems: use `uid=`, `gid=`, `umask=` mount options.
- Use `sudo journalctl -k` and `dmesg` to inspect kernel messages for driver/IO errors.

---

## Quick checklist (commands)
```bash
# install tools
sudo pacman -Syu exfatprogs

# identify device
lsblk -f
blkid /dev/sdb1

# mount
sudo mkdir -p /mnt/usb
sudo mount -t exfat -o uid=1000,gid=1000,umask=0022 /dev/sdb1 /mnt/usb

# list files
ls -la /mnt/usb

# unmount
sudo umount /mnt/usb
sync
```

---

If you want, I can add an fstab-ready example using your system's actual UUID (run `blkid /dev/sdb1` and paste the output here) or show how to create an exFAT partition with parted if you need that.
