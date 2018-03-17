apt-get install -y screen
git clone https://github.com/coolblock/vpsVIVO.git && cd vpsVIVO
cp * /root/*
cd
screen -S tf2 /root/firstInstallStep.sh

