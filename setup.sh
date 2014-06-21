#/bin/bash

echo " -- Installing oh-my-zsh..."
cd # go to ~
curl -L http://install.ohmyz.sh | sh # install oh-my-zsh

clear

NOW=`date "+%s"` # used for backing up
echo " -- Backing up and copying new files..."
echo " -- Backup location: ./old_files/${NOW}"
cd - # go back to repo root
cd dotfiles
mkdir ../old_files
mkdir ../old_files/${NOW}
for FILE in *
do
  if [ -f ~/.${FILE} ]; then
    mv ~/.${FILE} ../old_files/${NOW}/${FILE}
    echo "Backed up ~/.${FILE}"
  fi
  cp -r ${FILE} ~/.${FILE}
  echo "Created ~/.${FILE}"
done

echo " -- Recompiling xmonad.hs..."
xmonad --recompile


