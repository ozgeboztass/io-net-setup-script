#!/bin/bash

set -euxo pipefail
export DEBIAN_FRONTEND=noninteractive

# Detect OS and version
if [ -f /etc/os-release ]; then
    . /etc/os-release
else
    echo "Your Linux distribution is not supported."
    exit 1
fi

# Check for Nvidia GPU presence
NVIDIA_PRESENT=$(lspci | grep -i nvidia || true)

# Install prerequisites for Nvidia
if [[ ! -z "$NVIDIA_PRESENT" && ! $(command -v nvidia-smi) ]]; then
    if [[ "$ID" == "arch" ]]; then
        sudo pacman -Syu --noconfirm
        sudo pacman -S --noconfirm linux-headers nvidia nvidia-utils nvidia-settings cuda docker
    elif [[ "$ID" == "ubuntu" || "$ID" == "debian" ]]; then
        sudo apt update && sudo apt upgrade -y
        sudo apt install linux-headers-$(uname -r) build-essential -y
        sudo apt install software-properties-common -y
        sudo apt install libxmu-dev libxi-dev libglu1-mesa libglu1-mesa-dev -y
        sudo apt install libjpeg-dev libpng-dev libtiff-dev libavcodec-dev libavformat-dev libswscale-dev -y
        sudo apt install libxvidcore-dev libx264-dev libopenblas-dev libatlas-base-dev liblapack-dev gfortran -y
        sudo apt install libhdf5-serial-dev libgtk-3-dev python3-dev curl -y
        sudo apt-add-repository -y ppa:graphics-drivers/ppa
        sudo apt update && sudo ubuntu-drivers autoinstall
        sudo wget "https://developer.download.nvidia.com/compute/cuda/repos/${VERSION_CODENAME}/x86_64/cuda-keyring_1.1-1_all.deb"
        sudo dpkg -i cuda-keyring_1.1-1_all.deb
        sudo apt update && sudo apt -y install cuda-toolkit
        export LD_LIBRARY_PATH=/usr/local/cuda-12.2/lib64:${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}
    elif [[ "$ID" == "fedora" ]]; then
        sudo dnf update -y
        sudo dnf install kernel-devel kernel-headers gcc make -y
        sudo dnf install akmod-nvidia xorg-x11-drv-nvidia-cuda -y
        if [[ ! $(command -v docker) ]]; then
            sudo dnf config-manager --add-repo https://download.docker.com/linux/fedora/docker-ce.repo
            sudo dnf install docker-ce docker-ce-cli containerd.io docker-compose-plugin -y
            sudo systemctl start docker && sudo systemctl enable docker
        fi
    else
        echo "Unsupported Linux distribution: $ID"
        exit 1
    fi
fi

# Docker installation
if ! command -v docker &>/dev/null; then
    if [[ "$ID" == "arch" ]]; then
        sudo pacman -S --noconfirm docker
    elif [[ "$ID" == "ubuntu" || "$ID" == "debian" ]]; then
        sudo apt install ca-certificates curl gnupg lsb-release -y
        curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
        echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
        sudo apt update && sudo apt install docker-ce docker-ce-cli containerd.io -y
    fi
fi

# Docker-compose installation
if ! command -v docker-compose &>/dev/null; then
    if [[ "$ID" == "arch" ]]; then
        sudo pacman -S --noconfirm docker-compose
    elif [[ "$ID" == "ubuntu" || "$ID" == "debian" ]]; then
        sudo apt install docker-compose-plugin -y
    elif [[ "$ID" == "fedora" ]]; then
        sudo dnf install docker-compose-plugin -y
    fi
fi

echo "Applying workaround for NVIDIA Docker issue."
sudo mkdir -p /etc/docker
sudo bash -c 'cat <<EOF > /etc/docker/daemon.json
{
   "runtimes": {
       "nvidia": {
           "path": "nvidia-container-runtime",
           "runtimeArgs": []
       }
   },
   "exec-opts": ["native.cgroupdriver=cgroupfs"]
}
EOF'
sudo systemctl restart docker
sudo systemctl enable docker

# Add docker group and user
sudo groupadd docker || true
sudo usermod -aG docker $USER || true

echo "Script completed. System will reboot now to apply changes."


