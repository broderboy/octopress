--- 
layout: post
title: Django Admin inline preview
wordpress_url: http://beta.timbroder.com/2010/02/09/django-admin-inline-preview/
date: 2010-02-09 19:17:00 -05:00
comments: true
tags: []

---
To get inline Admin Previews in the list view<br />
<br />
1) Inherit from PreviewAdmin in your ModelAdmin<br />
2) In your model's template directory, create a folder called preview, and create a template for that model's preview<br />
<br />
Example for model Article<br />
<br />
class ArticleAdmin(PreviewAdmin, other admin.ModelAdmin,,,_):<br />
list_display = (..,.., 'admin_slide_preview')<br />
...<br />
...<br />
<br />
then edit<br />
app_that_has_ArticleModel/templates/preview/article.html<br />
<br />
whatever is in article.html will be shown inline<br />
Access your Article object through {{ object }} in the template<br />
<br />
code updates on <a href="http://github.com/broderboy/django-admin-preview">github</a><br />
<br />
``` python
class PreviewAdmin(admin.ModelAdmin):
    #add to your ModelAdmin
    #list_display = ('headline','created_date', 'state', 'admin_slide_preview')
    def admin_slide_preview(self, obj):
        return "<div class=\"previewslide\" id=\"%s/preview/\">+</div>" % obj.id
    admin_slide_preview.allow_tags = True
    admin_slide_preview.short_description = 'Preview'
    
    def get_preview(self, request, object_id):
        sub = self.queryset(request)[0]
        template = "preview/%s.html" % sub.__class__.__name__
        return object_detail(request, queryset=self.queryset(request), object_id=object_id, template_name=template.lower())
        
    def get_urls(self):
        urls = super(PreviewAdmin, self).get_urls()
        my_urls = patterns('',
            (r'^(?P<object_id>\d+)/preview/$', self.get_preview),
        )
        return my_urls + urls
    
    class Media:
        js = js = ('js/jquery.js',
                   'js/jquery.adminpreview.js'
</object_id>``` 
<br />
<pre name="code" class="javascript">
//base.css
.previewslide {
cursor:pointer;
cursor:hand;
}
``` 
<br />
<br />
<pre name="code" class="javascript">
//jquery.adminpreview.js
$(document).ready(function(){
 $(".previewslide").click(function(){
  $.ajax({
   url:$(this).attr('id'),
   context: $(this).parent().parent(),
   success:function(data){
    var $html = $(data);
    $('.previewed').each(function(){
     $(this).remove();
    });
    
    if(!$html.hasClass('previewed')){
     $html.addClass('previewed');
    }
    
    $html.addClass($(this.context).attr('class'));  
    $(this.context).after($html);
   }
  });
 });
});
``` 
