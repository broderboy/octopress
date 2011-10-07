--- 
layout: post
title: A quick way to display your delicious links by tag
wordpress_url: http://beta.timbroder.com/2010/01/05/a-quick-way-to-display-your-delicious-links-by-tag/
date: 2010-01-05 14:46:00 -05:00
comments: true
---
quick, dirty, and slow with lots of tags<br />
<br />
<pre name="code" class="python">&lt;html&gt;
&lt;body&gt;
&lt;script type="text/javascript"&gt; 
function goforit (posts) {
 for ( var tagname in posts ) {
  document.writeln('&lt;scr'+'ipt type="text/javascript" src="http://feeds.delicious.com/v2/js/NYCEndurance/' + tagname + '?title=' + tagname + '&icon=s&count=100&sort=alpha&tags"&gt;&lt;/scr'+'ipt&gt;'); 
 }
}
&lt;/script&gt;
&lt;script type="text/javascript" src="http://feeds.delicious.com/v2/json/tags/NYCEndurance?callback=goforit"&gt;&lt;/script&gt;
&lt;/body&gt;
&lt;/html&gt;
</pre>
