--- 
layout: post
title: Checking if a remote file exists in python
wordpress_url: http://beta.timbroder.com/2009/09/30/checking-if-a-remote-file-exists-in-python/
date: 2009-09-30 19:51:00 -04:00
comments: true
---
Normally, to check if a remote web file exists I would use urllib's getcode() but that is a 2.6 and newer feature.&nbsp; In Python 2.5 its a little more interesting.&nbsp; Thankfully, wget's spider command can help us out.<br />
<br />
<br />
<pre name="code" class="python">from subprocess import Popen, PIPE
def url_exists(url):
    command = ["wget", "-S", "--spider", url]
    p = Popen(command, stdout=PIPE, stderr=PIPE)
    stdout, stderr = p.communicate()
    exists = stderr.find('ERROR 404')
    if int(exists) > -1:
        return False
    else:
        return True
</pre>
