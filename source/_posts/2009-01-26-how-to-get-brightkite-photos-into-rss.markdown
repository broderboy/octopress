--- 
layout: post
title: How to get brightkite photos into an RSS feed (to post to a blog)
wordpress_url: http://beta.timbroder.com/2009/01/26/how-to-get-brightkite-photos-into-an-rss-feed-to-post-to-a-blog/
date: 2009-01-26 15:11:00 -05:00
comments: true
---
I started another <a href="http://timbroder.com">blog </a>so I have a place to rant about comics or movies or whatever else I need to get off my chest, and I needed an excuse to play with wordpress (something I've been wanting to do for a while).  I plan on posting how I did certain things on that blog on gPowered.



One of the things I really wanted to do was have my twitter photos show up as posts on that blog.  For a while I have been using <a href="http://twitpic.com/photos/broderboy">twitpic</a>, but have recently changed over to <a href="http://brightkite.com/people/broderboy">brightkite</a>.  Brightkite provides an rss feed of all your activity, but I was only interested in the photos.  Looked like a job for <a href="http://pipes.yahoo.com/pipes/pipe.info?_id=PMOQjpHo3RGyu7JdLXO0Kg">Yahoo! Pipes</a>.



<div class="separator" style="clear: both; text-align: center;"><a href="http://4.bp.blogspot.com/_Ng3QbVQfLZ8/SX3Uw_HR3KI/AAAAAAAAajI/XPnLMt02wdQ/s1600-h/pipe1.JPG" imageanchor="1" style="margin-left: 1em; margin-right: 1em;"><img src="http://4.bp.blogspot.com/_Ng3QbVQfLZ8/SX3Uw_HR3KI/AAAAAAAAajI/XPnLMt02wdQ/s320/pipe1.JPG" vi="true" border="0" /></a></div>I imported the bkite feed into pipes, filtered on the items that were photo posts, and renamed the title so it would have the title of the photo instead of the bkite location (by default bkite photo titles are the location where you most recently checked in).  I also did some URL generation so anyone could <a href="http://pipes.yahoo.com/pipes/pipe.run?_id=PMOQjpHo3RGyu7JdLXO0Kg&amp;_render=rss&amp;username=broderboy">use the pipe</a>



The next step was to get this into wordpress.  I Installed the <a href="http://projects.radgeek.com/feedwordpress/">FeedWordPress</a> plugin and set it up to import the pipe's RSS feed.  You can tweak the the settings on what user should be used to write the posts, categories, tags, permalinks (I set mine to point directly back to brightkite).



Hope this helps someone out there, enjoy
