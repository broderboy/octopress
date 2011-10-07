--- 
layout: post
title: "HOWTO: YUI Tabview"
wordpress_url: http://beta.timbroder.com/2007/08/31/howto-yui-tabview/
date: 2007-08-31 23:25:00 -04:00
comments: true
---
A few days ago I added the Digg counts to the bottom of the <a href="http://gpowered.net/g/postlist">Posts</a> page on gPowered.net.  Although, the more posts that I add, the further down on the page this section will get, so I decided to play around with YUI's <a href="http://developer.yahoo.com/yui/tabview/">tabview control</a> and put the post list in one tab, and the diggs in another.  It turned out to be really easy:<br /><br />
First we need a few dependencies<br />
<pre name="code" class="html">
&lt;!-- Dependencies --&gt;  
&lt;!-- core CSS --&gt;  
&lt;link rel="stylesheet" type="text/css" href="http://yui.yahooapis.com/2.3.0/build/tabview/assets/tabview.css"&gt;   

&lt;!-- optional skin for border tabs --&gt;  
&lt;link rel="stylesheet" type="text/css" href="http://yui.yahooapis.com/2.3.0/build/tabview/assets/border_tabs.css"&gt;   

&lt;script type="text/javascript" src="http://yui.yahooapis.com/2.3.0/build/yahoo-dom-event/yahoo-dom-event.js"&gt;&lt;/script&gt;  
&lt;script type="text/javascript" src="http://yui.yahooapis.com/2.3.0/build/element/element-beta-min.js"&gt;&lt;/script&gt;  

&lt;!-- Source file --&gt;  
&lt;script type="text/javascript" src="http://yui.yahooapis.com/2.3.0/build/tabview/tabview-min.js"&gt;&lt;/script&gt;  
</pre><br />
And then we just need to organize some DIVs<br />
<pre name="code" class="html">
&lt;div id="demo" class="yui-navset"&gt;   
 &lt;ul class="yui-nav"&gt;   
  &lt;li class="selected"&gt;&lt;a href="#posts"&gt;&lt;em&gt;Posts&lt;/em&gt;&lt;/a&gt;&lt;/li&gt;  
  &lt;li&gt;&lt;a href="#diggs"&gt;&lt;em&gt;Diggs&lt;/em&gt;&lt;/a&gt;&lt;/li&gt; 
  &lt;li&gt;&lt;a href="#HOWTOs"&gt;&lt;em&gt;HOWTO's&lt;/em&gt;&lt;/a&gt;&lt;/li&gt; 
 &lt;/ul&gt;               
 &lt;div class="yui-content"&gt;   
  &lt;div id="posts" style="margin: 10px"&gt;
   &lt;h3&gt;Posts&lt;/h3&gt;
   content
  &lt;/div&gt;
  &lt;div id="diggs" style="margin: 10px"&gt; 
   &lt;h3&gt;Diggs&lt;/h3&gt;
   content
  &lt;/div&gt;
 &lt;/div&gt;
&lt;/div&gt;
</pre>
