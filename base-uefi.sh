#!/bin/bash
timedatectl set-ntp true
ln -sf /usr/share/zoneinfo/America/Santiago /etc/localtime
hwclock --systohc
# sed -i '177s/.//' /etc/locale.gen
# locale-gen
echo "LANG=es_CL.UTF-8" >> /etc/locale.conf
echo "KEYMAP=es" >> /etc/vconsole.conf
echo "jglarch" >> /etc/hostname
echo "127.0.0.1 localhost" >> /etc/hosts
echo "::1       localhost" >> /etc/hosts
echo "127.0.1.1 jglarch.localdomain jglarch" >> /etc/hosts
echo root:password | chpasswd

pacman -S --noconfirm grub efibootmgr intel-ucode networkmanager network-manager-applet dialog mtools dosfstools reflector linux-headers xdg-user-dirs xdg-utils gvfs gvfs-smb nfs-utils inetutils dnsutils bluez bluez-utils cups hplip alsa-utils bash-completion openssh rsync  os-prober ntfs-3g terminus-font fuse2 gtkmm libcanberra pcsclite xorg xorg-xinit xterm xf86-video-intel xf86-video-vmware xf86-input-vmmouse open-vm-tools 

pacman -S --noconfirm ttf-ubuntu-font-family ttf-dejavu ttf-liberation ttf-roboto noto-fonts ttf-opensans ttf-font-awesome ttf-droid nemo pcmanfm ranger rofi  nitrogen vlc xdotool neofetch xfce4-terminal python2 python3 python-pip udiskie redshift alacritty terminator arandr pamixer pacman-contrib upower brightnessctl 

pacman -S --noconfirm pavucontrol pulseaudio pulseaudio-bluetooth pulseaudio-alsa pavucontrol leafpad     

grub-install --target=x86_64-efi --efi-directory=/boot/efi --bootloader-id=GRUB --removable --recheck 
grub-mkconfig -o /boot/grub/grub.cfg

systemctl enable NetworkManager
systemctl enable bluetooth
systemctl enable cups.service
systemctl enable vmtoolsd 
# systemctl enable sshd

useradd -mG wheel jgl
echo jgl:password | chpasswd

# echo "ermanno ALL=(ALL) ALL" >> /etc/sudoers.d/ermanno


printf "\e[1;32mDone! Type exit, umount -a and reboot.\e[0m"




