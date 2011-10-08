--- 
layout: post
title: "Jira Tabs: Open all those Jira's at once! "
wordpress_url: http://timbroder.com/?p=926
date: 2011-04-22 18:21:22 -04:00
comments: true
tags: 
- javascript
- jira
---
Ever want to open all the Jiras on the screen in new tabs? Jess does, I do, and you should too!

For firefox and chrome we now have the JiraTabs bookmark button.

Drag this link up to your bookmarks bar: <a href="javascript: function tab(where){ var elms = document.getElementById(where).getElementsByTagName('tr'); var conf=confirm('Do you want to open '+(elms.length-1)+' Jiras?'); if(conf){ for(var i=1; i<elms.length; i++){ var url = elms[i].getElementsByClassName('summary')[0].getElementsByTagName('a')[0]; window.open(url.href);}  } } tab('issuetable');">JiraTabs</a>. Then, whenever you are on a filter or search view of Jira's, click the button and all the jira's on your screen will open up in new tabs

Demo:

<iframe title="YouTube video player" width="425" height="349" src="http://www.youtube.com/embed/PltTkfuhKfM?rel=0&amp;hd=1" frameborder="0" allowfullscreen></iframe>

Any updates will be made <a href="https://bitbucket.org/broderboy/jira-tabs/src" target="_blank">here</a>.
