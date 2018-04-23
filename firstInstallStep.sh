#!/usr/bin/env bash
set -x
trap read debug
cd
mkdir /var/log/sentinel
git clone https://github.com/coolblock/vpsVIVO.git
cd vpsVIVO/
#git checkout v1.0 
awk '{gsub("https://github.com/dashpay/sentinel.git", "https://github.com/vivocoin/sentinel.git", $0); print}' install.sh > outputx
mv install.sh install.bak
mv outputx install.sh
chmod +x install.sh
args=("$@")
echo Number of arguments: $#
echo 1st argument: ${args[0]}
echo 2nd argument: ${args[1]}
	if [ "${args[0]}" == "cb" ]; then
		sed -i 's!//github.com/vivocoin/vivo.git!//github.com/coolblock/vivo.git!' /root/vpsVIVO/config/vivo/vivo.env
		sed -i 's!SCVERSION="v0.12.1.7"!SCVERSION="master"!' /root/vpsVIVO/config/vivo/vivo.env
	
	fi
./install.sh -p vivo -n 4 -s
/usr/local/bin/activate_masternodes_vivo
chmod +x ~/runsentinelnolog.sh
chown -R masternode:masternode /root/finalVivo.conf
cd /home/masternode
chown -R masternode:masternode /home/masternode/
chown -R masternode:masternode /usr/share/sentinel
chown -R masternode:masternode /usr/share/sentinelvenv
if ! crontab -l | grep "/root/runmultipleSentinel.sh"; then
	(crontab -l 2>/dev/null; echo "* * * * * /root/runmultipleSentinel.sh") | crontab -
fi
apt -y install fail2ban
systemctl enable fail2ban
systemctl start fail2ban
sudo apt -y install rkhunter
chmod 755 /
chmod 755 /bin
chmod 755 /lib
cp /root/interfaces /etc/network/interfaces
touch /root/installCompleted
reboot
