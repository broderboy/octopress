--- 
layout: post
title: Running Mongodb as a service on windows
wordpress_url: http://timbroder.com/?p=850
date: 2011-02-23 20:55:22 -05:00
comments: true
---
&gt; c:\mongodb\mongod.exe --logpath "c:\mongodb\logs\mongo.log" --logappend --dbpath "c:\mongodb\dat
a" --directoryperdb --install
all output going to: c:\mongodb\logs\mongo.log
Creating service MongoDB.
Service creation successful.
Service can be started from the command line via 'net start "MongoDB"'.

&gt; net start MongoDB
The Mongo DB service was started successfully.
&gt;

&gt; mongo
MongoDB shell version: 1.6.5
connecting to: test
&gt;
