#install proper conf file on root 
cd
screen -v > /root/scrt.txt
mkdir /var/log/sentinel
git clone https://github.com/coolblock/vpsVIVO.git
cd vpsVIVO/
awk '{gsub("https://github.com/dashpay/sentinel.git", "https://github.com/vivocoin/sentinel.git", $0); print}' install.sh > outputx
mv install.sh install.bak
mv outputx install.sh
chmod +x install.sh
./install.sh -p vivo -n 4 
/usr/local/bin/activate_masternodes_vivo
rm -f /etc/masternodes/vivo_n1.conf
/usr/local/bin/activate_masternodes_vivo
#cp /root/ /etc/masternodes/vivo_n1.conf
#copy proper conf file
chown -R masternode:masternode /root/finalVivo.conf
cp /root/finalVivo.conf /etc/masternodes/vivo_n1.conf  
mkdir /home/masternode/.vivocore/

cd /home/masternode
sudo apt-get update
sudo apt-get install -y git python-virtualenv
mkdir sentineldir
cd sentineldir
git clone https://github.com/coolblock/vivo_sentinel.git && cd sentinel
sudo apt-get install -y virtualenv
virtualenv venv
venv/bin/pip install -r requirements.txt
rm sentinel.conf
cp /root/sentinel.conf sentinel.conf
chown -R masternode:masternode /home/masternode/
(crontab -l 2>/dev/null; echo "* * * * * /root/runsentinel.sh") | crontab -
crontab -l

touch /root/installCompleted
reboot
