KERNEL_CHECK=$( dpkg --get-selections | grep linux-image-extra-$(uname -r) )
if [[ $KERNEL_CHECK  == ""  ]]; then
  echo "installing linux-image-extra to kernel"
  sudo apt-get install -y linux-image-extra-$(uname -r) linux-image-extra-virtual
  "Installed new kernel image, please reboot the system and rerun this file to proceed with the installation"
else
  echo "Installing docker"
  sudo apt-get update
  sudo apt-get install -y apt-transport-https ca-certificates
  sudo apt-key adv --keyserver hkp://ha.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
  echo "deb https://apt.dockerproject.org/repo ubuntu-xenial main" | sudo tee /etc/apt/sources.list.d/docker.list
  sudo apt-get update
  sudo apt-get install -y docker-engine
  sudo service docker start
  sudo usermod -aG docker $USER
fi
