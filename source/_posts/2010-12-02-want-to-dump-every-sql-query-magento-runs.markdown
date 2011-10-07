--- 
layout: post
title: Want to dump every SQL query Magento runs?
wordpress_url: http://timbroder.com/?p=697
date: 2010-12-02 22:35:04 -05:00
comments: true
---
In: lib/Zend/DB/Adapter/Adapter.php 

[php]public function query($sql, $bind = array())
    {
        // connect to the database if needed
        $this-&gt;_connect();

        // is the $sql a Zend_Db_Select object?
        if ($sql instanceof Zend_Db_Select) {
            if (empty($bind)) {
                $bind = $sql-&gt;getBind();
            }

            $sql = $sql-&gt;assemble();
        }
        $time_start = microtime(true);

        
        // make sure $bind to an array;
        // don't use (array) typecasting because
        // because $bind may be a Zend_Db_Expr object
        if (!is_array($bind)) {
            $bind = array($bind);
        }

        // prepare and execute the statement with profiling
        $stmt = $this-&gt;prepare($sql);
        $stmt-&gt;execute($bind);

        // return the results embedded in the prepared statement object
        $stmt-&gt;setFetchMode($this-&gt;_fetchMode);
        
        
        $time_end = microtime(true);
        $time = $time_end - $time_start;
        
        echo &quot;SQL[$time | $sql ]&quot; . &quot;\n&lt;br /&gt;\n&quot;;
        return $stmt;
    }[/php]
