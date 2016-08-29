# home-automation-stuff
Contains certain scripts from various targets offering some home automation

## usb-mobile-sync: Automatic synchronization between mobile and workstation
Reason: There is no WiFi available (or not allowed to use WiFi) and you need to synchronize your Android mobile with a workstation/home server

###Solution Components
- Linux server
- Android ADB deployed on Linux server
- Synchronization offered by [Syncthing](https://syncthing.net), deployed on Linux server and on Android mobile device
- [Automate] (https://play.google.com/store/apps/details?id=com.llamalab.automate) deployed on Android mobile device

###End user flow
1. Linux server is up and running, where "Syncthing" is also running
2. Android (no root required) device plugs in via USB to the Linux server
3. Synchronization starts

####End user flow details
We are taking advantage of the USB tethering feature as per below:
- On Linux server: Via "udev" we create a rule to execute a script when our device gets connected. As soon as "USB Tethering" is enabled on the mobile device the script is bringing up the usb network interface and triggers dhcp client in order to receive 
- On Mobile device: Via the Automate flow, we are capturing the usb connection event and we (a) enable usb tethering and (b) start syncthing. On the contrary, when we disconnect the usb cable syncthing is also switched off to save some battery
