apt-get install systemd libxext* libxfixes* libpciaccess* -y
wget https://sharedef.streaminy.com/streamcodexinstaller/install-quicksync.gz
tar -xzf install-quicksync.gz
cd /root/intel-mediasdk-18.3.1
chmod +x /root/quicksync.sh
bash ./install.sh
rm -rf /root/intel-mediasdk-18.3.1
rm -rf /root/quicksync.sh

echo "LIBVA_DRIVER_NAME=iHD" >> /etc/environment
echo "LIBVA_DRIVERS_PATH=/opt/intel/mediasdk/lib64" >> /etc/environment
source /etc/environment
