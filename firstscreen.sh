apt-get install -y screen
apt install -y git
cp * /root/
cd
chmod +x *.sh
chmod -x *.conf
screen -S tf2 /root/firstInstallStep.sh $1

