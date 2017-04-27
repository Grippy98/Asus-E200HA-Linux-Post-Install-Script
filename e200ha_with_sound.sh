#Let's get sound working
sudo apt-get update
sudo apt-get install unzip -y
wget "https://github.com/Grippentech/Asus-E200HA-Linux-Post-Install-Script/releases/download/0.1/kernel.zip"
unzip kernel.zip
cd kernel
sudo dpkg -i *.deb
tar -xvf chtcx2072x.tar
cd chtcx2072x
sudo mkdir /usr/share/alsa/ucm/chtcx2072x/
sudo mv chtcx2072x.conf /usr/share/alsa/ucm/chtcx2072x/
sudo mv HiFi.conf /usr/share/alsa/ucm/chtcx2072x/

#Now let's take care of Linux Cherry Trail Suspend Issues by disabling Sleep/Hybernation
sudo systemctl mask sleep.target suspend.target hibernate.target hybrid-sleep.target #Disable Suspend, broken on CherryTrail
sudo sh -c 'echo -e "[Login]\nHandleLidSwitch=ignore\nHandleLidSwitchDocked=ignore" >> /etc/systemd/logind.conf' #Disable Sleep/Hybernate when Lid is Closed

#Let's now install tlp and thermald to save you some battery life
sudo apt-get install tlp thermald -y
#Change fstab a little bit for better eMMC support, eMMC Conservation settings
sed -i -e 's/errors=remount-ro 0/discard,noatime,errors=remount-ro 0/g' /etc/fstab
sleep 15 #wait 15 seconds
sudo reboot now #Reboot to reenable Trackpad
