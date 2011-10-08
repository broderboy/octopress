--- 
layout: post
title: Linux Distro Popularity According to Google
wordpress_url: http://beta.timbroder.com/2007/10/30/linux-distro-popularity-according-to-google/
date: 2007-10-30 02:30:00 -04:00
comments: true
tags: 
- ubuntu
---
Over the years I've used a variety of Linux Distros: Mandrake, Red Hat, FreeBSD, Fedora, Gentoo, and Ubuntu.  <a href="http://distrowatch.com/">Distrowatch</a> keeps track of everything we need to know about the distros, and recently there has been an enormous push in desktop Linux thanks to Dell putting Ubuntu on desktops and <a href="http://www.compiz-fusion.org">Compiz-Fusion</a> bringing snazzy eye candy to even low end machines.  Distrowatch gives some pretty decent stats on the main Distros but for a while I've wanted to know how Google sees their popularity; mainly by how many pages mention specific distros.  <br /><br />

<script type="text/javascript">
digg_url = 'http://blog.gpowered.net/2007/10/linux-distro-popularity-according-to.html';
</script>
<script src="http://digg.com/tools/diggthis.js" type="text/javascript"></script>

<br /><br />

Using some python, a spreadsheet, and a little scraping, I was able to get my answer. To see how Google would rank different distros I'm using the number of results Google returns when searching for the Distro's name as my numbers.  I'm going to write a HOWTO on the technical aspects of what I did sometime this week, but here are the basic steps<ol>

<li>In a Google Spreadsheet I made a sheet that held the names of the top distros on Distrowatch.</li><li>
Another sheet holds the full list from distro watch (366 on record at the time of this writing)</li><li>
I set up a dapp to take these names, and return the number of results Google would have if you searched them</li><li>
A python script pulls the distros out of the spreadsheet, queries the dapp, and puts the results back into another sheet</li></ol>

I have 2 sets of results.  One is a query using the vanilla list out of the spreadsheet.  The second is appending the word Linux to the distro if it does not already have it as the title, I was curious as to how this would effect the results.  Below are the results of the most popular Distros on Distrowatch.  Look, Ubuntu!  The spreadsheet that has all of the findings (and all 366 distros) is shared <a href="http://spreadsheets.google.com/pub?key=p919ps7OYXvugbqx9SegSTw">here</a><br /><br />

<table border="1"><tr><td><b>Distro</b></td><td><b>Page Hist</b></td></tr><tr>
<td>Ubuntu</td><td>96,800,000</td></tr><tr><td>
FreeBSD</td><td>36,700,000</td></tr><tr><td>
Fedora</td><td>35,800,000</td></tr><tr><td>
openSuse </td><td>29,500,000</td></tr><tr><td>
Debian Linux</td><td>28,100,000</td></tr><tr><td>
KNOPPIX</td><td>12,500,000</td></tr><tr><td>
Mandriva Linux</td><td>5,720,000</td></tr><tr><td>
Gentoo Linux</td><td>4,430,000</td></tr><tr><td>
PCLinuxOS</td><td>3,170,000</td></tr><tr><td>
Slackware Linux</td><td>3,010,000</td></tr><tr><td>
MEPIS Linux</td><td>1,640,000</td></tr></table>
<br /><br />
<img src="http://spreadsheets.google.com/pub?key=p919ps7OYXvugbqx9SegSTw&oid=2&output=image"  alt="Distro Chart"/>

<br /><br />

Stay tuned for the code behind it!  <a href="http://feeds.feedburner.com/gPpowered">Subscribe</a> to the feed to get more updates.
