--- 
layout: post
title: "Big Appengine news: Cron, Java, Firewalled Data, DB Import"
wordpress_url: http://beta.timbroder.com/2009/04/08/big-appengine-news-cron-java-firewalled-data-db-import/
date: 2009-04-08 13:45:00 -04:00
comments: true
---
<a href="http://googleappengine.blogspot.com/2009/04/seriously-this-time-new-language-on-app.html">Java Support</a>: This was the first, and most popular <a href="http://code.google.com/p/googleappengine/issues/detail?id=1">request </a>in the bug tracker. Followed closely by PHP support.&nbsp; Google has merged the simplicity of appengine with the robustness of java, and added it to their <a href="http://code.google.com/eclipse">Eclipse plugin</a> to boot.<br />
<br />
<a href="http://code.google.com/appengine/docs/python/config/cron.html">Cron Support</a>: The cron support works by calling a URL at a given interval. I'm not sure if cron jobs are also restricted by the timeout policy, hopefully they will be allowed to be longer.<br />
<br />
<a href="http://code.google.com/securedataconnector/">Secure Data Connector</a>: An exampled of this would be accessing data behind a corporate firewall.&nbsp; Might be a (good/bad) idea ;)<br />
<br />
<a href="http://code.google.com/appengine/docs/python/tools/uploadingdata.html">Bulk Uploader</a>: Dump data into appengine from another database or a CSV file
