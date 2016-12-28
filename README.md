# Asus E200HA Linux Post Install Script
A Linux Post install script for The Asus E200HA and other Intel Cherry Trail Devices

##Update: Trackpad Gestures now Working!

###Audio still not functional but as of 9 December it seems Connexant is going to release one. If so, this page will be updated....

#### The Following was Tested on Ubuntu 16.10 x64, Linux Kernel 4.8.0

  - If you test it on your own device/distro/kernel, send me a message/pull request!

### Features of This Script:
  - Working Trackpad + Gestures (Left/Right Click, Scrolling, 4 Fingers Left/Right, possibly more)
    - Credits go to vlasenko on GitHub
  - Disables Sleep/Hibernation
    - This is still an issue with the Linux Kernel and Cherry Trail Devices, this prevents the laptop from hanging upon waking up. Luckly, when you close the lid, it locks the laptop and turns the screen off, consuming little power.
  - Optional exFAT and NTSC Support - Only part of "Full" script, not part of minimal
  - Generic Script without Trackpad driver for any other Cherry Trail Device


##Optional:

Debian.org recommends that you add the "discard" and "noatime" options for every partition on any eMMC Storage Device (like our little CherryTrail devices).

You can do this by typing:

```sudo nano /etc/fstab" and adding "discard,noatime```
on every fourth column for the different partitions you may have.
Most likely, this just means you should edit the line for your root or "/" partition and edit the line right before ```errors=remount-ro 0``` so that it looks like this:
```discard,noatime,errors=remount-ro 0```

If you'd like to incorporate this into the main script, send me a pull request, it just sounded like more work to script than it was worth, but I'm open to contributions.
