#!/bin/bash
DELAY=.2
while true
do
   BUTTONSTATE=$(xset q | grep Num) #This is for Numlock
#  BUTTONSTATE=$(xinput --query-state 11 | grep button.8. )
   if [[ "$BUTTONSTATE" == *"Num Lock:    on"* ]]
#  if [[ "$BUTTONSTATE" == *"down" ]]
    then
     xdotool key space
#     xdotool click 1
#    echo "Key is working!"
   fi
  sleep $DELAY
done

