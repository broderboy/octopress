--- 
layout: post
title: "HOWTO: Getting a list of post titles from blogger (Python)"
wordpress_url: http://beta.timbroder.com/2007/08/11/howto-getting-a-list-of-post-titles-from-blogger-python/
date: 2007-08-11 18:25:00 -04:00
comments: true
---
This will be a quick one on how to pull the titles from your blog.  I'm using it to <a href="http://gpowered.net/g/postlist">Lists the posts</a> I have available on <a href="http://gpowered.net/g/">gPowered.net</a>.  Firstly we'll set up our imports and call to the blogger service.<br /><br />

<pre name="code" class="python">
from elementtree import ElementTree 
from gdata import service
import gdata
import atom
import getopt
import sys

blog_id = 413573351281770670
blogger_service = service.GDataService('timothy.broder@gmail.com', '*****')
blogger_service.source = 'Blogger_Python_Sample-1.0'
blogger_service.service = 'blogger'
blogger_service.server = 'www.blogger.com'
blogger_service.ProgrammaticLogin()
</pre><br />

For this query we're going to use the summary feed because all we really need for this is the titles, not the full posts:<br /><br />
<pre name="code" class="python">
query = service.Query()
query.feed = '/feeds/' + str(blog_id) + '/posts/summary'
feed = blogger_service.Get(query.ToUri())
</pre><br />

Then I just do a little counting so I can use the links on my site.  All the information we need is in feed.entry<br /><br />
<pre name="code" class="python">
curr_id = int(feed.total_results.text)
for entry in feed.entry:
 entry.my_id = curr_id
 curr_id -= 1
</pre>
