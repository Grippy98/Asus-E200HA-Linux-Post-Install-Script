# Asus E200HA Linux Post Install Script
A Linux Post install script for The Asus E200HA and other Intel Cherry Trail Devices

#### The Following was Tested on Ubuntu 16.10 x64, Linux Kernel 4.8.0

  - If you test it on your own device/distro/kernel, send me a message/pull request!

### Features of This Script:
---
  - **Working Trackpad + Gestures** (Left/Right Click, Scrolling, 4 Fingers Left/Right, possibly more)
    - Credits go to [vlasenko](https://github.com/vlasenko/hid-asus-dkms) on GitHub for his Asus DKMS Driver
  - **Disables Sleep/Hibernation** (Prevents freezes when computer starts up again, lid is reopened)
    - This is still an issue with the Linux Kernel and Cherry Trail Devices, this prevents the laptop from hanging upon waking up. Luckly, when you close the lid, it locks the laptop and turns the screen off, consuming little power.
  - Installs **tlp** and **thermald** tools to help save battery power long term. Read up on them and learn to use them.
  - **Generic Script without Trackpad driver for any other Cherry Trail Device**

### Still Broken:
  - Built-in Audio
  - Sandisk MicroSD cards

#####Note: The MicroSD card reader should work on any Kernel newer than 4.5 (use ```uname -a``` to check), but there is a current bug which means Sandisk cards are not detected. Talk about bizarre issues. If anybody had a fix for this, let me know. Other brand cards should work...

# To Install:

###On the E200HA:
---
Download this script from GitHub, navigate to the page where you downloaded it, such as **```cd /Downloads```**

And execute the following script (requires superuser privileges):

**```sudo chmod u+x e200ha.sh```**

**```sudo ./e200ha.sh```**

####Update: Trackpad Gestures now Working!

###On Other Cherry Trail Devices:
---
Download this script from GitHub, navigate to the page where you downloaded it, such as **```cd /Downloads```**

Execute the following commands (requires superuser privileges):

**```sudo chmod u+x CherryTrailGeneric.sh```**

**```sudo ./CherryTrailGeneric.sh```**

####Audio still not functional but as of 9 December it seems Connexant is going to release one. If so, this page will be updated....

##Optional:

###Enabling exFAT Support:

If you want to use external USB Drives larger than 32GB in size, I use an external 128GB Samsung USB3 Disk.

This is a generic Linux issue but in order to be able to mount exFAT partitions, you must run the following:

**```sudo apt-get install exfat-fuse exfat-utils```**

You should now be able to mount exFAT drives.

###eMMC Conservation Settings

Debian.org recommends that you add the *"discard"* and *"noatime"* options for every partition on any eMMC Storage Device (like our little CherryTrail devices).

####You can do this by typing:

#####```sudo nano /etc/fstab```
and adding ```discard,noatime``` on every fourth column for the different partitions you may have.

Most likely, this just means you should edit the line for your root or "/" partition and edit the line right before ```errors=remount-ro 0``` so that it looks like this:
#####```discard,noatime,errors=remount-ro 0```

If you'd like to incorporate this into the main script, send me a pull request, it just sounded like more work to script than it was worth, but I'm open to contributions.
