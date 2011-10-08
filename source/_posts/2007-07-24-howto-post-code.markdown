--- 
layout: post
title: "HOWTO: post code"
wordpress_url: http://beta.timbroder.com/2007/07/24/howto-post-code/
date: 2007-07-24 01:52:00 -04:00
comments: true
tags: []

---
Posting code is made quite easy by using <a href="http://code.google.com/p/syntaxhighlighter/">SyntaxHighlighter</a>.  It's pretty
 easy to set up and works on any html sites, as well as <a href="http://www.blogger.com">blogger</a> and <a href="http://www.wordpress.org">wordpress</a>.  I'll be using it heavily throughout these posts.  3 easy steps:<br /><br />
 1) Include the SyntaxHighlighter.css file at the top of your page.
<br /> <br /> 
<pre class="brush: html">
<link type="text/css" rel="stylesheet" href="/php/js/dp.SyntaxHighlighter/Styles/SyntaxHighlighter.css"></link>
``` 

<br /> 
2) At the bottom of the page, include the <a href="http://code.google.com/p/syntaxhighlighter/wiki/Brushes">brushes</a> and other js files you will need, as well as the function call to stylize the <pre> tags:
<br /><br /> 
``` html

<script language="javascript" src="/php/js/dp.SyntaxHighlighter/Scripts/shCore.js"></script>
<script language="javascript" src="/php/js/dp.SyntaxHighlighter/Scripts/shBrushCSharp.js"></script>
<script language="javascript" src="/php/js/dp.SyntaxHighlighter/Scripts/shBrushXml.js"></script>
<script language="javascript" src="/php/js/dp.SyntaxHighlighter/Scripts/shBrushPython.js"></script>
<script language="javascript">
dp.SyntaxHighlighter.ClipboardSwf = '/flash/clipboard.swf';
dp.SyntaxHighlighter.HighlightAll('code');
</script>
``` 

<br /> 
3) Then, place the code you want in between these two steps using <pre> tags that the javascript will stylize
<br /><br /> 
``` html

``` html

<!-- code here -->
``` 

``` python

# code here
``` 

``` 
