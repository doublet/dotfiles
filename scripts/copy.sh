#!/bin/bash
# This file copies new files to ~

echo " -- Linking new files..."

CURRENT_DIR=`pwd`

cd dotfiles
for FILE in *
do
  rm ~/.${FILE}
  ln -s ${CURRENT_DIR}/dotfiles/${FILE} ~/.${FILE}
  echo "ln -s ${CURRENT_DIR}/dotfiles/${FILE} ~/.${FILE}"
done

