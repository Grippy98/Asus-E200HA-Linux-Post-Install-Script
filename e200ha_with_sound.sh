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

#Now let's cleanup the files so we save space. 
cd ..
cd ..
sudo rm -r kernel
sudo rm kernel.zip

#Now let's take care of Linux Cherry Trail Suspend Issues by disabling Sleep/Hybernation
sudo systemctl mask sleep.target suspend.target hibernate.target hybrid-sleep.target #Disable Suspend, broken on CherryTrail
sudo sh -c 'echo -e "[Login]\nHandleLidSwitch=ignore\nHandleLidSwitchDocked=ignore" >> /etc/systemd/logind.conf' #Disable Sleep/Hybernate when Lid is Closed

#Let's now install tlp and thermald to save you some battery life
sudo apt-get install tlp thermald -y

#Now Let's Enable Trackpad Gestures
sudo apt-get install git -y
git clone https://github.com/vlasenko/hid-asus-dkms.git
cd hid-asus-dkms
#It is normal if the trackpad stops working until you reboot after this step, happened to me. Will work once it's rebooted
sudo apt-get install dkms -y
sudo ./dkms-add.sh

#Now clean that up too
cd ..
rm -r hid-asus-dkms

#Now prompt the user and reboot
echo "It's normal if Trackpad stops working now, system will reboot in 15 seconds, trackpad should work once rebooted"
sleep 15 #wait 15 seconds
sudo reboot now #Reboot to reenable Trackpad
