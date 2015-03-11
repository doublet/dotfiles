#!/bin/bash
# sets up ~/bin directory for user scripts

echo "-- Setting up ~/bin"

mkdir -p ~/bin # create ~/bin if not exists

CURRENT_DIR=`pwd`

cd bin
for FILE in *
do
  rm ~/bin/${FILE}
  ln -s ${CURRENT_DIR}/bin/${FILE} ~/bin/${FILE}
  echo "ln -s ${CURRENT_DIR}/scripts/${FILE} ~/bin/${FILE}"
done

cd -

