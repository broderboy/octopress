--- 
layout: post
title: "Magento:: Enabling the Product Review form anywhere"
wordpress_url: http://timbroder.com/?p=647
date: 2010-09-08 18:03:07 -04:00
comments: true
---
the form code lives in app/design/frontend/yourtemplate/default/template/review/form.phtml

in catalog.xml enable it with:

[xml]&lt;block type=&quot;review/form&quot; name=&quot;product.info.review_form&quot; as=&quot;review_form&quot; template=&quot;review/form.phtml&quot;/&gt;[/xml]

and in your template:

[php]&lt;?php echo $this-&gt;getChildHtml('review_form'); ?&gt;[/php]
