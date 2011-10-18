---
layout: post
title: "Creating a Stateless Request in Magento"
date: 2011-10-17 18:45
comments: true
categories: 
tags: 
- php
- magento
---
Have you ever wanted to create a stateless request in Magento? Something that doesn't touch any of Matengo's sessions?  We were having issues with some of the ajax calls on our cart and checkout pages mucking with the user's cart and had get stateless on these calls.  The issue we were having was out checkout page was loading, then a javascript include was going out and bringing code from a 3rd party relevance engine into our dom, which was in turn calling back an ajax request to our servers.  This issue with this being that at the start of the page load page load, the checkout session was being set to a certain state.  This state was then being sent through the rest of the page load, and the ajax calls. Unfortunately, by the time the ajax call got back to our server, the session was different in both locations, creating a race condition.  The ajax request usually won, removing the work the full page load had done with trying to process checkout.  The good news was there was nothing in the ajax call that needed to touch the session, it was just some data lookup. So, nix the session part of that call, and our troubles should be over... Magento's api controller is the only place that implements a stateless request this but its fairly easy to do (after a bit of digging).

As long as Mage_Core_Controller_Varien_Action is a parent in your controller's hierchy, you are good to go (it probably is).  This class has a const FLAG_NO_START_SESSION which looks promising. Digging into the code a little we see that it controls whether cookies are processed or the session is started:

{% gist 1293475 %}

By adding to the preDispatch() method of our Action or Controller we can toggle this:

{% gist 1293491 %}

Now, any action in this controller will be stateless and not effect any sessions