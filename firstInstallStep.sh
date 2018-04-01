##!/usr/bin/env bash
#set -x
#trap read debug
cd
screen -v > /root/scrt.txt
cat finaltemplate.conf > finalVivo.conf
cat finalPrivateKey1.txt >> finalVivo.conf
mkdir /var/log/sentinel
git clone https://github.com/coolblock/vpsVIVO.git
cd vpsVIVO/
#git checkout v1.0 
awk '{gsub("https://github.com/dashpay/sentinel.git", "https://github.com/vivocoin/sentinel.git", $0); print}' install.sh > outputx
mv install.sh install.bak
mv outputx install.sh
chmod +x install.sh
./install.sh -p vivo -n 4 -s
rm -f /etc/masternodes/vivo_n1.conf
/usr/local/bin/activate_masternodes_vivo
#cp /root/ /etc/masternodes/vivo_n1.conf
#copy proper conf file
chown -R masternode:masternode /root/finalVivo.conf
### next is final vivo
cp /root/finalVivo.conf /etc/masternodes/vivo_n1.conf  
#mkdir /home/masternode/.vivocore/
cd /home/masternode
#sudo apt-get update
#sudo apt-get install -y git python-virtualenv
#mkdir sentineldir
#cd sentineldir
#git clone https://github.com/coolblock/vivo_sentinel.git
#mv ./vivo_sentinel ./sentinel
#cd sentinel
#sudo apt-get install -y virtualenv
#virtualenv venv
#venv/bin/pip install -r requirements.txt
#rm sentinel.conf
#cp /root/sentinel.conf sentinel.conf
chown -R masternode:masternode /home/masternode/
(crontab -l 2>/dev/null; echo "* * * * * /root/runmultipleSentinel.sh") | crontab -
crontab -l

touch /root/installCompleted
reboot
