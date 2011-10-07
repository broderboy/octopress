--- 
layout: post
title: Quick Google Authentication in PHP
wordpress_url: http://beta.timbroder.com/2009/06/02/quick-google-authentication-in-php/
date: 2009-06-02 15:02:00 -04:00
comments: true
---
Here is a quick way to authenticate against Google and retrieve a protected feed.  It does not use the supported ClientLogin method but it does allow you to get to some unsupported feeds (Reader, Bookmarks, etc)



The <a href="http://framework.zend.com/download/gdata">Zend Gdata library</a> is required



<pre class="php" name="code">$show_list       = 'show-google-reader-sub-list';  //the hook in a page
$login          = '';
$pass          = '';
$source         = 'wordpress-google-reader-sub-list-';  //the source the api sees when logging into Google
$service         = 'reader';  
$login_url        = 'https://www.google.com/accounts/ServiceLoginAuth?service=mail'; //URL to login to google
$subscription_list_url  = 'http://www.google.com/reader/api/0/subscription/list'; //URL that holds a users subscriptions

 
$client = new Zend_Http_Client($login_url);

//connect, authenticate, and handshake with Google
$client-&gt;setCookieJar()
-&gt;setMethod(Zend_Http_Client::POST)
-&gt;setParameterPost(array(
 'continue'             =&gt; $subscription_list_url,
 'service'              =&gt; 'reader',
 'niu'                  =&gt; 1,
 'hl'                   =&gt; 'en',
 'Email'              =&gt; $login,
 'Passwd'               =&gt; $pass,
 'PersistentCookie'     =&gt; 'yes',
 'asts'                 =&gt; ''
));


$response = $client-&gt;request('POST');
$client-&gt;setUri($subscription_list_url)-&gt;setMethod(Zend_Http_Client::GET);
$response = $client-&gt;request()-&gt;getBody();

if ($client-&gt;request()-&gt;getStatus() == 400) {
?&gt;Unable to login with supplied Google login/password</pre>
