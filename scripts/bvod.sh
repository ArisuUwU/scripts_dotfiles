#!/bin/bash
QUALITY="720p"
LINK=$(youtube-dl --get-url -f $QUALITY $1) || echo "Requested quality unavailable"; LINK=$(youtube-dl --get-url -f best $1)
echo "Unmuting Twitch Vod"
LINK=$(echo $LINK | sed s/-muted-.*/.m3u8/)
mpv $LINK
