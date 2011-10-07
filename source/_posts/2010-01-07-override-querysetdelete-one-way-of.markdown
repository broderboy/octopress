--- 
layout: post
title: Override QuerySet.delete() (one way of preventing cascading deletes)
wordpress_url: http://beta.timbroder.com/2010/01/07/override-queryset-delete-one-way-of-preventing-cascading-deletes/
date: 2010-01-07 17:05:00 -05:00
comments: true
---
We needed to override the default QuerySet delete function to deal with a client problem that we were facing<br />
<br />
Yes This is monkey-patching, and probably bad practice but if anyone needs to conditionally override the cascading delete that django does at the application level from a queryset, this is how to do it<br />
<br />
<pre name="code" class="python">from django.db.models.query import QuerySet

#save original delete method
orrigdelete = QuerySet.delete
def showdelete(self):
    #add on to delete method
    for test in self:
        if isinstance(test, YourObject):
            raise Exception('someone tried to delete your object')
            return  
        else:
            break   
    #call original delete
    return orrigdelete(self)

#set the queryset delete as our new method
QuerySet.delete = showdelete
</pre>
