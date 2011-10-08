--- 
layout: post
title: Google hosting popular javascript libraries
wordpress_url: http://beta.timbroder.com/2008/05/28/google-hosting-popular-javascript-libraries/
date: 2008-05-28 16:04:00 -04:00
comments: true
tags: []

---
I came across this yesterday looking for the <a href="http://mootools.net/">mootools</a> download link.  Google is hosting a bunch of the popular javascript libraries on their server for you.<br /><br />
<br />
Pros:
<ul>
<li>Use Google's Bandwidth</li>
<li>Google takes care of keeping the files up to date</li>
<li>Common include code across your apps</li>
<li>Use Google as a Fast proxy</li>
<li>Gadgets will have access to cached files</li>
</ul>
<br />
Cons:
<ul>
<li>Have to rely on Google to keep files up to date</li>
<li>Probably won't include beta releases of libraries</li>
</ul>

<br />
The main page is <a href="http://code.google.com/apis/ajaxlibs/">here</a> and currently includes:
<ul>
<li><a href="http://jquery.com/ ">jQuery</a></li>
<li><a href="http://www.prototypejs.org/">prototype</a></li>
<li><a href="http://script.aculo.us/">script.aculo.us</a></li>
<li><a href="http://mootools.net/">MooTools</a></li>
<li><a href="http://dojotoolkit.org/">Dojo</a></li>
</ul>
<br />
Example jQuery:

<pre name="code" class="javascript">
<script src="http://www.google.com/jsapi"></script>
<script>
  // Load jQuery
  google.load("jquery", "1");

  // on page load complete, fire off a jQuery json-p query
  // against Google web search
  google.setOnLoadCallback(function() {
    $.getJSON("http://ajax.googleapis.com/ajax/services/search/web?q=google&;v=1.0&;callback=?",

      // on search completion, process the results
      function (data) {
        if (data.responseDate.results &&
            data.responseDate.results.length>0) {
          renderResults(data.responseDate.results);
        }
      });
    });
</script>
``` 
