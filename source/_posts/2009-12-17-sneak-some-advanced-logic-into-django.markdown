--- 
layout: post
title: Sneak some advanced logic into a Django template
wordpress_url: http://beta.timbroder.com/2009/12/17/sneak-some-advanced-logic-into-a-django-template/
date: 2009-12-17 17:03:00 -05:00
comments: true
tags: []

---
I was adding on an app to a Django project at work where I was overriding an existing template but did not have access to the view that called that template.  I was left in a scenario where I had the variables that the view was originally set up with, but non of the new models that I had added.<br />
<br />
In a filter you can do whatever logic you want, and then pass information back to the view.  Please keep in mind, this is probably a horrible practice, but it does have its uses.  In this specific scenario I needed to query the new models without modifying the existing view, solution: add a filter and do the querying there.<br />
<br />
This is the filter that I used to do the querying:<br />
``` python
from django import template
from stager.jira.models import JiraProject, ProjectLink
from stager.staging.models import *

register = template.Library()

def has_jira(value, arg):
    client = Client.objects.get(path=value)
    project = client.projects.get(path=arg)
    try:
        jiras = ProjectLink.objects.get(ClientProject=project).JiraProject.exclude(filter_id='')
        return True
    except:
        return False
register.filter('has_jira', has_jira)
``` 
<br />
Then, in my template:<br />
``` html
{{ "{% load has_jira " }}%}
{{ "{% if client.path|has_jira:project.path " }}%}
     <li><a href="jira/projects" >Jira</a></li>
{{ "{% endif " }}%}
``` 
<br />
A more general example if this would be to work around the annoyance of not being able to have multiple tests in an if statement in a template: You can't do {{ "{% if this and that " }}%}<br />
<br />
A solution would be:<br />
``` python
def if_and(value, arg):
    if value and arg:
        return True
    else:
        return False
    
def if_or(value, arg):
    if value or arg:
        return True
    else:
        return False
``` 
<br />
``` html
 {{ "{% if True|if_and:False " }}%}
 show
 {{ "{% else " }}%}
 don't show
 {{ "{% endif " }}%}
``` 
<br />
Let me know your thoughts, pros/cons of this method.<br /><br />

Ai's stager project is open source and can be found at <a href="http://github.com/aiaio/ai-stager">github</a>
