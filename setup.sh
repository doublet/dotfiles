#/bin/bash

cd # go to ~
curl -L http://install.ohmyz.sh | sh # install oh-my-zsh

clear

cd - # go back to repo root
cd dotfiles
for FILE in *
do
  if [ -f ~/.${FILE} ]; then
    mv ~/.${FILE} ../old_files/${FILE}
    echo "Backed up ~/.${FILE}"
  fi
  cp -r ${FILE} ~/.${FILE}
  echo "Created ~/.${FILE}"
done

