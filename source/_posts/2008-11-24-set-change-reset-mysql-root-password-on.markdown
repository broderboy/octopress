--- 
layout: post
title: Set / Change / Reset the MySQL root password on Ubuntu Linux (Ubuntu)
wordpress_url: http://beta.timbroder.com/2008/11/24/set-change-reset-the-mysql-root-password-on-ubuntu-linux-ubuntu/
date: 2008-11-24 23:53:00 -05:00
comments: true
tags: 
- howto
- ubuntu
- mysql
---
This came in veeeerrryyy handy just now...<br />
<br />
<ol><li>Stop the MySQL Server<br />
<br />
sudo /etc/init.d/mysql stop<br />
&nbsp;</li>
<li>Start the mysqld config<br />
<br />
sudo mysqld --skip-grant-tables &amp;<br />
<br />
</li>
<li>Login to the server as root<br />
<br />
mysql -u root mysql<br />
<br />
</li>
<li>Ser your NEWPASSWORD<br />
<br />
UPDATE user SET Password=PASSWORD('NEWPASSWORD') WHERE User='root'; FLUSH PRIVILEGES; exit;</li>
</ol>
