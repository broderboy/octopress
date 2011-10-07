--- 
layout: post
title: Using widgets outside of the CMS in Magento
wordpress_url: http://timbroder.com/?p=638
date: 2010-09-07 19:51:46 -04:00
comments: true
---
Magento ships with widget functionality that lets you build out data models and then reuse them on product and CMS pages. If you want to use these in a custom template however, you are out of luck. This can be done by extending the Widget Collection class.

Create the following directory structure: app/code/local/Mage/Widget/Model/Myswql4/Widget/Instance

Copy app/code/core/Mage/Widget/Model/Myswql4/Widget/Instance/Collection.php into your new directory

The Mage_Widget_Model_Mysql4_Widget_Instance_Collection comes with a store filter but thats about it. To be more usefull we are going to add a type filter, a title filter, and a sorter.
<pre class="brush: php"> 
class Mage_Widget_Model_Mysql4_Widget_Instance_Collection extends Mage_Core_Model_Mysql4_Collection_Abstract
{
    /**
     * Constructor
     */
    protected function _construct()
    {
        parent::_construct();
        $this-&gt;_init('widget/widget_instance');
    }

    /**
     * Filter by store ids
     *
     * @param array|integer $storeIds
     * @param boolean $withDefaultStore if TRUE also filter by store id '0'
     * @return Mage_Widget_Model_Mysql4_Widget_Instance_Collection
     */
    public function addStoreFilter($storeIds = array(), $withDefaultStore = true)
    {
        if (!is_array($storeIds)) {
            $storeIds = array($storeIds);
        }
        if ($withDefaultStore &amp;&amp; !in_array(0, $storeIds)) {
            array_unshift($storeIds, 0);
        }
        $select = $this-&gt;getSelect();
        foreach ($storeIds as $storeId) {
            $select-&gt;orWhere('FIND_IN_SET(?, `store_ids`)', $storeId);
        }
        return $this;
    }

    public function addTypeFilter($type) {
    	$this-&gt;getSelect()-&gt;where('type=?', $type);
    	return $this;
    }

    public function addTitleFilter($type) {
    	$this-&gt;getSelect()-&gt;where('title=?', $type);
    	return $this;
    }

    public function addAttributeToSort($attribute, $dir='asc') {
    	$this-&gt;getSelect()-&gt;order("{$attribute} {$dir}");
    	return $this;
    }
}
</pre>

Now we should be able to query any widgets from any template in our system:

<pre class="brush: php">
< ?php 
$wids = Mage::getModel('widget/widget_instance')
	->getCollection()
	->addTypeFilter('masswidget/list')
	->addAttributeToSort('title', 'asc')
	->load();

foreach ($wids as $wid):
	$params = $wid->getWidgetParameters();
	echo $params['custom_param'];
	echo $wid->gettitle();
endforeach;
?>
</pre>
