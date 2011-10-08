--- 
layout: post
title: "HOWTO: Pulling Google Bookmarks with Python"
wordpress_url: http://beta.timbroder.com/2007/08/11/howto-pulling-google-bookmarks-with-python/
date: 2007-08-11 21:22:00 -04:00
comments: true
tags: 
- python
- howto
- yui
- bookmarks
---
I love using <a href="http://www.google.com/bookmarks/">Google Bookmarks</a> (usually with the <a href="http://toolbar.google.com">Google Toolbar</a>) because it lets me get to my bookmarks at home on my laptop or desktop, at work, or anywhere.  It's great.  Now I'm using those bookmarks to power the <a href="http://gpowered.net/g/links/">links</a> section of <a href="http://gpowered.net/g">gPowered.net</a><br />
First we're going to need the <a href="http://code.google.com/p/httplib2/downloads/list">httplib2</a> library so we can authenticate against Google and grab the bookmark feed and then the <a href="http://effbot.org/zone/element-index.htm">ElementTree</a> to help process the rss feed.  <br /><br />
``` python

import httplib2
from elementtree import ElementTree
``` 
<br />
Then we'll setup the link to pull the rss from, authenticate against the request, and pull back the feed<br /><br />
``` python

login = "timothy.broder@gmail.com"  
password = "*****"
url = 'https://www.google.com/bookmarks/?output=rss&num=1000'  
  
h = httplib2.Http()  
h.add_credentials(login, password)  
 
resp, content = h.request(url, "POST", body="nt", headers={'content-type':'text/plain'} )
``` 
<br />
I figured for this a hashmap (or dictionary) would work well using the tags on the bookmarks as keys, pointing to lists of bookmarks.  Then when we display them, just iterate through the keys.  I also kept a list of the keys to make sorting faster later on.  So we define our objects and then loop through the rss object pulling out the tags for keys, the names of the links, and the urls.  I define a small Bookmark class which holds a name and url which will go into the hashmap to make storing the bookmark's easier.  When I try to add a bookmark to the dict's list I try to append it, if the key(tag) doesn't exist I know I have to start a new list.<br /><br />
``` python

class Bookmark:
 def __init__(self, name, link):
  self.name = name
  self.link = link
  
d = dict()
sort_keys = []
for item in tree.findall('item'):
 key = item.findtext('{http://www.google.com/searchhistory}bkmk_label')
 if (key != None) and (key != 'gpowered') and (key != 'BP') and (key != 'Quick Searches') and (key != 'Me'):
  title = item.findtext('title')
  link = item.findtext('link')
  try:
   d[key].append(Bookmark(title.encode('utf-8'), link))
  except KeyError:
   d[key] = [Bookmark(title.encode('utf-8'), link)]
   sort_keys.append(key)
``` 
<br />
Then we'll sort the key list and the list of each key.  To do this we need a small function that defines how to sort a bookmark<br /><br />
``` python

def bookmark_compare(a, b):
 return cmp(a.name, b.name)

sort_keys.sort() 
for key in sort_keys:
 d[key].sort(bookmark_compare)
``` 
<br />
Check out the static HTML version <a href="http://gpowered.net/g/links/simple">Here</a>.  I also made a <a href="http://gpowered.net/g/links/">fancier version</a> using <a href="http://developer.yahoo.com/yui/">YUI</a>'s <a href="http://developer.yahoo.com/yui/treeview/">TreeView</a>
