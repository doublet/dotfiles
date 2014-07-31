#/bin/bash

sudo apt-get update
sudo apt-get install zsh
chsh zsh

if [ -f ./README.md ]; then
  echo "README.md was found. Assuming you have cloned the repo in this directory."
  echo "NOTE: you might want to update this repo periodically. To do so:"
  echo "   $ git pull"
  echo ""
  echo "Updating mirrorlist..."
  sudo apt-get update
  echo "Installing zsh..."
  sudo apt-get install zsh -y
  echo "Changing login shell to zsh..."
  chsh -s zsh
  echo "Installing oh-my-zsh..."
  sudo apt-get install curl -y
  curl -L http://install.ohmyz.sh | sh
  clear
  echo "Installed required packages. Now going to install dotfiles..."
  ./copy_headless.sh
else
    echo "No README.md found. Assuming you haven't cloned the repo."
  echo "Checking for git..."
  command -v git
  GIT_NOT_INSTALLED=$?
  if [ GIT_NOT_INSTALLED ];
  then
    echo "Git was not found. Installing..."
    sudo apt-get install git -y
  fi
  echo "Cloning repo into ~/.dotfiles and continuing from there..."
  git clone https://github.com/doublet/dotfiles.git ~/.dotfiles
  cd ~/.dotfiles
  ~/.dotfiles/deploy_debian.sh

fi

