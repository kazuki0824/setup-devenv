#!/bin/bash

echo ".include /etc/pulse/default.pa" | sudo tee -a $HOME/.config/pulse/default.pa.d
echo "set-default-sink raop_output.ptvserver.local" | sudo tee -a $HOME/.config/pulse/default.pa.d
echo "load-module module-zeroconf-discover" | sudo tee -a $HOME/.config/pulse/default.pa.d
echo "load-module module-raop-discover" | sudo tee -a $HOME/.config/pulse/default.pa.d
echo "# load-module module-raop-sink" | sudo tee -a $HOME/.config/pulse/default.pa.d

sudo pacman -Syy
sudo pacman -Syu

yes | sudo pacman -S discord flatpak yay
flatpak install spotify -y

yes | sudo pacman -S avahi pulseaudio-zeroconf extra/pulseaudio-rtp docker docker-compose
yes | sudo pacman -S brasero baobab yubikey-manager-qt keybase-gui kbfs
yes | yay -S smartgit teamviewer

mkdir new-tv
cd new-tv/
git clone git@github.com:kazuki0824/recisdb-rs.git --recursive
git clone git@github.com:kazuki0824/arib-recorder.git --recursive

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -t stable -y
echo 'source $HOME/.cargo/env' >> "$HOME/.bashrc"
