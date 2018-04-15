##!/usr/bin/env bash
#set -x
#trap read debug
cd
screen -v > /root/scrt.txt
mkdir /var/log/sentinel
git clone https://github.com/coolblock/vpsVIVO.git
cd vpsVIVO/
#git checkout v1.0 
awk '{gsub("https://github.com/dashpay/sentinel.git", "https://github.com/vivocoin/sentinel.git", $0); print}' install.sh > outputx
mv install.sh install.bak
mv outputx install.sh
chmod +x install.sh
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
touch /root/installCompleted
reboot
