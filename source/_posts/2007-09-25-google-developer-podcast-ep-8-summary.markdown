--- 
layout: post
title: Google Developer Podcast Ep 8 Summary
wordpress_url: http://beta.timbroder.com/2007/09/25/google-developer-podcast-ep-8-summary/
date: 2007-09-25 03:24:00 -04:00
comments: true
---
I got some time today on the train today to listen to Episode 8 of the Google Developer Podcast.  Normally I'll listen to it at work when it first comes out but it's been way to hectic.  Here are some highlights some commentary thrown in.<br /><br />

<ul>
<li>ZohoWriter goes on Gears - See my opinions about this <a href="http://gpowered.blogspot.com/2007/08/google-get-in-gear.html">here</a>.  Google really needs to step it up and get Gears into their own services.  The top two on my list being Gmail and Docs</li>
<li>Embed Google Maps in a "youtube like way".  Also the Drag zoom and custom marker manager controls have been improved.  Very easy to use.</li>
<li>Sky in Google Earth.  I havn't played with this yet.  I'll check it out after work tomorrow if Halo 3 isn't in the mailbox ;-)
<ul><li>Stars</li>
<li>Google's proof that there probably is life on other planets: Earth is not just a "one off".</li>
<li>We need a Marvin the Martian Easter egg</li>
</ul></li>
<li>Google Objective-C library has been updated for code search, Picasa, and calendar</li>
</ul>

The Guest in this episode was Mark Stahl, the Tech lead of GData since it started (about 2 1/2 years)

<ul>
<li>GData is the way to interact with Google Data, See most of my <a href="http://gpowered.blogspot.com/search/label/HOWTO">HOWTO's</a> for examples.</li>
<li>Uses the Atom publishing protocol (REST)</li>
<li>Resources are represented as XML.  Many, many libraries are out there for working with XML so no steep learning curve for working with the data.</li>
<li>GET, PUT, POST, DEL to manipulate Data</li>
<li>A feed is a container of Data Items</li>
<li>Atom: syndication technology.  It is a feed document.  Used as a response for "get me the latest version of.... foofoo data set</li>
<li>Atom publishing protocol added manipulation in the form of read/write</li>
<li>Atom beat out RSS because it already had an ITEF committee</li>
<li>GData builds on top of Atom publishing
<ul>
<li>Way to query, by passing parameters through a URL</li>
<li>Standardized parameters</li>
</ul>
</li><li>Atom has no concurrency to detect conflicts / multiple writes</li>
<li>Etags are coming in the future to address this.  Etags are strings that contain version info.  This will enable for better caching solutions on the client, or any point in between the client and the server.</li>
<li>
</li><li>The GData team chose REST because the web is built on REST ideas.  It already had developer Acceptability.  It's also easy to learn. </li>
<li>REST is a style, its good at certain things, but has trouble mapping certain operations that would perhaps be better off as an RPC</li>
<li>Atomic but not transactional</li>
<li>The first service to get GData was Calendar, and it currently gets the most request, followed (in order) by Blogger, Base, and Spreadsheets.</li>
<li>The most popular client libraries are the ones in Java and .net, followed by Python, PHP, Objective C, Lisp, and Ruby</li>
<li>Authentication can be done via ClientLogin with a token (Programmatic login), or via authsub (Google handles credentials)</li>
<li>Uses "kinds": Semantic level syndication (add custom info to an entry and helps define types of entries)</li>
</ul>
