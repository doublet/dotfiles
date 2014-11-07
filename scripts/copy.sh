#!/bin/bash
# This file copies new files to ~

echo " -- Copying new files..."

cd dotfiles
for FILE in *
do
  if [ -d "${FILE}" ]; then
    cp -r ${FILE}/* ~/.${FILE}
  else
    cp -r ${FILE} ~/.${FILE}
  fi
  echo "Created ~/.${FILE}"
done

