#!/bin/bash
#Usage: synclist.sh {"URL" "URL" "URL"...} (--shuffle)
OUT=""
SHUFFLE=0
#get all urls and check for shuffle param
for item in $@
do
  if [[ "$item" == *http* ]]
  then
  OUT="$OUT""$(youtube-dl -j --flat-playlist "$item" | jq -r '.id' | sed 's_^_https://youtu.be/_')""\n"
  elif [[ "$item" == "--shuffle" ]]
  then
          SHUFFLE=1
  fi
done
#remove dupes
echo -e "$OUT" > /tmp/synclist
OUT="$(echo "$(uniq /tmp/synclist)")"
if [[ $SHUFFLE == 1 ]]
then
        OUT="$(shuf /tmp/synclist)"
fi

echo -e "$OUT"
