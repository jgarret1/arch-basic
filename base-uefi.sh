#!/bin/bash

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

# You can add xorg to the installation packages, I usually add it at the DE or WM install script
# You can remove the tlp package if you are installing on a desktop or vm

pacman -S grub efibootmgr intel-ucode networkmanager network-manager-applet dialog mtools dosfstools reflector linux-headers xdg-user-dirs xdg-utils gvfs gvfs-smb nfs-utils inetutils dnsutils bluez bluez-utils cups hplip alsa-utils bash-completion openssh rsync reflector os-prober ntfs-3g terminus-font fuse2 gtkmm libcanberra pcsclite xorg xorg-xinit xterm xf86-video-intel xf86-video-vmware xf86-input-vmmouse open-vm-tools 

pacman -S ttf-ubuntu-font-family ttf-dejavu ttf-liberation ttf-roboto noto-fonts
ttf-opensans ttf-font-awesome ttf-droid 
# pacman -S --noconfirm xf86-video-intel
# pacman -S --noconfirm nvidia nvidia-utils nvidia-settings

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




