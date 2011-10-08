--- 
layout: post
title: Installing Ubuntu Netbook Remix (with Jaunty) on an MSI Wind
wordpress_url: http://beta.timbroder.com/2009/02/25/installing-ubuntu-netbook-remix-with-jaunty-on-an-msi-wind/
date: 2009-02-25 20:51:00 -05:00
comments: true
tags: 
- howto
- ubuntu
- netbook
---
I recently picked up a MSI Wind Netbook and love the damn thing.  <a href="http://www.canonical.com/projects/ubuntu/unr">Ubuntu Netbook Remix</a> brings in a great UI which makes navigating on the small screen much easier.I used Ubuntu Jaunty Jackalope Alpha 4 as the base install, mainly because I didn't want to go through the trouble of converting my ext3 partitions to ext4 when it comes out on April 23rd, and the driver support is more complete.&nbsp; I haven't had many problems with it aside from a few random firefox crashes.<br />
<br />
<div class="separator" style="clear: both; text-align: center;"><a href="http://1.bp.blogspot.com/_Ng3QbVQfLZ8/SaWunIJBkfI/AAAAAAAAa7c/XG8CFukv18E/s1600-h/Screenshot1.png" imageanchor="1" style="margin-left: 1em; margin-right: 1em;"><img border="0" src="http://1.bp.blogspot.com/_Ng3QbVQfLZ8/SaWunIJBkfI/AAAAAAAAa7c/XG8CFukv18E/s320/Screenshot1.png" /></a></div><br />
<div class="separator" style="clear: both; text-align: center;"><a href="http://3.bp.blogspot.com/_Ng3QbVQfLZ8/SaYPBBQ2EmI/AAAAAAAAa74/DBWWqZQOEko/s1600-h/partitions.png" imageanchor="1" style="margin-left: 1em; margin-right: 1em;"><br />
</a></div><ol><li>We're going to make a bootable USB stick to install Ubuntu <br />
</li>
<li>On a separate machine, <a href="http://www.ubuntu.com/testing/jaunty/alpha4#Download%20Alpha%204">Download </a>the cd image.&nbsp; If you want to use 8.10, get the iso <a href="http://www.ubuntu.com/getubuntu/download">here</a>&nbsp;</li>
<li>if you are already using an Ubuntu install of 8.10 or higher, skip to step 11<br />
</li>
<li> burn the image to a cd<br />
</li>
<li>Boot to the cd, do not install, load the demo OS</li>
<li>click System->Administration->Create a USB startup disk</li>
<li>point it to either the cd in your drive, or the iso</li>
<li>point to the correct USB stick</li>
<li>the rest of the settings can stay default</li>
<li>click Make Startup Disk</li>
<li>Insert the usb drive into your wind, power it on, and hit delete to go into the bios, change the first boot device to USB Drive</li>
<li>save and exit the bios</li>
<li>If the wind boots off of the USB stick correctly, you should see the same screen as when you had booted off the cd</li>
<li><a href="https://help.ubuntu.com/community/GraphicalInstall">Install </a>Ubuntu</li>
<li>I made my partitions as follows:<br />
|30 gig recovery partition|20 gig XP partition|15 Gig Ext4 Ubuntu Partition|4 gig swap partition|the rest of the drive as an ext4 partition<br />
<br />
<div class="separator" style="clear: both; text-align: center;"><a href="http://3.bp.blogspot.com/_Ng3QbVQfLZ8/SaYPBBQ2EmI/AAAAAAAAa74/DBWWqZQOEko/s1600-h/partitions.png" imageanchor="1" style="margin-left: 1em; margin-right: 1em;"><img border="0" src="http://3.bp.blogspot.com/_Ng3QbVQfLZ8/SaYPBBQ2EmI/AAAAAAAAa74/DBWWqZQOEko/s320/partitions.png" /></a></div><br />
<br />
</li>
<li>That last partition is where I will mount my home directory, as well as mount from windows xp using <a href="http://www.fs-driver.org/faq.html">ext2fs </a>(I havn't actually tried this yet)</li>
<li>Add the netbook remix repositories to your system.&nbsp; This can be be done in synaptic or by typing the following into a terminal<br />
sudo gedit /etc/apt/sources.list</li>
<li>add the following:<br />
deb http://ppa.launchpad.net/netbook-remix-team/ubuntu intrepid main<br />
deb-src http://ppa.launchpad.net/netbook-remix-team/ubuntu intrepid main</li>
<li>sudo apt-get update</li>
<li>sudo apt-get install go-home-applet <br />
sudo apt-get install window-picker-applet <br />
sudo apt-get install maximus <br />
sudo apt-get install human-netbook-theme&nbsp;</li>
<li>Select the "Human Netbook Theme" in System Preferences>Apperance </li>
<li>go into System Preferences-> sessions->startup programs and confirm that "Maximus" and "window-picker-applet" are thre<br />
</li>
<li><b>Disable Compiz Effects</b> System Preferences->Appearance->None<br />
<br />
This is what is required to get netbook remix running, I continued with the following to tweak it some more<br />
&nbsp;</li>
<li>Delete the bottom panel by right clicking on it<br />
</li>
<li>Delete all the applets on the top panel by right clicking on them</li>
<li>Add applets to the top panel so it ends up like:<br />
Window Picker Applet | Trash Can |Notification Area | MixerApplet | Clock</li>
<li>I also made alt+q the hotkey to show the desktop, makes navigating to it faster. Another option is the show desktop applet button that can be added to the top bar.&nbsp; Preferences->keyboard shortcuts->"Hide all normal windows....."<br />
<br />
More info is available <a href="http://wiki.msiwind.net/index.php/Ubuntu_8.04_Hardy_Heron">here</a>.<br />
</li>
</ol>
