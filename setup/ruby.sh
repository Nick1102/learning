
mac_elixir_install()
{
    brew install rbenv ruby-build
    # Add rbenv to bash so that it loads every time you open a terminal
    echo 'if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi' >> ~/.bash_profile
    source ~/.bash_profile

    # Install Ruby
    rbenv install 2.3.1
    rbenv global 2.3.1
    ruby -v

    #install Rails
    gem install rails -v 4.2.6
    rbenv rehash

    brew install postgresql
    ln -sfv /usr/local/opt/postgresql/*plist ~/Library/LaunchAgents
    launchctl load ~/Library/LaunchAgents/homebrew.mxcl.postgresql.plist
}

linux_install()
{
    sudo apt-get update
    sudo apt-get -y install git-core curl zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev software-properties-common libffi-dev
    cd
    git clone https://github.com/rbenv/rbenv.git ~/.rbenv
    echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
    echo 'eval "$(rbenv init -)"' >> ~/.bashrc
    export PATH="$HOME/.rbenv/bin:$PATH"
    eval "$(rbenv init -)"

    git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build
    echo 'export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"' >> ~/.bashrc
    export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"

    rbenv install 2.3.1
    rbenv global 2.3.1
    ruby -v

    echo "gem: --no-document" > ~/.gemrc
    gem install bundler
    rbenv rehash

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
