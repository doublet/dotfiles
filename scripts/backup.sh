#/bin/bash
# This file backs up old dotfiles (those in ~)

echo " -- Backing up and copying new files..."
echo " -- Backup location: ./old_files/${NOW}"

NOW=`date "+%s"` # used for backing up

cd dotfiles
mkdir -p ../old_files/${NOW}
for FILE in *
do
  if [ -f ~/.${FILE} ]; then
    mv ~/.${FILE} ../old_files/${NOW}/${FILE}
    echo "Backed up ~/.${FILE}"
  fi
done

