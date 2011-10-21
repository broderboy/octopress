--- 
layout: post
title: "HOWTO: Displaying Blogger feeds with Python"
wordpress_url: http://beta.timbroder.com/2007/07/19/howto-displaying-blogger-feeds-with-python/
date: 2007-07-19 03:07:00 -04:00
comments: true
tags: 
- blogger
- gdata
- python
- howto
---
This first HOWTO is going to cover how I did the basic structure of the posts section of gPowered: pulling from blogger. 
The main functions we'll need are to show a range of posts, a single post, and a function to get the total number of posts that are in the blog.
The reason I try to get the total number is so the different pages can be bookmarkable.  When retrieving a GData feed from blogger.  Entry 1 in the feed is going to be the newest post so there is no 'id' that is going to be static, so we'll do a little math to get a number we can later use as the id.
I use Django to handle rendering the python to the browser.  I probably won't get into other methods.<br /><br />
To start out you'll have to grab the following modules.<br />
- the <a href="http://code.google.com/p/gdata-python-client/downloads/list">gdata python client</a><br />
- <a href="http://effbot.org/zone/element-index.htm">ElementTree</a><br />
- <a href="http://www.egenix.com/products/python/mxBase/mxDateTime/">mxDateTime</a> (I used this for date formatting)<br />
<br />
We then import the parts the we'll need (you can ignore the Django part for your own methods):<br />

{% gist 1304954 %}

One of the first things we're going to have to do is authenticate with google services.
There are two ways to do this: <a href="http://code.google.com/apis/blogger/developers_guide_python.html#auth_sub">AuthSub proxy authentication</a> which has a user login using their own credentials, and
 <a href="http://code.google.com/apis/blogger/developers_guide_python.html#client_login"> ClientLogin username/password authentication</a> where you send a username and password.  We will be using ClientLogin.
 First off, set your login credentials to use later.<br />

{% gist 1304957 %}

Then we start setting up our call to the service.

{% gist 1304962 %}

For more info see the <a href="http://code.google.com/apis/blogger/developers_guide_python.html">blogger developer's guide with python</a> or the <a href="http://code.google.com/apis/accounts/Authentication.html">Google Account Authentication documentation</a><br />
After we have authenticated with Google we need to start building up our query to <a href="http://code.google.com/apis/gdata/">GData</a>, which will return as an ElementTree of data.  The first thing you'll need is your blog's id. <br />
You can use the function in the dev guide to help you with this if you don't already know it.

{% gist 1304970 %}

After you have the blog id we can start working on the query

{% gist 1304970 %}

The below function returns the total number of posts that are in the feed.  We can get a small response by sending 0 for the max results.  Below is the function and the small response we get from it.<br />

{% gist 1304970 %}

{% gist 1304978 %}

So we get the total number of posts and then we can start pulling data.  Lets make a generic function, PostFrom, that can be used to show multiple posts, or just single ones, depending on what you pass to it.  The start number that is passed to
 PostFrom has been set to the first post in the blog is considered to have an id of 1 and the latest post is the same as total_posts.  This is useful so if viewers want to bookmark the page they are looking at, the post that is being displayed will not change.
The following are the different functions that will make use of it.

{% gist 1304981 %}

now we have all the data we need in the feed variable.  Its been turned into an element tree so we don't have to worry about XML parsing here.  Every node has become an objects and lists.  Objects for single nodes(title), and lists for where there are multiple nodes of the same name (entry, link)
At this stage I play with the data a little so it's easier to use in my Django template.

{% gist 1304985 %}

Of course we're going to need next and previous buttons as well.  The way we've set up the math with total_posts and the start number, we only have to increment or decrement these by count (the number of posts to display on a page).  I also set part of the link, as well as the page title, that I will use in my template.<br />

{% gist 1304986 %}

The final part of the function is a return to the Django framework to populate my template.  I'm going to get into the template more in the next post, but you now have all the information you need stored.

{% gist 1304987 %}

To the template!<br />
<br />
The first part consists of displaying the post itself, along with its relevant information
<br />
<br />``` html

{{ "{% for entry in entries " }}%}

  <h2><a href="/post/{{ entry.my_id }}">{{ entry.title.text }}</h2></a>
  {{ entry.content.text }}
  <p>Posted by {{ "{% for auth in entry.author " }}%}{{ auth.name.text }}{{ "{% if not forloop.last " }}%}, {{ "{% endif " }}%}{{ "{% endfor " }}%} 
  on {{ entry.my_date }} at {{ entry.my_time }}</p>
  {{ "{% if entry.category " }}%}<p>Labels: {{ "{% for cat in entry.category " }}%}
   <a href="{{ tag_link }}{{ cat.term }}">{{ cat.term }}</a>
   {{ "{% if not forloop.last " }}%}, {{ "{% endif " }}%}
   {{ "{% endfor " }}%}</p>{{ "{% endif " }}%}<p><a href="{{ entry.my_link }}">More...</a></p>
   
{{ "{% endfor " }}%}
``` 
<br />

And the second part handles the prev and next links
<br />
<br />``` html

<br />
<div class="nav">
{{ "{% if prev " }}%}
<a href="/{{ link }}/{{ prev }}">prev</a>
{{ "{% else " }}%}
&nbsp;&nbsp;&nbsp;&nbsp;
{{ "{% endif " }}%}
&nbsp;&nbsp;&nbsp;&nbsp;
{{ "{% if next " }}%}
<a href="/{{ link }}/{{ next }}">next</a>
{{ "{% else " }}%}
&nbsp;&nbsp;&nbsp;&nbsp;
{{ "{% endif " }}%}
</div>
{{ "{% include 'bottom.html' " }}%}
``` 
<br />

That's all for now. A working example is the <a href="http://gpowered.net/g/">gPowered.net</a> site I'm putting up.  All posts on there are getting pulled from this blog.  I'm going to get into tags and comments next time, as well as javascript and php versions. Stay tuned!
