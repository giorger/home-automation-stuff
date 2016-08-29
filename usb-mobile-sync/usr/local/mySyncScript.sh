#!/bin/bash
# Change /tmp/tmp.lst to your log file. Can be completely ommited
# Change "02:06:30:61:37:31" to the MAC Address of your device (3 instances)

echo "Rule triggered" > /tmp/tmp.lst
echo "Checking if USB Tethering is activated..." >> /tmp/tmp.lst
while [ `ip link |grep -B1 02:06:30:61:37:31|head -1|awk -F':' '{print $2}'|awk -F' ' '{print $1}'|wc -l` -eq 0 ];
do
	echo "Awaiting USB tethering..." >> /tmp/tmp.lst
	sleep 2
done
echo "USB Tethering in place, setting IP"  >> /tmp/tmp.lst
ip link set `ip link |grep -B1 02:06:30:61:37:31|head -1|awk -F':' '{print $2}'|awk -F' ' '{print $1}'` up 2>&1 >> /tmp/tmp.lst 
dhclient `ip link |grep -B1 02:06:30:61:37:31|head -1|awk -F':' '{print $2}'|awk -F' ' '{print $1}'` 2>&1 >> /tmp/tmp.lst
echo "Done" >> /tmp/tmp.lst
