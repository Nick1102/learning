cd
echo "What is the name of the VM to be created(default: base-ubuntu)"
read VM_NAME
if [[ -z "$VM_NAME" ]]; then VM_NAME="base-ubuntu"; fi

echo "What is the path to the ISO image for the VM(default: ~/Downloads/ubuntu-16.04.1-server-amd64.iso)"
read UBUNTU_ISO_PATH
if [[ -z "$UBUNTU_ISO_PATH" ]]; then UBUNTU_ISO_PATH=~/Downloads/ubuntu-16.04.1-server-amd64.iso ; fi

echo "What is the path to the HDD image to be created(default: ~/Documents/base-ubuntu.vdi)"
read VM_HD_PATH
if [[ -z "$VM_HD_PATH" ]]; then VM_HD_PATH=~/Documents/base-ubuntu.vdi; fi

echo "What is the path to the folder to be shared with the VM?(default: ~)"
read SHARED_PATH
if [[ -z "$SHARED_PATH" ]]; then SHARED_PATH=~; fi

echo "Do you want to link the SSH port in the VM(22) to a port on localhost?(default: 2222)"
read SSH_PORT
if [[ -z "$SSH_PORT" ]]; then SSH_PORT=2222; fi

vboxmanage createvm --name $VM_NAME --ostype Ubuntu_64 --register
vboxmanage createhd --filename $VM_HD_PATH --size 10768
vboxmanage storagectl $VM_NAME --name "SATA Controller" --add sata --controller IntelAHCI
vboxmanage storageattach $VM_NAME --storagectl "SATA Controller" --port 0 --device 0 --type hdd --medium $VM_HD_PATH
vboxmanage storagectl $VM_NAME --name "IDE Controller" --add ide
vboxmanage storageattach $VM_NAME --storagectl "IDE Controller" --port 0 --device 0 --type dvddrive --medium $UBUNTU_ISO_PATH
vboxmanage modifyvm $VM_NAME --ioapic on
vboxmanage modifyvm $VM_NAME --memory 1024 --vram 128
vboxmanage modifyvm $VM_NAME --nic1 nat
vboxmanage modifyvm $VM_NAME --natpf1 "guestssh,tcp,,$SSH_PORT,,22"
vboxmanage modifyvm $VM_NAME --natdnshostresolver1 on
vboxmanage sharedfolder add $VM_NAME --name shared --hostpath $SHARED_PATH --automount
