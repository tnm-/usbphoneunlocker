usbphoneunlocker
================

Unlocks ubuntu based dekstops upon attaching phone via usb, lock desktop upon removal

This is a shell script, which unlocks your desktop (if you have previously logged in to that session)
by checkin every 3 seconds for connected usb-devices and filters for a specific device and check if that device has the specific device id.

You have to modify the script to your own device. I don't plan to make this script more flexible, I might do an autosetup script, but it's not a priority for me. You also have to make sure the script is launched upon session start (add it to bash.rc for example).

Obviously this isn't a production quality software, this is just quick solution to a problem I ran into and copy-pasted (and edited) already available scripts found on the net.


