--- 
layout: post
title: A note on Magento and multiple nodes using Memcached
wordpress_url: http://timbroder.com/?p=831
date: 2011-02-11 18:35:44 -05:00
comments: true
tags: 
- php
- magento
- memcached
- xml
---
If you have multiple nodes using a shared memcached server, make sure you define a shared prefix for the keys to use.

In local.xml:
``` xml

        <cache>
...
            <prefix>a1i</prefix>
            <id_prefix>a1i</id_prefix>
            <memcached>
...
```

