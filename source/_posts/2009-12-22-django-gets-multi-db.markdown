--- 
layout: post
title: Django gets Multi-DB
wordpress_url: http://beta.timbroder.com/2009/12/22/django-gets-multi-db/
date: 2009-12-22 19:58:00 -05:00
comments: true
tags: []

---
For his Google Summer of Code project <a href="http://lazypython.blogspot.com/">Alex Gaynor</a> added Multiple Database support to Django, which just got pushed to Trunk.<br />
<br />
The Documentation is available <a href="http://docs.djangoproject.com/en/dev/topics/db/multi-db/">here</a>.&nbsp; <br />
<br />
Some of the offhand benifits I can see:<br />
<ol><li>Multiple of databases.&nbsp; Got some legacy systems you don't want to migrate but have access to the data? no problem</li>
<li>Have a read and a write database.&nbsp; Want one of your databases to speed up by configuring faster indexes and disabling writes? done.</li>
<li>Multiple TYPES of databases.&nbsp; This is the one I'm most excited about.&nbsp; This is going to enable people to use some of the NoSQL databases (<a href="http://www.mongodb.org/">MongoDB</a>, <a href="http://couchdb.apache.org/">CouchDB</a>, see <a href="http://en.wikipedia.org/wiki/NoSQL#List_of_NoSQL_open_source_projects">here </a>for a more complete list)<br />
<br />
For a great application of MongoDB on a news site see <a href="http://www.businessinsider.com/how-we-use-mongodb-2009-11">Business Insider</a><br />
</li>
</ol>
