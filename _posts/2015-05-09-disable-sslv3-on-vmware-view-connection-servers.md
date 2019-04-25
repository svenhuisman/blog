---
id: 3718
title: Disable SSLv3 on VMware View Connection servers
date: 2015-05-09T21:48:02+02:00
author: Sven Huisman
layout: post
guid: http://SvenHuisman.com/?p=3718
permalink: /2015/05/disable-sslv3-on-vmware-view-connection-servers/
categories:
  - Virtual Desktop
tags:
  - Horizon
  - VMware
  - VMware View
---
You might have missed this <a href="http://kb.vmware.com/selfservice/microsites/search.do?language=en_US&cmd=displayKC&externalId=2094442&src=vmw_so_vex_shuis_302" target="_blank">VMware KB2094442</a> from VMware and you might not realise that when you are using VMware Horizon View 6.0.x or older, you could still be using SSLv3 when you enabled the Horizon Blast protocol:

> _The Secure Gateway, which provides a secure tunnel for carrying RDP and other data over HTTPS, listens on port 443 by default. SSLv3 connections to the secure tunnel are disabled by default._
> 
> _The Blast Secure Gateway (BSG) provides browser access to View desktops over HTTPS. This gateway listens on port 8443 by default. SSLv3 connections to the BSG are not disabled by default on security server or View Connection Server versions 5.2.x, 5.3.0, 5.3.1, 5.3.2, and 6.0.x. _

Why should you disable SSLv3? Apparently, there has been discovered a vulnarability (back in October 2014) and this vulnerability allows the plaintext of secure connections to be calculated by a network attacker (http://googleonlinesecurity.blogspot.nl/2014/10/this-poodle-bites-exploiting-ssl-30.html).

Upgrading VMware Horizon 6.1 solves this issue and disables SSLv3. If you are not upgrading any time soon, you should follow the steps described in the knowledge base article:

You can disable SSLv3 access to the Blast Secure Gateway by editing the absg-config.js file on a security server or View Connection Server instance.

<div>
  1. On each security server or View Connection Server instance, open the absg-config.js file in a text editor. The file is located in the following path:C:\Program Files\VMware\VMware View\Server\appblastgateway\lib\This path applies to security server or View Connection Server 5.2.x, 5.3.x, and 6.0.x.</p> 
  
  <p>
    2. Add the following line near the beginning of the file:
  </p>
  
  <p>
    var constants = require(&#8216;constants&#8217;);
  </p>
  
  <p>
    For example, you can insert this line around line 5, above the existing line:
  </p>
  
  <p>
    exports.load = &#8230;
  </p>
</div>

<div>
  3. Scroll to the getHttps() function, around line 119, and place your cursor just above the existing line:return option;Insert the following two lines:</p> 
  
  <p>
    option.secureProtocol = &#8216;SSLv23_method&#8217;;
  </p>
</div>

<div>
    option.secureOptions = constants.SSL_OP_NO_SSLv2 | constants.SSL_OP_NO_SSLv3;<br /> <img class="aligncenter  wp-image-3719" src="https://svenhuisman.com/wp-content/uploads/2015/05/Screen-Shot-2015-05-09-at-21.23.05.png" alt="Screen Shot 2015-05-09 at 21.23.05" width="783" height="575" srcset="https://svenhuisman.com/wp-content/uploads/2015/05/Screen-Shot-2015-05-09-at-21.23.05.png 1526w, https://svenhuisman.com/wp-content/uploads/2015/05/Screen-Shot-2015-05-09-at-21.23.05-350x257.png 350w, https://svenhuisman.com/wp-content/uploads/2015/05/Screen-Shot-2015-05-09-at-21.23.05-1024x752.png 1024w, https://svenhuisman.com/wp-content/uploads/2015/05/Screen-Shot-2015-05-09-at-21.23.05-650x477.png 650w" sizes="(max-width: 783px) 100vw, 783px" /><br /> The secureOptions attribute disables SSLv2 and SSLv3.  These lines set attributes in the &#8216;option&#8217; object programmatically.
</div>

<div>
</div>

<div>
  4.  Restart the VMware Horizon View Blast Secure Gateway service.
</div>

<div>
</div>

<div>
  5.  Repeat these steps on all security servers and View Connection Server instances in the pod.
</div>

<div>
</div>