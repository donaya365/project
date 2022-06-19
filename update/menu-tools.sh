#!/bin/bash
clear

x="ok"

cekray=`cat /root/log-install.txt | grep -ow "XRAY" | sort | uniq`
if [ "$cekray" = "XRAY" ]; then
kjj='xray'
else
kjj='v2ray'
fi
[[ -f /etc/ontorrent ]] && sts="\033[0;32mON \033[0m" || sts="\033[1;31mOFF\033[0m"

enabletorrent() {
[[ ! -f /etc/ontorrent ]] && {
sudo iptables -A FORWARD -m string --string "get_peers" --algo bm -j DROP
sudo iptables -A FORWARD -m string --string "announce_peer" --algo bm -j DROP
sudo iptables -A FORWARD -m string --string "find_node" --algo bm -j DROP
sudo iptables -A FORWARD -m string --algo bm --string "BitTorrent" -j DROP
sudo iptables -A FORWARD -m string --algo bm --string "BitTorrent protocol" -j DROP
sudo iptables -A FORWARD -m string --algo bm --string "peer_id=" -j DROP
sudo iptables -A FORWARD -m string --algo bm --string ".torrent" -j DROP
sudo iptables -A FORWARD -m string --algo bm --string "announce.php?passkey=" -j DROP
sudo iptables -A FORWARD -m string --algo bm --string "torrent" -j DROP
sudo iptables -A FORWARD -m string --algo bm --string "announce" -j DROP
sudo iptables -A FORWARD -m string --algo bm --string "info_hash" -j DROP
sudo iptables-save > /etc/iptables.up.rules
sudo iptables-restore -t < /etc/iptables.up.rules
sudo netfilter-persistent save >/dev/null 2>&1
sudo netfilter-persistent reload >/dev/null 2>&1
touch /etc/ontorrent
setting-menu
} || {
sudo iptables -D FORWARD -m string --string "get_peers" --algo bm -j DROP
sudo iptables -D FORWARD -m string --string "announce_peer" --algo bm -j DROP
sudo iptables -D FORWARD -m string --string "find_node" --algo bm -j DROP
sudo iptables -D FORWARD -m string --algo bm --string "BitTorrent" -j DROP
sudo iptables -D FORWARD -m string --algo bm --string "BitTorrent protocol" -j DROP
sudo iptables -D FORWARD -m string --algo bm --string "peer_id=" -j DROP
sudo iptables -D FORWARD -m string --algo bm --string ".torrent" -j DROP
sudo iptables -D FORWARD -m string --algo bm --string "announce.php?passkey=" -j DROP
sudo iptables -D FORWARD -m string --algo bm --string "torrent" -j DROP
sudo iptables -D FORWARD -m string --algo bm --string "announce" -j DROP
sudo iptables -D FORWARD -m string --algo bm --string "info_hash" -j DROP
sudo iptables-save > /etc/iptables.up.rules
sudo iptables-restore -t < /etc/iptables.up.rules
sudo netfilter-persistent save >/dev/null 2>&1
sudo netfilter-persistent reload >/dev/null 2>&1
rm -f /etc/ontorrent
menu-tools
}
}

while true $x != "ok"
do

echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "\E[41;1;39m                ⇱ SETTINGS  MENU ⇲                \E[0m"
echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "\033[1;33mSettings\033[0m :

[\033[0;32m01\033[0m] • Add/Change VPS Host Subdomain
[\033[0;32m02\033[0m] • Add Subdomain to Cloudflare
[\033[0;32m03\033[0m] • Add Pointing Bug
[\033[0;32m04\033[0m] • Renew Certificate $kjj
[\033[0;32m05\033[0m] • Change Banner VPS
[\033[0;32m06\033[0m] • Speedtest Vps
[\033[0;32m07\033[0m] • Limit Bandwidth Speed Server
[\033[0;32m08\033[0m] • MENU AUTO BACKUP
[\033[0;32m100\033[0m] • Restart All Service
[\033[0;32m101\033[0m] • Disable Torrent $sts
[\033[0;32m102\033[0m] • Ram Cache Cleaner

[00] • Back to Main Menu \033[1;32m<\033[1;33m<\033[1;31m<\033[1;31m"
echo ""
echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo ""
echo -ne "Select menu : "; read x

case "$x" in 
   1 | 01)
   clear
   addhost
   break
   ;;
   2 | 02)
   clear
   cloudflare-setting
   break
   ;;
   3 | 03)
   clear
   cloudflare-pointing
   break
   ;;
   4 | 04)
   clear
   certv2ray
   break
   ;;
   5 | 05)
   clear
   banner
   break
   ;;
   6 | 06)
   clear
   speedtest
   break
   ;;
   7 | 07)
   clear
   limitspeed
   break
   ;;
   8 | 08)
   autobackup
   ;;
   100)
   clear
   restart
   break
   ;;
   101)
   clear
   enabletorrent
   break
   ;;
   102)
   echo 3 > /proc/sys/vm/drop_caches && swapoff -a && swapon -a && printf '\n%s\n' 'Ram Cache Cleared'
   setting-menu
   break
   ;;
   0 | 00)
   clear
   menu
   break
   ;;
   *)
   clear
esac
done
#fim
