--- 
layout: post
title: Get the admin url for a django model
wordpress_url: http://beta.timbroder.com/2010/02/09/get-the-admin-url-for-a-django-model/
date: 2010-02-09 18:48:00 -05:00
comments: true
tags: []

---
Add this to your model to be able to get their admin change link from anywhere<br />
<br />
Useful if you want to jump to the admin screen of an object you are looking at on the front end <br />
<br />
``` python
from django.core import urlresolvers
from django.contrib.contenttypes.models import ContentType

def get_admin_url(self):
    content_type = ContentType.objects.get_for_model(self.__class__)
    return urlresolvers.reverse("admin:%s_%s_change" % (content_type.app_label, content_type.model), args=(self.id,))
``` 
