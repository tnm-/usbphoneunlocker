#!/bin/sh
# Script to automatically lock and unlock the computer when my usb pendrive is removed

LSUSB=`which usb-devices`

if [ -z $LSUSB ]; then
    echo "No lsusb command found. exiting.. \n"
    exit 1 #can't determine attached device
fi

prevOn=0

while :
do
    sleep 3
    # echo "Running in loop"
    # Check the USB drive

    USB=`usb-devices | grep -A2 HTC | grep Serial | cut -c18- | sha256sum | grep XXXXX_SUM_HERE_XXXXXXXXX` #this line you have to modify for sure

    if [ -n "${USB}" ] ; then
        # echo "USB Device: Device found"
        
        if [ $prevOn -eq 0 ] ; then # the device was not attached previously,so it must have been attached recently
            gnome-screensaver-command --deactivate
            #unlock desktop
        fi
        
        prevOn=1
        continue
    fi
    
    if [ $prevOn -eq 1 ] ; then 
        # USB Device Not Found, but was previously on
        gnome-screensaver-command --activate
    fi
    
    prevOn=0


done
