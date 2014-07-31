#/bin/bash

export DOTFILES_DIR=$(pwd)

./scripts/zsh.sh

clear

cd DOTFILES_DIR

./scripts/backup.sh
./scripts/copy.sh

./scripts/xmonad.sh

