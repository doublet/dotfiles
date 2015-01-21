#!/bin/bash

# This is for Debian-based distros

# Build vim from source
# As per https://github.com/Valloric/YouCompleteMe/wiki/Building-Vim-from-source

# dependencies
sudo apt-get install libncurses5-dev libgnome2-dev libgnomeui-dev libgtk2.0-dev libatk1.0-dev libbonoboui2-dev libcairo2-dev libx11-dev libxpm-dev libxt-dev python-dev ruby-dev mercurial cmake

# remove vim if already installed
sudo apt-get remove vim vim-runtime gvim

mkdir ~/builds
cd ~/builds
hg clone https://code.google.com/p/vim/
cd -
cd ~/builds/vim
./configure --with-features=huge --enable-multibyte --enable-rubyinterp --enable-pythoninterp --with-python-config-dir=/usr/lib/python2.7/config --enable-perlinterp --enable-luainterp --enable-gui=gtk2 --enable-cscope --prefix=/usr
#make VIMRUNTIMEDIR=/usr/share/vim/vim74
make -j8
sudo make install
cd -

# use vim as default editor
sudo update-alternatives --install /usr/bin/editor editor /usr/bin/vim 1
sudo update-alternatives --set editor /usr/bin/vim
sudo update-alternatives --install /usr/bin/vi vi /usr/bin/vim 1
sudo update-alternatives --set vi /usr/bin/vim

# install vundle
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle

# now for YCM
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 15CF4D18AF4F7421
echo "deb http://llvm.org/apt/wheezy/ llvm-toolchain-wheezy main"> /etc/apt/sources.list.d/llvm.list
sudo apt-get update
sudo apt-get install clang-3.5

# see also http://christopherpoole.github.io/setting-up-vim-with-YouCompleteMe/
git clone https://github.com/Valloric/YouCompleteMe.git ~/.vim/bundle/YouCompleteMe
cd ~/.vim/bundle/YouCompleteMe
git submodule update --init --recursive
./install.sh --clang-completer

# done!
vim +BundleInstall +qall

