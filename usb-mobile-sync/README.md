# Deployment
We are assuming that Syncthing is already deployed and configured between the two actors (mobile & home server).
Below is a one time setup. Post conducting it the first time, it is enough to plug-in and unplug your device

## Linux Server
Conduct the below as root:

1.   Place file "99-syncdevices.rules" into /etc/udev/rules.d
2.  Plugin your Android device via USB and execute "lsusb" on the Linux Server. Please note the following " ID 0781:5567" from the output. The first 4 characters denote  the vendor, the second four denote the product
3.  Edit "99-syncdevices.rules" and replace with the values collected in step (2)
4.  Place file "mySyncScript.sh" into /usr/local
5.  On the Android device, navigate to settings->other networks->USB tethering and enable it
6.  On the linux server, execute 'ip addr' and find the line with "usb0". Note the MAC address from the line below (i.e 05:46:30:21:27:32)
7.  Edit "mySyncScript.sh" and replace the existing MAC address with the one you ahve collected from step (6)
8.  Execute "service restart udev"

## Android Device
1.  Disconnect USB from Linux Server
2.  Deploy [Automate] ( https://play.google.com/store/apps/details?id=com.llamalab.automate)
3.  Import the usb-mobile-sync.flo and start it
4.  Navigate to "Syncthing" and change the address of the server to whom you want to sync with, to be "tcp://192.168.47.71:22000" (of course adjust the port according to your configuration)

Done :-)
