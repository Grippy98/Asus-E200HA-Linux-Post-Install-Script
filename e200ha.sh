sudo apt-get update
sudo apt-get upgrade -y
sudo apt-get dist-upgrade -y
sudo apt autoremove 

#First let's take care of Linux Cherry Trail Suspend Issues by disabling Sleep/Hybernation
sudo systemctl mask sleep.target suspend.target hibernate.target hybrid-sleep.target #Disable Suspend, broken on CherryTrail
sudo sh -c 'echo -e "[Login]\nHandleLidSwitch=ignore\nHandleLidSwitchDocked=ignore" >> /etc/systemd/logind.conf' #Disable Sleep/Hybernate when Lid is Closed

#Now let's fix Backlight Controls up and down
sudo touch /usr/share/X11/xorg.conf.d/20-intel.conf
sudo sh -c "{ echo 'Section "Device"
        Identifier  "card0"
        Driver      "intel"
        Option      "Backlight"  "intel_backlight"
        BusID       "PCI:0:2:0"
EndSection'; } >> /usr/share/X11/xorg.conf.d/20-intel.conf"

#Let's now install tlp and thermald to save you some battery life
sudo apt-get update
sudo apt-get install tlp thermald -y

#Change fstab a little bit for better eMMC support, eMMC Conservation settings
sudo sed -i -e 's/errors=remount-ro 0/discard,noatime,errors=remount-ro 0/g' /etc/fstab

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
