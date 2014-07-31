sudo apt-get update
sudo apt-get install zsh
chsh zsh

if [ -f ./README.md ]; then
  echo "No README.md found. Assuming you haven't cloned the repo."
  echo "Checking for git..."
  command -v git
  GIT_NOT_INSTALLED=$?
  if [ GIT_NOT_INSTALLED ];
  then
    echo "Git was not found. Installing..."
    sudo apt-get install git
  fi
  echo "Cloning repo into ~/.dotfiles and continuing from there..."
  git clone https://github.com/doublet/dotfiles.git ~/.dotfiles
  ~/.dotfiles/deploy_debian.sh
else
  echo "README.md was found. Assuming you have cloned the repo in this directory."
  echo "NOTE: you might want to update this repo periodically. To do so:"
  echo "   $ git pull"
  echo ""
  echo "Updating mirrorlist..."
  sudo apt-get update
  echo "Installing zsh..."
  sudo apt-get install zsh
  echo "Changing login shell to zsh..."
  chsh zsh
  echo "Installing oh-my-zsh..."
  curl -L http://install.ohmyz.sh | sh
  clear
  echo "Installed required packages. Now going to install dotfiles..."
  ./copy.sh
fi

