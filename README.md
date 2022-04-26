Please note this repository is archived as I no longer have the time to actively maintain it. Thank you all who helped contribute and have enjoyed using it on your laptop. 

Best,
Andrei

# Asus E200HA and X206HA Linux Post Install Script
A Linux Post install script for The Asus E200HA, X206HA and other Intel Cherry Trail Devices.

**Note as of 20 September 2017** Due to time constraints with school on my part, I no longer have time to keep up with bug fixes and compiling new kernel versions from Takashi as they become availeable. That being said, the current version of the script (despite using a larger than needed kernel (storage wise)) works quite well enough and should get most everyone going who wants to use Linux on these laptops. It looks like the required kernel patches will soon be incorporated into the mainline kernel so this script shouldn't be needed for much longer. 

That being said it will still be availeable and myself (and the people watching the Repo) will do our best to answer any questions and keep it updated. 

If there are any major developments that you believe should be implemented into the script (including new Kernel developments) please don't hesitate to create an issue or e-mail me directly and I will do my best to integrate it.

Best of luck!
- Andrei

**If Wireless networking stops working for whatever reason (mostly after going to sleep)**

Use: ```sudo service network-manager restart``` to restart the network manager service (thanks to matt32106) for pointing this out

## How To Install:

#### On The Asus E200HA or X206HA:

1. Download the script you want to use from GitHub (such as e200ha_with_sound.sh),  navigate to the page where you downloaded it, such as **```cd /Downloads```**

2. Give the script execution permissions: **```sudo chmod u+x e200ha_with_sound.sh```**

3. Run the script: **```sudo ./e200ha_with_sound.sh```**

This will take a while as it will download a new version of the kernel and install it (600+MB currently)

Please note that this is an experimental build of the kernel and an experimental build of the sound driver. As such you are on your own if you experience any issues or even damage your device, there are no reports of this happening, but be careful nonetheless. 

Note: The current version of the Linux Kernel being installed is 4.12-rc6. 

**Thank you to Takashy Iwai and Pierre-Louis Bossart and Simon Ho for all of their hard work on the patch.** 

**BUG WARNING** : Currently this works nearly perfectly on Ubuntu 16.10 or newer. If you are using a different distro or 16.04, your sound will cut out after playing for a few seconds. If you find you are having issues, please upgrade to Ubuntu 16.10 or 17.04 as it's the only verified configuration. Your choice of desktop environment could cause sound to stop working. 

  - If you test it on your own device/distro/kernel, send me a message/pull request!

---

#### To Install for Generic  Cherry Trail Based Devices (lacks most improvements, including kernel):

Download this script from GitHub, navigate to the page where you downloaded it, such as **```cd /Downloads```**

Execute the following commands (requires superuser privileges):

**```sudo chmod u+x CherryTrailGeneric.sh```**

**```sudo ./CherryTrailGeneric.sh```**

## Features of This Script:

  - **Enables Sound** (Some issues remain but stable for the most part)
  
  - **Enables Keyboard if not initially working after fresh distro install** External keyboard may be required at first, reboot required after script runs.
   
  - **Working Trackpad + Gestures** (Left/Right Click, Scrolling, 4 Fingers Left/Right, possibly more)
    - Credits go to [vlasenko](https://github.com/vlasenko/hid-asus-dkms) on GitHub for his Asus DKMS Driver
  - **Disables Sleep/Hibernation** (Prevents freezes when computer starts up again, lid is reopened)
    - This is still an issue with the Linux Kernel and Cherry Trail Devices, this prevents the laptop from hanging upon waking up. Luckly, when you close the lid, it locks the laptop and turns the screen off, consuming little power.
  - Installs **tlp** and **thermald** tools to help save battery power long term. Read up on them and learn to use them.
  - **Generic Script without Trackpad driver for any other Cherry Trail Device availeable**

### Still Broken:
  - MicroSD card reader (works for some, not others)
  - USB3 Flash Devices cause system hang if in USB3 mode and not USB2 (may no longer happen as of the latest kernel)

## Optional:

### Enabling exFAT Support:

If you want to use external USB Drives larger than 32GB in size, I use an external 128GB Samsung USB3 Disk.

This is a generic Linux issue but in order to be able to mount exFAT partitions, you must run the following:

**```sudo apt-get install exfat-fuse exfat-utils```**

You should now be able to mount exFAT drives.

### eMMC Conservation Settings

Debian.org recommends that you add the *"discard"* and *"noatime"* options for every partition on any eMMC Storage Device (like our little CherryTrail devices).

##### You can do this by typing:

##### ```sudo nano /etc/fstab```
and adding ```discard,noatime``` on every fourth column for the different partitions you may have.

Most likely, this just means you should edit the line for your root or "/" partition and edit the line right before ```errors=remount-ro 0``` so that it looks like this:
##### ```discard,noatime,errors=remount-ro 0```

If you'd like to incorporate this into the main script, send me a pull request, it just sounded like more work to script than it was worth, but I'm open to contributions.
