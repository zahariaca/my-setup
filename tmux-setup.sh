#!/usr/bin/env bash

sudo apt-get update

#install helper software
sudo apt-get install vim make gcc

# setup vim as system editor
echo "export $EDITOR='vim' >> ~/.bashrc"

# install ruby
cd $HOME
sudo apt-get install git-core curl zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev software-properties-common libffi-dev

git clone https://github.com/rbenv/rbenv.git ~/.rbenv
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(rbenv init -)"' >> ~/.bashrc
exec $SHELL

git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build
echo 'export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"' >> ~/.bashrc
exec $SHELL

rbenv install 2.3.1
rbenv global 2.3.1
ruby -v

# make directory for git
mkdir ~/git

pusdh ~/git

# clone tmux and tmuxinator
git clone https://github.com/gpakosz/.tmux.git

# return to this git folder
popd

# link .tmux.conf from repo to ~/.tmux.conf
ln -s -f ~/git/.tmux/.tmux.conf   ~/.tmux.conf


# copy local editable conf from repo to home
cp ./muxconf/.tmux.conf.local ~/.tmux.conf.local

# install tmuxinator
gem install tmuxinator

# copy tmuxinator conf
cp ./muxconf/test.yml ~/.config/tmuxinator/test.yml