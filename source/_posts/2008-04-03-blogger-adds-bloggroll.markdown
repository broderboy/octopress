--- 
layout: post
title: Blogger adds bloggroll
wordpress_url: http://beta.timbroder.com/2008/04/03/blogger-adds-bloggroll/
date: 2008-04-03 22:37:00 -04:00
comments: true
---
<a href="http://buzz.blogger.com/2008/04/blog-list-scheduled-post-publishing-on.html">Blogger</a> in  <a href="http://draft.blogger.com/">draft</a> added 2 new features today: a blogroll page element, and post scheduling.  Post scheduling is pretty useful, you can write up your post, set the time (in the future) that you want it to post, and Blogger will do it automatically.



The second feature, a blogroll, I would like a lot more if it was done better.  The main thing I like about it is that it integrates with Google Reader so if I'm linking to my friend's blogs, I just scroll to my 'Friends' Tag and add them.  The thing I don't like however is that it does not support <a href="http://gmpg.org/xfn/">XFN</a> or <a href="http://gmpg.org/xfn/">FOAF</a> therefore not getting picked up by the <a href="http://code.google.com/apis/socialgraph/docs/">SocialGraph API</a>.  For example, if I linked to my <a href="http://maybe-not.net/" rel="friend sweetheart" title="Laura&#8217;s blog">girlfriend's blog</a>, the blogroll just lists this as



<pre name="code" class="html">
<a href='http://maybe-not.net/' target='_blank'>Maybe-Not</a>

</pre>



A better link, for example from a <a href="http://www.wordpress.org">wordpress</a> blogroll would look something like



<pre name="code" class="html">
<a href="http://maybe-not.net/" rel="friend sweetheart" title="Laura&#8217;s blog">Maybe-Not</a>< </pre>



...and get picked up but the SocialGraph as having a relationship to me.  Blogger is great and I love using it, but the features of wordpress are blowing it out of the water.</pre>
