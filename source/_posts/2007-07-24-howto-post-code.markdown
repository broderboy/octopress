--- 
layout: post
title: "HOWTO: post code"
wordpress_url: http://beta.timbroder.com/2007/07/24/howto-post-code/
date: 2007-07-24 01:52:00 -04:00
comments: true
---
Posting code is made quite easy by using <a href="http://code.google.com/p/syntaxhighlighter/">SyntaxHighlighter</a>.  It's pretty
 easy to set up and works on any html sites, as well as <a href="http://www.blogger.com">blogger</a> and <a href="http://www.wordpress.org">wordpress</a>.  I'll be using it heavily throughout these posts.  3 easy steps:<br /><br />
 1) Include the SyntaxHighlighter.css file at the top of your page.
<br /> <br /> 
<pre class="brush: html">
&lt;link type="text/css" rel="stylesheet" href="/php/js/dp.SyntaxHighlighter/Styles/SyntaxHighlighter.css"&gt;&lt;/link&gt;
</pre>
<br /> 
2) At the bottom of the page, include the <a href="http://code.google.com/p/syntaxhighlighter/wiki/Brushes">brushes</a> and other js files you will need, as well as the function call to stylize the &lt;pre&gt; tags:
<br /><br /> 
<pre name="code" class="html">
&lt;script language="javascript" src="/php/js/dp.SyntaxHighlighter/Scripts/shCore.js"&gt;&lt;/script&gt;
&lt;script language="javascript" src="/php/js/dp.SyntaxHighlighter/Scripts/shBrushCSharp.js"&gt;&lt;/script&gt;
&lt;script language="javascript" src="/php/js/dp.SyntaxHighlighter/Scripts/shBrushXml.js"&gt;&lt;/script&gt;
&lt;script language="javascript" src="/php/js/dp.SyntaxHighlighter/Scripts/shBrushPython.js"&gt;&lt;/script&gt;
&lt;script language="javascript"&gt;
dp.SyntaxHighlighter.ClipboardSwf = '/flash/clipboard.swf';
dp.SyntaxHighlighter.HighlightAll('code');
&lt;/script&gt;
</pre>
<br /> 
3) Then, place the code you want in between these two steps using &lt;pre&gt; tags that the javascript will stylize
<br /><br /> 
<pre name="code" class="html">
&lt;pre name="code" class="html"&gt;
&lt;!-- code here --&gt;
&lt;/pre&gt;
&lt;pre name="code" class="python"&gt;
# code here
&lt;/pre&gt;
</pre>
