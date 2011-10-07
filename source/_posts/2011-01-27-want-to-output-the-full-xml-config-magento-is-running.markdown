--- 
layout: post
title: Want to output the full xml config Magento is running?
wordpress_url: http://timbroder.com/?p=813
date: 2011-01-27 19:56:14 -05:00
comments: true
---
[php]
Mage::getConfig()-&gt;getNode()-&gt;asNiceXml('full_config.xml');
[/php]

Where full_config.xml is the file you want it dumped to. 
