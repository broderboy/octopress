--- 
layout: post
title: Picasa Web Api updates
wordpress_url: http://beta.timbroder.com/2007/07/24/picasa-web-api-updates/
date: 2007-07-24 02:17:00 -04:00
comments: true
tags: 
- gdata
- picasa web
---
<a href="http://googledataapis.blogspot.com/2007/07/picasa-web-albums-adds-new-api-features.html">Google Data Api's</a> posted a few updates today, a few of which I've really been looking forward to; Community Search, Retrieving a user's recently uploaded photos, Retrieving recently added comments for a particular user, Searching a user's photos, Filtering by tag, Uploading non-JPEG photos, <span style="font-weight: bold;">Downloading the original photo.</span>
<br /><br />
(my fav) <b>Downloading the original photo</b>: You can now download the original photo,  including all EXIF data. This is accomplished by retrieving the feed with the  <code>imgmax=d</code> query parameter and value This will return a feed where  the <code>media:content</code> elements reference the original downloadable  image.
<br /><br />
It's nice not having to use a <a href="http://groups.google.com/group/Google-Picasa-Data-API/browse_thread/thread/6311fb3da0673228/a165e494fe1c1d9d#a165e494fe1c1d9d">backdoor </a> for this anymore
