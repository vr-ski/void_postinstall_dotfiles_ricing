#!/bin/bash

set -euo pipefail

set +u
#Try to get effective user from: 1.env; 2.arg; 3.login
if [[ -n "${SUDO_USER}" ]]; then
	TARGET_USER="${SUDO_USER}"
elif [[ -n "${1}" ]]; then
	TARGET_USER="${1}"
else
	TARGET_USER="$(logname 2> /dev/null || whoami)"
fi

if [[ "${TARGET_USER}" == "root" ]]; then
	read -p "Enter username of primary nonroot user: " TARGET_USER
fi
set -u

# Install packages
xbps-install vpm neovim opendoas keepassxc psmisc zsh nnn fff tlp git wget btop dejavu-fonts-ttf font-inconsolata-otf noto-fonts-ttf font-awesome6 nerd-fonts-symbols-ttf wqy-microhei alsa-utils cifs-utils rdesktop ffmpeg6 mpv mpd mpc tmux mesa-dri mesa-vaapi intel-video-accel mesa-vulkan-intel intel-media-driver libva-utils glxinfo river elogind seatd wlroots yambar fuzzel swaybg swayimg grim slurp foot alacritty textadept lite-xl pcmanfm firefox zathura zathura-pdf-poppler

# Add river launcher to /etc/profile
printf '\nif [ "$(tty)" = "/dev/tty1" ]; then \n        export XDG_RUNTIME_DIR=/tmp/river-runtime\n        export MOZ_ENABLE_WAYLAND=1\n        export WINIT_UNIX_BACKEND=wayland\n        export TERM=xterm\n        mkdir -p "${XDG_RUNTIME_DIR}"\n        chmod 700 "${XDG_RUNTIME_DIR}"\n\n        exec dbus-run-session river\nfi\n' >> /etc/profile

# Setup doas with no password for wheel
printf 'permit nopass :wheel\n' >> /etc/doas.conf

# Setup sudo with no password for wheel
printf '%%wheel ALL=(ALL:ALL) NOPASSWD: ALL\n' >> /etc/sudoers.d/wheel

# Add elogind service
ln -s /etc/sv/elogind /var/service

# Add seatd service and group
ln -s /etc/sv/seatd /var/service
usermod -a -G _seatd $TARGET_USER

# Add autologin
cp -va /etc/sv/agetty-tty1 /etc/sv/agetty-autologin
ln -s /etc/sv/agetty-autologin /var/service
sed -i 'N;/^[[:space:]]*exec.*\n.*/d' /etc/sv/agetty-autologin/run
printf "\nif [ \"${tty}\" = 'tty1' ]; then\n        exec agetty --autologin ${TARGET_USER} --noclear \"${tty}\" \"${BAUD_RATE}\" linux\nelse\n        exec chpst -P ${GETTY} ${GETTY_ARGS} \"${tty}\" \"${BAUD_RATE}\" \"${TERM_NAME}\"\nfi\n" >> /etc/sv/agetty-autologin/run

# Add swapfile (btrfs)
truncate -s 0 /swapfile
chattr +C /swapfile
fallocate -l 8G /swapfile
chmod 0600 /swapfile
mkswap /swapfile
swapon /swapfile
printf '/swapfile none swap sw 0 0\n' >> /etc/fstab

# Add samba shares to fstab
mkdir -vp /mnt/archive
printf '//truenas/archive/ /mnt/archive cifs credentials=/etc/smb-credentials,uid=1000,iocharset=utf8,file_mode=0644,dir_mode=0755 0 0\n' >> /etc/fstab

mkdir -vp /mnt/downloads
printf '//truenas/downloads/ /mnt/downloads cifs credentials=/etc/smb-credentials,uid=1000,iocharset=utf8,file_mode=0644,dir_mode=0755 0 0\n' >> /etc/fstab

mkdir -vp /mnt/games
printf '//truenas/games/ /mnt/games cifs credentials=/etc/smb-credentials,uid=1000,iocharset=utf8,file_mode=0644,dir_mode=0755 0 0\n' >> /etc/fstab

# Install oh-my-zsh
sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
