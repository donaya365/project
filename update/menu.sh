#!/bin/bash
GREEN='\033[0;32m'
NC='\e[0m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
NC='\033[0m'
yl='\e[32;1m'
bl='\e[36;1m'
gl='\e[32;1m'
rd='\e[31;1m'
mg='\e[0;95m'
blu='\e[34m'
op='\e[35m'
or='\033[1;33m'
bd='\e[1m'
color1='\e[031;1m'
color2='\e[34;1m'
color3='\e[0m'
clear

echo -e ""
ISP=$(curl -s ipinfo.io/org | cut -d " " -f 2-10 )
DOMAIN=$(cat /etc/xray/domain)
MYIP=$(curl -s ipinfo.io/ip )
CITY=$(curl -s ipinfo.io/city )
up=$(uptime|awk '{ $1=$2=$(NF-6)=$(NF-5)=$(NF-4)=$(NF-3)=$(NF-2)=$(NF-1)=$NF=""; print }')
tram=$( free -m | awk 'NR==2 {print $2}' )
echo -e ""
echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m${NC}"
echo -e "\E[41;1;39m                   ⇱ REMOD BY WAAN PROJECT ⇲                    \E[0m"
echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m${NC}"
echo -e " 💠$bd DOMAIN             ${color1} •${color3}$bd $DOMAIN"
echo -e " 💠$bd IP VPS             ${color1} •${color3}$bd $MYIP"
echo -e " 💠$bd TOTAL RAM          ${color1} •${color3}$bd $tram MB"
echo -e " 💠$bd ISP NAME           ${color1} •${color3}$bd $ISP"
echo -e " 💠$bd CITY               ${color1} •${color3}$bd $CITY"
echo -e " 💠$bd WAKTU AKTIF        ${color1} •${color3}$bd $up"
echo -e " 💠$bd REMOD              ${color1} •${color3}$bd Waan Project"
echo -e " 💠$bd OPERATING SYSTEM   ${color1} •${color3}$bd Debian GNU/Linux"
echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m${NC}"
echo -e "\E[41;1;39m                     ⇱ MENU  OPTIONS ⇲                        \E[0m"
echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m${NC}"
echo -e "
[${green}01${NC}]${color1} •${color3}$bd PANEL : SSH & OPENVPN (${color2}menu-ssh${color3})$NC
[${green}02${NC}]${color1} •${color3}$bd PANEL : WIREGUARD (${color2}menu-wireguard${color3})$NC
[${green}03${NC}]${color1} •${color3}$bd PANEL : L2TP & PPTP (${color2}menu-l2tp-pptp${color3})$NC
[${green}04${NC}]${color1} •${color3}$bd PANEL : VMESS & VLESS (${color2}menu-v2ray${color3})$NC
[${green}05${NC}]${color1} •${color3}$bd PANEL : SSR & SS (${color2}menu-ssr-ss${color3})$NC
[${green}06${NC}]${color1} •${color3}$bd PANEL : TROJAN GFW & GO (${color2}menu-trojan${color3})$NC
[${green}07${NC}]${color1} •${color3}$bd CHANGE PORT TUNNEL (${color2}menu-port${color3})$NC
[${green}08${NC}]${color1} •${color3}$bd CEK STATUS SERVICE (${color2}running${color3})$NC
[${green}09${NC}]${color1} •${color3}$bd MENU TOOLS (${color2}tools${color3})$NC
[${green}10${NC}]${color1} •${color3}$bd WEBMIN MENU (${color2}webmin${color3})$NC
[${green}11${NC}]${color1} •${color3}$bd INFO SCRIPT AUTO INSTALL (${color2}info${color3})$NC

[${green}00${NC}]${color1} •${color3}$bd Back to exit Menu \033[1;32m<\033[1;33m<\033[1;31m<\033[1;31m"
echo ""
echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m${NC}"
echo -e "\E[41;1;39m                       ⇱ WAAN PROJECT ⇲                       \E[0m"
echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m${NC}"
echo -e  ""
 read -p "  Select menu :  " menu
echo -e   ""
case $menu in
1)
ssh
;;
2)
wgr
;;
3)
l2tp
;;
4)
v2raay
;;
5)
ssssr
;;
6)
trojaan
;;
7)
changeport
;;
8)
running
;;
9)
menu-tools
;;
10)
wbmn
;;
11)
info
;;
0 | 00)
menu
;;
*)
exit
;;
esac
