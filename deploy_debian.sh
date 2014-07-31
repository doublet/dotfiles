#/bin/bash

echo "Updating mirrorlist..."
sudo apt-get update
echo "Installing all required packages..."
sudo apt-get install zsh vim git
echo "Setting zsh as default shell..."
chsh -s zsh

if [ -f ./README.md ]; then
  echo "README.md was found. Assuming you have cloned the repo in this directory."
  echo "NOTE: you might want to update this repo periodically. To do so:"
  echo "   $ git pull"
  echo ""
  echo "Installing oh-my-zsh..."
  sudo apt-get install curl -y
  curl -L http://install.ohmyz.sh | sh
  clear
  echo "Installed required packages. Now going to install dotfiles..."
  ./copy_headless.sh
else
  echo "No README.md found. Assuming you haven't cloned the repo."
  echo "Cloning repo into ~/.dotfiles and continuing from there..."
  git clone https://github.com/doublet/dotfiles.git ~/.dotfiles
  cd ~/.dotfiles
  ~/.dotfiles/deploy_debian.sh

fi

