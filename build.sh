# UNINSTALL NVIDIA DRIVERS
apt-get remove --purge nvidia* -y

# UNINSTALL CUDA DRIVERS
apt-get --purge remove cuda -y
apt autoremove -y
apt-get clean -y

# INSTALL NVIDIA DRIVERS
apt-get update 
apt-get install software-properties-common -y
DEBIAN_FRONTEND=noninteractive apt dist-upgrade -y
add-apt-repository ppa:graphics-drivers/ppa -y
apt-get update 
DEBIAN_FRONTEND=noninteractive apt dist-upgrade -y
DEBIAN_FRONTEND=noninteractive apt-get install nvidia-kernel-source-415 nvidia-driver-415 -y

# INSTALL CUDA DRIVERS
wget -c -v -nc https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64/cuda-repo-ubuntu1804_10.0.130-1_amd64.deb
dpkg -i cuda-repo-ubuntu1804_10.0.130-1_amd64.deb
apt-key adv --fetch-keys https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64/7fa2af80.pub
apt-get update
DEBIAN_FRONTEND=noninteractive apt-get install cuda -y
DEBIAN_FRONTEND=noninteractive apt-get install cuda-libraries-10-0 -y

apt-get install git -y
git clone https://github.com/keylase/nvidia-patch.git
cd nvidia-patch && ./patch.sh