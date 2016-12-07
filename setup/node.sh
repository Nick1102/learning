
$( curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.32.1/install.sh | bash)
export NVM_DIR="/home/$USER/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
nvm install node
nvm use node
