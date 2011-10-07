--- 
layout: post
title: My First Google API ticket has been fixed
wordpress_url: http://beta.timbroder.com/2007/10/17/my-first-google-api-ticket-has-been-fixed/
date: 2007-10-17 02:57:00 -04:00
comments: true
---
My first <a href="http://code.google.com/p/gdata-issues/issues/detail?id=44">ticket</a> for the Google Document List API has been fixed.  As I posted about <a href="http://gpowered.blogspot.com/2007/08/quick-docs-api-example-python.html">before</a>, the Document List API did not have the ability to just retrieve the documents from a given folder or tag.  This has now been made possible, thanks API team!<br /><br />

Original ticket:<br /><br />
<blockquote>It would be ideal if we could pull back a list of documents from a certain
folder.  This would give more functionality and make the size of the data
smaller if you only needed to grab a list of file from a certain folder.
<br /><br />
Possibly something like
gdata.docs.service.DocumentQuery(folder=['myfolder1'])
or
gdata.docs.service.DocumentQuery(folders=['myfolder1','folder2'])</blockquote><br />
