--- 
layout: post
title: SyntaxHighlighter Evolved
wordpress_url: http://timbroder.com/?p=318
date: 2010-06-18 17:45:25 -04:00
comments: true
---
I'm currently in the process of migrating gpowerd.net over to this domain and onto wordpress. <a href="http://alexgorbatchev.com/wiki/SyntaxHighlighter" target="_blank"> SyntaxHighlighter </a>has been upgraded quite a bit since I <a href="http://timbroder.com/2007/07/howto-post-code/" target="_self">last</a> wrote about it. I came across a <a href="http://wordpress.org/extend/plugins/syntaxhighlighter/" target="_blank">great plugin</a> to handle the code highlighting for me on wordpress. I love the plugin, didn't have to go into the wordpress template.

It doesn't support the old pre syntax that I had been using previously but it was simple to add in.

Patch to add this to 2.3.8 is below, Thanks to <a href="http://www.viper007bond.com/wordpress-plugins/syntaxhighlighter/" target="_blank">Alex </a>for the plugin
<pre class="brush: php">--- syntaxhighlighter.orrig.php	2010-06-03 20:08:24.000000000 -0500
+++ syntaxhighlighter.php	2010-06-18 12:27:35.000000000 -0500
@@ -101,12 +101,15 @@
 			'tabsize'        =&gt; 4,
 			'toolbar'        =&gt; 1,
 			'wraplines'      =&gt; 1,
+			'legacy'         =&gt; 0,
 		) );

 		// Create the settings array by merging the user's settings and the defaults
 		$usersettings = (array) get_option('syntaxhighlighter_settings');
 		$this-&gt;settings = wp_parse_args( $usersettings, $this-&gt;defaultsettings );

+		if ( 1 == $this-&gt;settings['legacy'] )
+					wp_register_script( 'syntaxhighlighter-brush-legacy',             plugins_url('syntaxhighlighter/syntaxhighlighter/scripts/shLegacy.js'),            array(),                         $this-&gt;agshver );

 		// Register generic hooks
 		add_filter( 'the_content',                array(&amp;$this, 'parse_shortcodes'),                              7 );
@@ -175,6 +178,7 @@
 			'javascript'    =&gt; 'jscript',
 			//'latex'         =&gt; 'latex',
 			'tex'           =&gt; 'latex',
+			'legacy'        =&gt; 'legacy',
 			'matlab'        =&gt; 'matlabkey',
 			'objc'          =&gt; 'objc',
 			'obj-c'         =&gt; 'objc',
@@ -583,6 +587,9 @@
 		echo "	SyntaxHighlighter.config.strings.noBrush = '" . $this-&gt;js_escape_singlequotes( __( "Can't find brush for: ", 'syntaxhighlighter' ) ) . "';\n";
 		echo "	SyntaxHighlighter.config.strings.brushNotHtmlScript = '" . $this-&gt;js_escape_singlequotes( __( "Brush wasn't configured for html-script option: ", 'syntaxhighlighter' ) ) . "';\n";

+		if ( 1 == $this-&gt;settings['legacy'] )
+			echo "	dp.SyntaxHighlighter.HighlightAll('code');\n";
+
 		if ( 1 != $this-&gt;settings['autolinks'] )
 			echo "	SyntaxHighlighter.defaults['auto-links'] = false;\n";

@@ -687,6 +694,7 @@
 			'tabsize'        =&gt; false,
 			'toolbar'        =&gt; false,
 			'wraplines'      =&gt; false,
+			'legacy'         =&gt; false,
 		), $atts ) );

 		// Check for language shortcode tag such as [php]code[/php]


@@ -771,6 +779,7 @@
 'smarttabs'      =&gt; 'smart-tabs',
 'tabsize'        =&gt; 'tab-size',
 'wraplines'      =&gt; 'wrap-lines',
+			'legacy'         =&gt; 'legacy',
 );

 // Allowed configuration parameters and their type
@@ -925,6 +934,7 @@
 <label for="syntaxhighlighter-light"><input id="syntaxhighlighter-light" name="syntaxhighlighter_settings[light]" type="checkbox" value="1" />settings['light'], 1 ); ?&gt; /&gt; </label>

 <label for="syntaxhighlighter-smarttabs"><input id="syntaxhighlighter-smarttabs" name="syntaxhighlighter_settings[smarttabs]" type="checkbox" value="1" />settings['smarttabs'], 1 ); ?&gt; /&gt; </label>

 <label for="syntaxhighlighter-wraplines"><input id="syntaxhighlighter-wraplines" name="syntaxhighlighter_settings[wraplines]" type="checkbox" value="1" />settings['wraplines'], 1 ); ?&gt; /&gt; </label>

+					<label for="syntaxhighlighter-legacy"><input id="syntaxhighlighter-legacy" name="syntaxhighlighter_settings[legacy][/legacy]" type="checkbox" value="1" />settings['legacy'], 1 ); ?&gt; /&gt; </label>

 <!--<label for="syntaxhighlighter-htmlscript"><input name="syntaxhighlighter_settings[htmlscript]" type="checkbox" id="syntaxhighlighter-htmlscript" value="1"  /> -->
 


@@ -1062,6 +1072,7 @@
 $settings['smarttabs']      = ( !empty($settings['smarttabs']) )      ? 1 : 0;
 $settings['toolbar']        = ( !empty($settings['toolbar']) )        ? 1 : 0;
 $settings['wraplines']      = ( !empty($settings['wraplines']) )      ? 1 : 0;
+			$settings['legacy']         = ( !empty($settings['legacy']) )         ? 1 : 0;

 if ( 'true' != $settings['padlinenumbers'] &amp;&amp; 'false' != $settings['padlinenumbers'] )
 $settings['padlinenumbers'] = (int) $settings['padlinenumbers'];
</pre>
