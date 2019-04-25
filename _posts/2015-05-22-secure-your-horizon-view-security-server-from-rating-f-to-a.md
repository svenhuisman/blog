---
id: 3988
title: 'Secure your Horizon View security server: from rating F to A-'
date: 2015-05-22T11:34:37+02:00
author: Sven Huisman
layout: post
guid: http://SvenHuisman.com/?p=3988
permalink: /2015/05/secure-your-horizon-view-security-server-from-rating-f-to-a/
categories:
  - Virtual Desktop
tags:
  - Horizon
  - Security Server
  - SSL
  - View
  - VMware
---
After <a href="https://svenhuisman.com/2015/05/disable-sslv3-on-vmware-view-connection-servers/" target="_blank">disabling SSLv3 on your Horizon View connection</a> and security servers there are a couple steps you should take to even further secure your Horizon View environment. If you test your environment with <a href="https://www.ssllabs.com/ssltest/index.html" target="_blank">the SSL server test from Qualys</a>, you will probably get a rating of F:

[<img class="aligncenter  wp-image-3989" src="https://svenhuisman.com/wp-content/uploads/2015/05/Screen-Shot-2015-05-22-at-09.58.16.png" alt="SSL rating F" width="455" height="332" srcset="https://svenhuisman.com/wp-content/uploads/2015/05/Screen-Shot-2015-05-22-at-09.58.16.png 1622w, https://svenhuisman.com/wp-content/uploads/2015/05/Screen-Shot-2015-05-22-at-09.58.16-350x255.png 350w, https://svenhuisman.com/wp-content/uploads/2015/05/Screen-Shot-2015-05-22-at-09.58.16-1024x746.png 1024w, https://svenhuisman.com/wp-content/uploads/2015/05/Screen-Shot-2015-05-22-at-09.58.16-650x474.png 650w" sizes="(max-width: 455px) 100vw, 455px" />](https://svenhuisman.com/wp-content/uploads/2015/05/Screen-Shot-2015-05-22-at-09.58.16.png)

&nbsp;

To get a rating of A-, you should take the following steps (described in the <a href="https://pubs.vmware.com/horizon-view-60/topic/com.vmware.ICbase/PDF/horizon-view-60-security.pdf" target="_blank">Horizon View 6 security reference</a>):

<div>
  <p>
    <strong>1. Update the JCE Policy Files to Support High-Strength Cipher Suites</strong>
  </p>
  
  <p>
    You can add high-strength cipher suites for greater assurance, but first you must update the local_policy.jar and US_export_policy.jar policy files for JRE 7 on each View Connection Server instance and security server. You update these policy files by downloading the <a href="http://www.oracle.com/technetwork/java/javase/downloads/jce-7-download-432124.html" target="_blank">Java Cryptography Extension (JCE) Unlimited Strength Jurisdiction Policy Files 7</a> from the Oracle Java SE Download site.
  </p>
  
  <p lang="en-US">
    If you include high-strength cipher suites in the list and do not replace the policy files, you cannot restart the VMware Horizon View Connection Server service.
  </p>
  
  <p lang="en-US">
    The policy files are located in the C:\Program Files\VMware\VMware View\Server\jre\lib\security directory.
  </p>
  
  <p lang="en-US">
    <a href="https://svenhuisman.com/wp-content/uploads/2015/05/Screen-Shot-2015-05-22-at-10.10.46.png"><img class="aligncenter  wp-image-3991" src="https://svenhuisman.com/wp-content/uploads/2015/05/Screen-Shot-2015-05-22-at-10.10.46.png" alt="java" width="284" height="264" srcset="https://svenhuisman.com/wp-content/uploads/2015/05/Screen-Shot-2015-05-22-at-10.10.46.png 586w, https://svenhuisman.com/wp-content/uploads/2015/05/Screen-Shot-2015-05-22-at-10.10.46-350x325.png 350w" sizes="(max-width: 284px) 100vw, 284px" /></a>
  </p>
  
  <p lang="en-US">
    After you update the policy files, you must create backups of the files. If you upgrade the View Connection Server instance or security server, any changes that you have made to these files might be overwritten, and you might have to restore the files from the backup.
  </p>
  
  <p>
    <strong>2. Change the Global Acceptance Polices with ADSI Edit</strong>
  </p>
  
  <ul>
    <li>
      Start the ADSI Edit utility on your View Connection Server computer.
    </li>
    <li>
      In the console tree, select Connect to
    </li>
    <li>
      In the Select or type a Distinguished Name or Naming Context text box, type the distinguished name<br /> DC=vdi, DC=vmware, DC=int.
    </li>
    <li>
      In the Select or type a domain or server text box, select or type localhost:389 or the fully qualified domain name (FQDN) of the View Connection Server computer followed by port 389.
    </li>
  </ul>
  
  <p>
    <a href="https://svenhuisman.com/wp-content/uploads/2015/05/Screen-Shot-2015-05-22-at-10.15.29.png"><img class="aligncenter  wp-image-3992" src="https://svenhuisman.com/wp-content/uploads/2015/05/Screen-Shot-2015-05-22-at-10.15.29.png" alt="ADSI-edit" width="269" height="268" srcset="https://svenhuisman.com/wp-content/uploads/2015/05/Screen-Shot-2015-05-22-at-10.15.29.png 790w, https://svenhuisman.com/wp-content/uploads/2015/05/Screen-Shot-2015-05-22-at-10.15.29-200x200.png 200w, https://svenhuisman.com/wp-content/uploads/2015/05/Screen-Shot-2015-05-22-at-10.15.29-350x350.png 350w, https://svenhuisman.com/wp-content/uploads/2015/05/Screen-Shot-2015-05-22-at-10.15.29-650x648.png 650w, https://svenhuisman.com/wp-content/uploads/2015/05/Screen-Shot-2015-05-22-at-10.15.29-150x150.png 150w" sizes="(max-width: 269px) 100vw, 269px" /></a>
  </p>
  
  <ul>
    <li>
      Expand the ADSI Edit tree, expand OU=Properties, select OU=Global, and select OU=Common in the right pane.
    </li>
    <li>
      On the object CN=Common, OU=Global, OU=Properties, select each attribute that you want to change and type the new list of security protocols or cipher suites.
    </li>
  </ul>
  
  <p>
    I selected these protocols and cipher suites, make sure you test all your clients and that they support the protocols and cipher suites you enable:
  </p>
  
  <blockquote>
    <p>
      pae-ServerSSLCipherSuites: \LIST:TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256,TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA,TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384,TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA,TLS_RSA_WITH_AES_256_CBC_SHA256,TLS_RSA_WITH_AES_128_CBC_SHA256,TLS_RSA_WITH_AES_256_CBC_SHA,TLS_RSA_WITH_AES_128_CBC_SHA
    </p>
    
    <p>
      pae-ServerSSLSecureProtocols: \LIST:TLSv1.2,TLSv1.1,TLSv1
    </p>
    
    <p>
      pae-ClientSSLCipherSuites: \LIST:TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256,TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA,TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384,TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA,TLS_RSA_WITH_AES_256_CBC_SHA256,TLS_RSA_WITH_AES_128_CBC_SHA256,TLS_RSA_WITH_AES_256_CBC_SHA,TLS_RSA_WITH_AES_128_CBC_SHA
    </p>
    
    <p>
      pae-ClientSSLSecureProtocols: \LIST:TLSv1.2,TLSv1.1,TLSv1
    </p>
  </blockquote>
  
  <ul>
    <li>
      Restart the VMware Horizon View Connection Server service (on the Connection and Security servers).
    </li>
  </ul>
  
  <p>
    You can also create a locked.properties file and put it in C:\Program Files\VMware\VMware View\Server\sslgateway\conf on the security servers. Enter this in the locked.properties file:
  </p>
  
  <blockquote>
    <p>
      <em>secureProtocols.3=TLSv1</em><br /> <em>secureProtocols.2=TLSv1.1</em><br /> <em>secureProtocols.1=TLSv1.2</em>
    </p>
    
    <p>
      <em>preferredSecureProtocol=TLSv1.2</em><br /> <em>enabledCipherSuite.1=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256</em><br /> <em>enabledCipherSuite.2=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA</em><br /> <em>enabledCipherSuite.3=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384</em><br /> <em>enabledCipherSuite.4=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA</em><br /> <em>enabledCipherSuite.5=TLS_RSA_WITH_AES_256_CBC_SHA256</em><br /> <em>enabledCipherSuite.6=TLS_RSA_WITH_AES_128_CBC_SHA256</em><br /> <em>enabledCipherSuite.7=TLS_RSA_WITH_AES_256_CBC_SHA</em><br /> <em>enabledCipherSuite.8=TLS_RSA_WITH_AES_128_CBC_SHA</em>
    </p>
  </blockquote>
  
  <p>
    And then restart the security service.
  </p>
  
  <p>
    Now you will have rating A-:
  </p>
  
  <p>
    <a href="https://svenhuisman.com/wp-content/uploads/2015/05/Screen-Shot-2015-05-22-at-11.19.32.png"><img class="aligncenter  wp-image-3990" src="https://svenhuisman.com/wp-content/uploads/2015/05/Screen-Shot-2015-05-22-at-11.19.32.png" alt="SSL Rating A-" width="598" height="342" srcset="https://svenhuisman.com/wp-content/uploads/2015/05/Screen-Shot-2015-05-22-at-11.19.32.png 1618w, https://svenhuisman.com/wp-content/uploads/2015/05/Screen-Shot-2015-05-22-at-11.19.32-350x200.png 350w, https://svenhuisman.com/wp-content/uploads/2015/05/Screen-Shot-2015-05-22-at-11.19.32-1024x586.png 1024w, https://svenhuisman.com/wp-content/uploads/2015/05/Screen-Shot-2015-05-22-at-11.19.32-650x372.png 650w" sizes="(max-width: 598px) 100vw, 598px" /></a>
  </p>
</div>

For now, I&#8217;m happy with the A- rating.

If you want IE8 on Windows XP still to work, add this cipher suite: TLS\_RSA\_WITH\_RC4\_128_SHA

The rating will then be a B.