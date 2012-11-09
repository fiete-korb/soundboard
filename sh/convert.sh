#! /bin/bash
URL=$1
CODEA=$(curl "http://www.youtube-mp3.org/api/pushItem/?item=$URL&xy=yx")
CODEB=$(curl "http://www.youtube-mp3.org/api/itemInfo/?video_id=$CODEA" | awk '{ sub(/.*"h" : "/, ""); sub(/" };.*/, ""); print }' |cut -c 1-32)
TITLE=$(youtube-dl -e $URL | tr -d ' '| sed 's/ *$//g'| sed 's/^ *//g')
wget "http://www.youtube-mp3.org/get?video_id=$CODEA&h=$CODEB" -O /var/www/Soundboard/sounds/youtube/"$TITLE.mp3"
echo "/var/www/Soundboard/sounds/youtube/$TITLE.mp3" 
exit 0
