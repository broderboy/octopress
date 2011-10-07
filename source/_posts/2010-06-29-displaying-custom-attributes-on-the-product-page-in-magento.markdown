--- 
layout: post
title: Displaying Custom Attributes on the Product Page in Magento
wordpress_url: http://timbroder.com/?p=551
date: 2010-06-29 16:27:47 -04:00
comments: true
---
At some point you may not want to use the canned attributes.phtml groupings that magento provides, or you just want to cherry pick which attributes to show on your product listing page

template/catalog/product/view.phtml

<pre class="brush: php">
$_product = $this->getProduct();

//For the attribute bike_specs_rear_shock

$_product->getResource()->getAttribute('bike_specs_rear_shock')->getStoreLabel(); //label
$_product->getbike_specs_rear_shock(); //value

</pre>
