#Let's get sound working
sudo apt-get update
sudo apt-get install unzip -y
wget "https://github.com/Grippentech/Asus-E200HA-Linux-Post-Install-Script/releases/download/0.1/kernel.zip"
unzip kernel.zip
cd kernel
sudo dpkg -i *.deb
tar -xvf chtcx2072x.tar
cd chtcx2072x
mkdir /usr/share/alsa/ucm/chtcx2072x/
mv chtcx2072x.conf /usr/share/alsa/ucm/chtcx2072x/
mv HiFi.conf /usr/share/alsa/ucm/chtcx2072x/
