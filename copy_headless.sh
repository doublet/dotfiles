#/bin/bash
# This file is meant for headless installs (no X server), thus without a window manager

export DOTFILES_DIR=$(pwd)

./scripts/zsh.sh

clear

cd $DOTFILES_DIR

./scripts/backup.sh
./scripts/copy.sh

