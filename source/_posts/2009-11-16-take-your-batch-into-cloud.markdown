--- 
layout: post
title: Take your batch into the cloud
wordpress_url: http://beta.timbroder.com/2009/11/16/take-your-batch-into-the-cloud/
date: 2009-11-16 22:07:00 -05:00
comments: true
---
from the work blog:<br /><br />

<a href="http://www.alexanderinteractive.com/blog/2009/11/take-your-batch-into-the-cloud.html">Take your batch into the cloud</a>: "<p>About a year ago I wrote a webapp called <a href="http://twitter2gtalk.appspot.com">twitter2gtalk</a>, which simply takes your latest Twitter message and sets it as your Google <a href="http://www.google.com/talk/">Talk </a>Status.  Shortly there after I attended an <a href="http://code.google.com/appengine/">App Engine</a> Hackathon (GAE) at Google NYC.  At the hackathon, I started porting the app over to app engine.  At the time, there was no scheduling or cron support in GAE.  I created a hybrid app running between GAE and my webfaction server.  My webfaction server would handle the cron, proxy out the requests, and do some of the longer running tasks (the limit on an app engine request is 20 seconds).<br />
 <br />
Now with the release of the <a href="http://code.google.com/appengine/docs/python/config/cron.html">Task Scheduler</a> and <a href="http://code.google.com/appengine/docs/python/taskqueue/">Task Queues</a>, you can break up a long winded process into the cloud.  My batch was taking around 18 minutes to run, with about 800 users being processed each time.  For each user the app had to get their Twitter status, then connect to Google's xmpp server, and after a couple of xmpp calls, update the Google Talk Status.  Even being single threaded, this whole process started eating up a lot of juice on the server.  The rest of my apache processes suffered and the entire site slowed down<br />
 <br />
Using the new app engine features, I was able to do two things: 1) Move the scheduling into app engine itself and 2) have app engine do the bulk of the work, by having each user-update be its own task.  These worker tasks are then processed anywhere in the cloud, and can be run in parallel, independently of each other</p>

<p>The original code was something like:<br />
     <br />
for users in all my users:<br />
        get twitter status<br />
        connect to gtalk<br />
        get current status<br />
        update status</p>

<p> My process for converting this to app engine tasks was as follows:<br />
1) Create a process to load all of the users into a Task Queue<br />
2) Set up each Task Queue so that it can independently do the work for the user that it is associated with<br />
3) Schedule Step 1 to run every half hour<br />
 <br />
Skeleton Code for Step 1:</p>

<p>class TaskLoader(BaseRequestHandler):  </p>

<p>def get(self):  <br />
logging.info(&quot;Starting to load tasks %s&quot; % datetime.datetime.now())  </p>

<p>users = Account.gql(&#39;WHERE active = :1&#39;, True)  <br />
 <br />
count = 0  <br />
for user in users:  </p>

<p>send_key = # data to send to the worker  <br />
taskqueue.add(url=&#39;/worker/&#39;, params={&#39;key&#39;: send_key})  </p>

<p>count += 1  <br />
         <br />
logging.info(&quot;Ended load tasks (%d users) %s&quot; % (count, datetime.datetime.now()))<br />
 <br />
The Url call for this method: ('/taskloader/', TaskLoader),</p>

<p>The Skeleton code for step 2:<br />
 <br />
class TaskWorker(BaseRequestHandler):  <br />
    def post(self):  <br />
        key = self.request.get(&#39;key&#39;)  </p>

<p>        t = &#39;&#39;.join([&quot;http://django.gpowered.net/xmppproxy/&quot;, key])  </p>

<p>        logging.info(&quot;URL !%s!&quot; % t)  <br />
        result = urlfetch.fetch(t,  <br />
                                None,  <br />
                                urlfetch.GET,  <br />
                                {&#39;Cache-Control&#39;:&#39;no-cache,max-age=0&#39;, &#39;Pragma&#39;:&#39;no-cache&#39;})   <br />
 <br />
Url call for this method: ('/worker/', TaskWorker),</p>

<p>So, TaskLoader loads all of the users into the Task queue.  App Engine processes these when it has the cpu cycles to do so, and for each of these, TaskWorker is called<br />
 <br />
I can schedule these using cron.yaml in my project:<br />
 <br />
cron:  <br />
- description: load the task queue  <br />
url: /taskloader/  <br />
schedule: every 30 minutes<br />
 <br />
This is a general overview of how to break up your batch in to smaller, easier to manage tasks.  Please see the App Engine <a href="http://code.google.com/appengine/docs/python/overview.html">documentation </a>for more detailed information.</p>"
