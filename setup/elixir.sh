mac_elixir_install()
{
    git clone git://github.com/mururu/exenv.git ~/.exenv  
    echo 'export PATH="$HOME/.exenv/bin:$PATH"' >> ~/.bash_profile
    echo 'eval "$(exenv init -)"' >> ~/.bash_profile  
    export PATH="$HOME/.exenv/bin:$PATH"
    eval "$(exenv init -)"
    git clone git://github.com/mururu/elixir-build.git ~/.exenv/plugins/elixir-build  
    exenv install 1.3.3
    exenv global 1.3.3
}

linux_install()
{
    wget https://packages.erlang-solutions.com/erlang-solutions_1.0_all.deb
    sudo dpkg -i erlang-solutions_1.0_all.deb
    sudo apt-get update
    sudo apt-get install -y erlang
    git clone git://github.com/mururu/exenv.git ~/.exenv  
    echo 'export PATH="$HOME/.exenv/bin:$PATH"' >> ~/.bashrc
    echo 'eval "$(exenv init -)"' >> ~/.bashrc  
    export PATH="$HOME/.exenv/bin:$PATH"
    eval "$(exenv init -)"
    git clone git://github.com/mururu/elixir-build.git ~/.exenv/plugins/elixir-build  
    exenv install 1.3.3
    exenv global 1.3.3
}

echo "Checking System Version"
if [ "$(uname)" == "Darwin" ]; then
    echo "Detected Mac OS"
    mac_elixir_install
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
    echo "Detected Linux OS"
    linux_install
elif [ "$(expr substr $(uname -s) 1 10)" == "MINGW32_NT" ]; then
    # Do something under Windows NT platform
    echo "Detected Windows OS"
fi
