#!/bin/bash

echo ".include /etc/pulse/default.pa" | sudo tee -a $HOME/.config/pulse/default.pa.d
echo "set-default-sink raop_output.ptvserver.local" | sudo tee -a $HOME/.config/pulse/default.pa.d
echo "load-module module-zeroconf-discover" | sudo tee -a $HOME/.config/pulse/default.pa.d
echo "load-module module-raop-discover" | sudo tee -a $HOME/.config/pulse/default.pa.d
echo "# load-module module-raop-sink" | sudo tee -a $HOME/.config/pulse/default.pa.d

sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo \
  "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

sudo apt update
sudo apt upgrade -y

sudo snap install spotify

sudo apt install pulseaudio-module-raop -y
sudo apt install docker-ce docker-compose-plugin docker-scan-plugin docker-ce-rootless-extras -y
sudo apt install brasero baobab yubikey-personalization-gui -y
dockerd-rootless-setuptool.sh install
echo 'export DOCKER_HOST=unix://$XDG_RUNTIME_DIR/docker.sock' >> /home/{{ansible_user}}/.bashrc


eval `ssh-agent`
ssh-add -K

cd ~
git clone git@github.com:OUXT-Polaris/ouxt_automation.git

mkdir new-tv
cd new-tv/
git clone git@github.com:kazuki0824/recisdb-rs.git --recursive
git clone git@github.com:kazuki0824/arib-recorder.git --recursive

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -t stable -y
echo 'source $HOME/.cargo/env' >> "$HOME/.bashrc"


