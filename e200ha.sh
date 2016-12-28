

#First let's take care of Linux Cherry Trail Suspend Issues by disabling Sleep/Hybernation
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

echo "It's normal if Trackpad stops working now, system will reboot in 15 seconds, trackpad should work once rebooted"
sleep 15 #wait 15 seconds
sudo reboot now #Reboot to reenable Trackpad
