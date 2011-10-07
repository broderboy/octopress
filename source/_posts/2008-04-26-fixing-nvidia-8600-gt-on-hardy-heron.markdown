--- 
layout: post
title: Fixing Nvidia 8600 GT on Hardy Heron
wordpress_url: http://beta.timbroder.com/2008/04/26/fixing-nvidia-8600-gt-on-hardy-heron/
date: 2008-04-26 19:22:00 -04:00
comments: true
---
After updating to Hardy I got a white screen of death upon rebooting.  After some research it turned out that this was more of an Nvidia driver issue rather then Ubuntu.  This may not have been the most correct way to fix it, but it worked for me.
<ol>
<li>Completely remove nvidia-glx-new<br /><br /></li>
<li>Remove nvidia-kernel-common (this also removes  linux-restricted-modules), (I am not sure if step 2 is required)<br /><br /></li>
<li>install build-essentials<br /><br /></li>
<li>Download the Nvidia beta driver that came out on April 10.  You can get it <a href="http://www.nvidia.com/object/linux_display_ia32_173.08.html">here</a><br /><br /></li>
<li>hit ctrl + alt + f1 to break out of gnome<br /><br /></li>
<li>"sudo /etc/init.d/gdm stop" to shutdown the X server<br /><br /></li>
<li>sudo sh NVIDIA-Linux-x86-173.08-pkg1.run to install the driver.  If it asks you to update you're xorg.conf file, let it.<br /><br /></li>
<li>Reboot. ("sudo reboot")  You should now be able to enable Desktop effects. YAY FISH!<br /><br /></li></ol>

This issue has also been addressed on the <a href="http://ubuntuforums.org/showthread.php?t=712479">Ubuntu Forums</a> and on <a href="https://bugs.launchpad.net/ubuntu/+source/linux-restricted-modules-2.6.24/+bug/208718">launchpad</a><br /><br />

Note: I have a Dell XPS M1530
