--- 
layout: post
title: "HOWTO: YUI Tabview"
wordpress_url: http://beta.timbroder.com/2007/08/31/howto-yui-tabview/
date: 2007-08-31 23:25:00 -04:00
comments: true
tags: 
- howto
- yui
---
A few days ago I added the Digg counts to the bottom of the <a href="http://gpowered.net/g/postlist">Posts</a> page on gPowered.net.  Although, the more posts that I add, the further down on the page this section will get, so I decided to play around with YUI's <a href="http://developer.yahoo.com/yui/tabview/">tabview control</a> and put the post list in one tab, and the diggs in another.  It turned out to be really easy:<br /><br />
First we need a few dependencies<br />
``` html

<!-- Dependencies -->  
<!-- core CSS -->  
<link rel="stylesheet" type="text/css" href="http://yui.yahooapis.com/2.3.0/build/tabview/assets/tabview.css">   

<!-- optional skin for border tabs -->  
<link rel="stylesheet" type="text/css" href="http://yui.yahooapis.com/2.3.0/build/tabview/assets/border_tabs.css">   

<script type="text/javascript" src="http://yui.yahooapis.com/2.3.0/build/yahoo-dom-event/yahoo-dom-event.js"></script>  
<script type="text/javascript" src="http://yui.yahooapis.com/2.3.0/build/element/element-beta-min.js"></script>  

<!-- Source file -->  
<script type="text/javascript" src="http://yui.yahooapis.com/2.3.0/build/tabview/tabview-min.js"></script>  
``` 
<br />
And then we just need to organize some DIVs<br />
``` html

<div id="demo" class="yui-navset">   
 <ul class="yui-nav">   
  <li class="selected"><a href="#posts"><em>Posts</em></a></li>  
  <li><a href="#diggs"><em>Diggs</em></a></li> 
  <li><a href="#HOWTOs"><em>HOWTO's</em></a></li> 
 </ul>               
 <div class="yui-content">   
  <div id="posts" style="margin: 10px">
   <h3>Posts</h3>
   content
  </div>
  <div id="diggs" style="margin: 10px"> 
   <h3>Diggs</h3>
   content
  </div>
 </div>
</div>
``` 
