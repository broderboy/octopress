--- 
layout: post
title: Setting a project as the default redmine homepage
wordpress_url: http://timbroder.com/?p=874
date: 2011-03-15 23:31:01 -04:00
comments: true
---
Only have a single project running on <a href="http://www.redmine.org/" target="_blank">redmine</a>? want it to be the homepage?
in config/routes.rb


in cofig/routes.rb
[ruby]map.home '', :controller =&gt; 'projects', :action =&gt; 'show', :id =&gt; 'my_project_name'[/ruby]
