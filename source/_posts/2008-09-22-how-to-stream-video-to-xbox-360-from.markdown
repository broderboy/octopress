--- 
layout: post
title: How to stream video to an Xbox 360 from linux
wordpress_url: http://beta.timbroder.com/2008/09/22/how-to-stream-video-to-an-xbox-360-from-linux/
date: 2008-09-22 22:05:00 -04:00
comments: true
---
There are a couple of different methods floating around to do this, but I think this is the quickest and easiest to get set up.  So far, I like this better then FTP'ing files over to my old modded xbox.  Some notes about further investigating will be at the bottom. Note: this was tested on an Ubuntu machine.

<ul><li>Make sure your 360 has all the current updates</li>
<li>Install ushare



<b>"sudo apt-get install ushare"</b>



</li>
</ul><ul><li>if ushare complains about a missing libdlna dependency, get it from here: <b>"wget http://www.geexbox.org/debian/pool/main/libdlna/libdlna0_0.2.3-0ubuntu1_i386.deb"



</b></li>
</ul><li>Edit the ushare configuration



<b>"sudo vim /etc/ushare.conf"</b>



update any ports or network devices you need to (I changed mine to eth1 so it would just use the wireless) as well as what folder to scan

</li>
<li>There is a mime-type you need to update



<b>"sudo vim /usr/share/mime/packages/freedesktop.org.xml"</b>



change <b>mime-type type="video/x-msvideo"</b> to <b>mime-type type="video/x-ms-wmv"</b></li>
<li>restart gnome (<b>ctrl + alt + backspace)</b></li>
<li>start ushare with <b>"ushare -x"</b></li>
<li>Go to the media blade on your 360 dashboard</li>
<li>Press 'X' to change the source</li>
<li>You should see uShare (or whatever you named the share to in the configuration)</li>
<li>play videos!</li>
<li>note: <b>to play a .mkv file, rename it to .m4v </b>

</li>
To Do:

<ul><li>get uShare to automatically rescan the directory (currently if I add a video to the folder, the 360 will not see it until i restart uShare)</li>
<li>get 1080p HD content to stream.  I have tried a few re-encapsulation methods so far, nothing working yet</li>
<li>this is an xbox thing, that hopefully will be fixed in the fall update, but navigating large folder trees can get annoying

</li>
</ul>
