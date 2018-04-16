apt-get install -y screen
apt install -y git
cp * /root/
cd
cat finaltemplate.conf > finalVivo.conf
cat finalPrivateKey1.txt >> finalVivo.conf
chmod +x *.sh
chmod -x *.conf
screen -S tf2 /root/firstInstallStep.sh $1

