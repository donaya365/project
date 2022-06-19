#!/bin/bash

red='\e[1;31m'
green='\e[0;32m'
yell='\e[1;33m'
tyblue='\e[1;36m'
NC='\e[0m'
purple() { echo -e "\\033[35;1m${*}\\033[0m"; }
tyblue() { echo -e "\\033[36;1m${*}\\033[0m"; }
yellow() { echo -e "\\033[33;1m${*}\\033[0m"; }
green() { echo -e "\\033[32;1m${*}\\033[0m"; }
red() { echo -e "\\033[31;1m${*}\\033[0m"; }
cd /root
#System version number
if [ "${EUID}" -ne 0 ]; then
		echo "You need to run this script as root"
		exit 1
fi
if [ "$(systemd-detect-virt)" == "openvz" ]; then
		echo "OpenVZ is not supported"
		
fi

localip=$(hostname -I | cut -d\  -f1)
hst=( `hostname` )
dart=$(cat /etc/hosts | grep -w `hostname` | awk '{print $2}')
if [[ "$hst" != "$dart" ]]; then
echo "$localip $(hostname)" >> /etc/hosts
fi

echo -e "[ ${tyblue}NOTES${NC} ] Before we go.. "
sleep 1
echo -e "[ ${tyblue}NOTES${NC} ] I need check your headers first.."
sleep 2
echo -e "[ ${green}INFO${NC} ] Checking headers"
sleep 1
  sleep 2
  echo -e "[ ${yell}WARNING${NC} ] Try to install ...."
  echo "No $REQUIRED_PKG. Setting up $REQUIRED_PKG."
  apt-get --yes install $REQUIRED_PKG
  sleep 1
  echo ""
  sleep 1
  echo -e "[ ${tyblue}NOTES${NC} ] If error you need.. to do this"
  sleep 1
  echo ""
  sleep 1
  echo -e "[ ${tyblue}NOTES${NC} ] 1. apt update -y"
  sleep 1
  echo -e "[ ${tyblue}NOTES${NC} ] 2. apt upgrade -y"
  sleep 1
  echo -e "[ ${tyblue}NOTES${NC} ] 3. apt dist-upgrade -y"
  sleep 1
  echo -e "[ ${tyblue}NOTES${NC} ] 4. reboot"
  sleep 1
  echo ""
  sleep 1
  echo -e "[ ${tyblue}NOTES${NC} ] After rebooting"
  sleep 1
  echo -e "[ ${tyblue}NOTES${NC} ] Then run this script again"
  echo -e "[ ${tyblue}NOTES${NC} ] if you understand then tap enter now"
  read


secs_to_human() {
    echo "Installation time : $(( ${1} / 3600 )) hours $(( (${1} / 60) % 60 )) minute's $(( ${1} % 60 )) seconds"
}
start=$(date +%s)
ln -fs /usr/share/zoneinfo/Asia/Jakarta /etc/localtime
sysctl -w net.ipv6.conf.all.disable_ipv6=1 >/dev/null 2>&1
sysctl -w net.ipv6.conf.default.disable_ipv6=1 >/dev/null 2>&1

coreselect=''
cat> /root/.profile << END
# ~/.profile: executed by Bourne-compatible login shells.

if [ "$BASH" ]; then
  if [ -f ~/.bashrc ]; then
    . ~/.bashrc
  fi
fi

mesg n || true
clear
screen -r setup
END
chmod 644 /root/.profile

echo -e "[ ${green}INFO${NC} ] Preparing the install file"
apt install git curl -y >/dev/null 2>&1
echo -e "[ ${green}INFO${NC} ] Aight good ... installation file is ready"
sleep 2

# ==========================================
# Color
RED='\033[0;31m'
NC='\033[0m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
LIGHT='\033[0;37m'
# ==========================================
# Link Hosting Kalian Untuk Ssh Vpn
akbarvpn="raw.githubusercontent.com/Donaya365/project/main/ssh"
# Link Hosting Kalian Untuk Sstp
akbarvpnn="raw.githubusercontent.com/Donaya365/project/main/sstp"
# Link Hosting Kalian Untuk Ssr
akbarvpnnn="raw.githubusercontent.com/Donaya365/project/main/ssr"
# Link Hosting Kalian Untuk Shadowsocks
akbarvpnnnn="raw.githubusercontent.com/Donaya365/project/main/shadowsocks"
# Link Hosting Kalian Untuk Wireguard
akbarvpnnnnn="raw.githubusercontent.com/Donaya365/project/main/wireguard"
# Link Hosting Kalian Untuk Xray
akbarvpnnnnnn="raw.githubusercontent.com/Donaya365/project/main/xray"
# Link Hosting Kalian Untuk Ipsec
akbarvpnnnnnnn="raw.githubusercontent.com/Donaya365/project/main/ipsec"
# Link Hosting Kalian Untuk Backup
akbarvpnnnnnnnn="raw.githubusercontent.com/Donaya365/project/main/backup"
# Link Hosting Kalian Untuk Websocket
akbarvpnnnnnnnnn="raw.githubusercontent.com/Donaya365/project/main/websocket"
# Link Hosting Kalian Untuk Ohp
akbarvpnnnnnnnnnn="raw.githubusercontent.com/Donaya365/project/main/ohp"
# Getting
MYIP=$(wget -qO- ipinfo.io/ip);
echo "Checking VPS"hi
IZIN=$(wget -qO- ipinfo.io/ip);

rm -f setup.sh
clear
if [ -f "/etc/xray/domain" ]; then
echo "Script Already Installed"
exit 0
fi
mkdir /var/lib/fsidvpn;
echo "IP=" >> /var/lib/fsidvpn/ipvps.conf
echo -e "[ ${green}INFO$NC ] Downloading & Configuration Domain"
sleep 3
wget https://${akbarvpn}/cf.sh >/dev/null 2>&1
chmod +x cf.sh >/dev/null 2>&1
./cf.sh >/dev/null 2>&1
#install v2ray
echo -e "[ ${green}INFO$NC ] Downloading & Installing xray/v2ray"
sleep 3
wget https://${akbarvpnnnnnn}/ins-xray.sh >/dev/null 2>&1
chmod +x ins-xray.sh >/dev/null 2>&1
screen -S xray ./ins-xray.sh >/dev/null 2>&1
#install ssh ovpn
echo -e "[ ${green}INFO$NC ] Downloading & Installing OpenVpn"
sleep 3
wget https://${akbarvpn}/ssh-vpn.sh >/dev/null 2>&1
chmod +x ssh-vpn.sh >/dev/null 2>&1
screen -S ssh-vpn ./ssh-vpn.sh >/dev/null 2>&1
#install sstp
echo -e "[ ${green}INFO$NC ] Downloading & Installing sstp"
sleep 3
wget https://${akbarvpnn}/sstp.sh >/dev/null 2>&1
chmod +x sstp.sh >/dev/null 2>&1
screen -S sstp ./sstp.sh >/dev/null 2>&1
#install ssr
echo -e "[ ${green}INFO$NC ] Downloading & Installing shadowsocks R"
sleep 3
wget https://autosc.me/ssr/ssr.sh >/dev/null 2>&1
chmod +x ssr.sh >/dev/null 2>&1
screen -S ssr ./ssr.sh >/dev/null 2>&1
echo -e "[ ${green}INFO$NC ] Downloading & Installing shadowsocks"
sleep 3
wget https://${akbarvpnnnn}/sodosok.sh >/dev/null 2>&1
chmod +x sodosok.sh >/dev/null 2>&1
screen -S ss ./sodosok.sh >/dev/null 2>&1
#installwg
echo -e "[ ${green}INFO$NC ] Downloading & Installing wireguard"
sleep 3
wget https://${akbarvpnnnnn}/wg.sh >/dev/null 2>&1
chmod +x wg.sh >/dev/null 2>&1
screen -S wg ./wg.sh >/dev/null 2>&1
#install L2TP
echo -e "[ ${green}INFO$NC ] Downloading & Installing l2tp"
sleep 3
wget https://${akbarvpnnnnnnn}/ipsec.sh >/dev/null 2>&1
chmod +x ipsec.sh >/dev/null 2>&1
screen -S ipsec ./ipsec.sh >/dev/null 2>&1
echo -e "[ ${green}INFO$NC ] Downloading & Installing autobackup"
sleep 3
wget https://${akbarvpnnnnnnnn}/set-br.sh >/dev/null 2>&1
chmod +x set-br.sh >/dev/null 2>&1
./set-br.sh >/dev/null 2>&1
# Websocket
echo -e "[ ${green}INFO$NC ] Downloading & Installing SSH Websocket"
sleep 3
wget https://${akbarvpnnnnnnnnn}/edu.sh >/dev/null 2>&1
chmod +x edu.sh >/dev/null 2>&1
./edu.sh >/dev/null 2>&1
# Ohp Server
echo -e "[ ${green}INFO$NC ] Downloading & Installing OHP"
sleep 3
wget https://${akbarvpnnnnnnnnnn}/ohp.sh >/dev/null 2>&1
chmod +x ohp.sh >/dev/null 2>&1
./ohp.sh >/dev/null 2>&1

rm -f /root/ssh-vpn.sh
rm -f /root/sstp.sh
rm -f /root/wg.sh
rm -f /root/ss.sh
rm -f /root/ssr.sh
rm -f /root/ins-xray.sh
rm -f /root/ipsec.sh
rm -f /root/set-br.sh
rm -f /root/edu.sh
rm -f /root/ohp.sh
rm -r -f domain
cat <<EOF> /etc/systemd/system/autosett.service
[Unit]
Description=autosetting
Documentation=https://t.me/fer1dev

[Service]
Type=oneshot
ExecStart=/bin/bash /etc/set.sh
RemainAfterExit=yes

[Install]
WantedBy=multi-user.target
EOF
systemctl daemon-reload
systemctl enable autosett
echo -e "[ ${green}INFO$NC ] Finnishing"
sleep 2
wget -O /etc/set.sh "https://${akbarvpn}/set.sh" >/dev/null 2>&1
chmod +x /etc/set.sh >/dev/null 2>&1
history -c
cat> /root/.profile << END
# ~/.profile: executed by Bourne-compatible login shells.

if [ "$BASH" ]; then
  if [ -f ~/.bashrc ]; then
    . ~/.bashrc
  fi
fi

mesg n || true
clear
importantfile
neofetch
END
chmod 644 /root/.profile

echo "1.2" > /home/ver
echo " "
echo "Installation has been completed!!"
echo " "
echo "╍╍╍╍╍╍╍╍╍╍╍╍AutoScript By ENVY Project╍╍╍╍╍╍╍╍╍╍╍╍" | tee -a log-install.txt
echo "" | tee -a log-install.txt
echo "××××××××××××××××××××××××××××××××××××××××××××××××××" | tee -a log-install.txt
echo ""  | tee -a log-install.txt
echo "   >>> Service & Port"  | tee -a log-install.txt
echo "   - OpenSSH                 : 22"  | tee -a log-install.txt
echo "   - OpenVPN                 : TCP 1194, UDP 2200, SSL 990"  | tee -a log-install.txt
echo "   - Stunnel5                : 443, 445, 777"  | tee -a log-install.txt
echo "   - Dropbear                : 109, 143 , 443"  | tee -a log-install.txt
echo "   - Squid Proxy             : 3128, 8080"  | tee -a log-install.txt
echo "   - Badvpn                  : 7100, 7200, 7300"  | tee -a log-install.txt
echo "   - Nginx                   : 89"  | tee -a log-install.txt
echo "   - Wireguard               : 7070"  | tee -a log-install.txt
echo "   - L2TP/IPSEC VPN          : 1701"  | tee -a log-install.txt
echo "   - PPTP VPN                : 1732"  | tee -a log-install.txt
echo "   - SSTP VPN                : 444"  | tee -a log-install.txt
echo "   - Shadowsocks-R           : 1443-1543"  | tee -a log-install.txt
echo "   - SS-OBFS TLS             : 2443-2543"  | tee -a log-install.txt
echo "   - SS-OBFS HTTP            : 3443-3543"  | tee -a log-install.txt
echo "   - XRAYS Vmess TLS         : 8443"  | tee -a log-install.txt
echo "   - XRAYS Vmess None TLS    : 80"  | tee -a log-install.txt
echo "   - XRAYS Vless TLS         : 8443"  | tee -a log-install.txt
echo "   - XRAYS Vless None TLS    : 80"  | tee -a log-install.txt
echo "   - XRAYS Trojan            : 2083"  | tee -a log-install.txt
echo "   - Websocket TLS           : 443"  | tee -a log-install.txt
echo "   - Websocket None TLS      : 8880"  | tee -a log-install.txt
echo "   - Websocket Ovpn          : 2086"  | tee -a log-install.txt
echo "   - OHP SSH                 : 8181"  | tee -a log-install.txt
echo "   - OHP Dropbear            : 8282"  | tee -a log-install.txt
echo "   - OHP OpenVPN             : 8383"  | tee -a log-install.txt
echo "   - Tr Go                   : 2087"  | tee -a log-install.txt
echo ""  | tee -a log-install.txt
echo "   >>> Server Information & Other Features"  | tee -a log-install.txt
echo "   - Timezone                : Asia/Jakarta (GMT +7)"  | tee -a log-install.txt
echo "   - Fail2Ban                : [ON]"  | tee -a log-install.txt
echo "   - Dflate                  : [ON]"  | tee -a log-install.txt
echo "   - IPtables                : [ON]"  | tee -a log-install.txt
echo "   - Auto-Reboot             : [ON]"  | tee -a log-install.txt
echo "   - IPv6                    : [OFF]"  | tee -a log-install.txt
echo "   - Autoreboot On 05.00 GMT +7" | tee -a log-install.txt
echo "   - Autobackup Data" | tee -a log-install.txt
echo "   - Restore Data" | tee -a log-install.txt
echo "   - Auto Delete Expired Account" | tee -a log-install.txt
echo "   - Full Orders For Various Services" | tee -a log-install.txt
echo "   - White Label" | tee -a log-install.txt
echo "   - Installation Log --> /root/log-install.txt"  | tee -a log-install.txt
echo ""  | tee -a log-install.txt
echo "   - Dev/Main                : Horas Marolop Amsal Siregar"  | tee -a log-install.txt
echo "   - Recode                  : envy Project" | tee -a log-install.txt
echo "   - Telegram                : https://t.me/zoldyckkkkkk"  | tee -a log-install.txt
echo "   - Instagram               : ~"  | tee -a log-install.txt
echo "   - Whatsapp                : +6285832227786"  | tee -a log-install.txt
echo "   - Facebook                : envy" | tee -a log-install.txt
echo "╍╍╍╍╍╍╍╍╍╍╍╍AutoScript By ENVY Project╍╍╍╍╍╍╍╍╍╍╍╍" | tee -a log-install.txt
echo ""
echo " Reboot 15 Sec"
sleep 15
echo ""
rm -f setup.sh
reboot
