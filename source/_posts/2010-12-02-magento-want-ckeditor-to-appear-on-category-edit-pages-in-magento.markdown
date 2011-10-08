--- 
layout: post
title: "Magento: Want CKEditor to appear on Category edit pages in Magento?"
wordpress_url: http://timbroder.com/?p=694
date: 2010-12-02 16:50:50 -05:00
comments: true
tags: 
- php
- magento
- tinymce
- ckeditor
- ajax
- fontis
---
It is pretty common to replace the <a href="http://tinymce.moxiecode.com/" target="_blank">TinyMCE </a>editor in the Magento Admin with the <a href="http://ckeditor.com/" target="_blank">CKEditor </a>using this <a href="http://www.magentocommerce.com/magento-connect/Fontis/extension/586/fontis-wysiwyg-editor" target="_blank">extension</a>

However, the way magento ajaxes the form fields into view on the category pages breaks this functionality.

This snippet should help anyone trying to get it to work

in app/design/adminhtml/default/default/template/fontis/wysiwyg/wysiwyg.phtml
``` php
<?php

<?php } else if($editorType == 'ckeditor') { ?>
    <script type=&quot;text/javascript&quot; src=&quot;<?php echo $this->getJsUrl() ?>fontis/ckeditor/ckeditor.js&quot;></script>
    <script type=&quot;text/javascript&quot;>
    	var pageLoaded = false;
	
        function applyCKEditor() {
        	if(pageLoaded) {
	            var editable_areas = '<?php echo $editableAreas ?>';
	            <?php if(strpos($this->helper('core/url')->getCurrentUrl(), 'catalog_category') != false): ?>
	            	CKEDITOR.instances = {};
	            <?php endif; ?>
	            <?php /* Add CKeditor to any matching textareas. */ ?>
	            editable_areas.split(',').each(function(dom_id) {
	                if($(dom_id)) {
	                    <?php /* Remove the required-entry CSS class so Magento will
	                             allow the contents of the editor to be submitted. */ ?>
	                    var loopCheck = 0;
	                    while($(dom_id).hasClassName('required-entry') &amp;&amp; loopCheck < 10) {
	                        $(dom_id).removeClassName('required-entry');
	                        loopCheck += 1;
	                    }
	
	                    CKEDITOR.replace(dom_id, {
	                        width : 640,
	                        height: 350,
	                        protectedSource : ['(/{{[\s\S]*?}}/g)']                    
	                    });                    
	                }
	            });
	    	}
        }        

	    window.onload = function() {
	    	pageLoaded = true;
	    	<?php if(strpos($this->helper('core/url')->getCurrentUrl(), 'catalog_category') === false): ?>
	    	applyCKEditor();
	    	<?php endif; ?>
	    }
    </script>
<?php } ?>
```


in app/design/adminhtml/default/default/template/catalog/category/edit/form.phtml add this at the bottom but inside the script tag
``` php
<?php
```

if(typeof applyCKEditor == 'function') {
	applyCKEditor();
}
``` php
<?php
```
