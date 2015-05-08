#!/bin/bash

mixer=$(amixer get Master | grep 'Front Left:')

#echo $mixer | cut -d ' ' -f 4
#echo $mixer | cut -d ' ' -f 6

muted=$(amixer get Master | grep 'Front Left:' | cut -d ' ' -f 8)

if [ "$muted" == "[off]" ]; then
  echo "[--]"
else
  volume=$(echo $mixer | cut -d ' ' -f 4)
  expr $volume / 655
fi

