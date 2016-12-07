copy_files()
{
    cp .vimrc ~/.vimrc
    cp .tmux.conf ~/.tmux.conf
}

symlink_nvim()
{
    mkdir ~/.vim
    mkdir ~/.config
    ln -s ~/.vimrc ~/.config/nvim/init.vim
    ln -s ~/.vim ~/.config/nvim
    nvim +PlugInstall +qall
}

mac_install()
{
    copy_files
    brew install neovim/neovim/neovim
    symlink_nvim
    echo "alias vim='nvim'" >> ~/.bash_profile
}

linux_install()
{
    copy_files
    sudo apt-get install -y software-properties-common
    sudo add-apt-repository ppa:neovim-ppa/unstable
    sudo apt-get update
    sudo apt-get install -y neovim
    sudo apt-get install -y python-dev python-pip python3-dev python3-pip
    symlink_nvim
    echo "alias vim='nvim'" >> ~/.bashrc
}

echo "Checking System Version"
if [ "$(uname)" == "Darwin" ]; then
    echo "Detected Mac OS"
    mac_install
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
    echo "Detected Linux OS"
    linux_install
elif [ "$(expr substr $(uname -s) 1 10)" == "MINGW32_NT" ]; then
    # Do something under Windows NT platform
    echo "Detected Windows OS"
fi
