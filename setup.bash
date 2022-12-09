#!/bin/bash

echo ".include /etc/pulse/default.pa" | sudo tee -a $HOME/.config/pulse/default.pa.d
echo "set-default-sink raop_output.ptvserver.local" | sudo tee -a $HOME/.config/pulse/default.pa.d
echo "load-module module-zeroconf-discover" | sudo tee -a $HOME/.config/pulse/default.pa.d
echo "load-module module-raop-discover" | sudo tee -a $HOME/.config/pulse/default.pa.d
echo "# load-module module-raop-sink" | sudo tee -a $HOME/.config/pulse/default.pa.d

flatpak install spotify 
yes | pacman -S discord 

yes | pacman -S avahi pulseaudio-zeroconf extra/pulseaudio-rtp docker docker-compose
yes | yay -S smartgit  

git clone git@github.com:OUXT-Polaris/ouxt_automation.git
mkdir new-tv
cd new-tv/
git clone git@github.com:kazuki0824/recisdb-rs.git --recursive
git clone git@github.com:kazuki0824/arib-recorder.git --recursive

