---
id: 2494
title: Secure your VMware View security server!
date: 2013-02-05T11:16:19+02:00
author: Sven Huisman
layout: post
guid: http://virtualfuture.info/?p=2494
permalink: /2013/02/secure-your-vmware-view-security-server/
categories:
  - Virtual Desktop
tags:
  - Security Server
  - SSL
  - View
  - VMware
---
Recently, one of my customers had a security scan performed on the infrastructure and the result was that the VMware View security server was configured to support a couple of weak cipher suites. As it turns out, there is a VMware KB-article that describes how to configure the security server with SSL protocols and Cipher suites: <a title="KB1021466" href="http://kb.vmware.com/selfservice/microsites/search.do?language=en_US&cmd=displayKC&externalId=1021466" target="_blank">Configure cipher suites and security protocols on a View Connection server instance or security server in View 4.5 and later</a>.

How to solve this:

&#8211; Create a text-file called: locked.properties (Usually located in &#8220;c:\program files\VMware\VMware View\Server\sslgateway\conf\&#8221;)

&#8211; The locked.properties file should look like this:

<div>
  <code>secureProtocols.1=SSLv3&lt;br />
secureProtocols.2=TLSv1&lt;br />
enabledCipherSuite.1=SSL_RSA_WITH_RC4_128_MD5&lt;br />
enabledCipherSuite.2=SSL_RSA_WITH_RC4_128_SHA&lt;br />
enabledCipherSuite.3=TLS_RSA_WITH_AES_128_CBC_SHA&lt;br />
enabledCipherSuite.4=TLS_DHE_RSA_WITH_AES_128_CBC_SHA&lt;br />
enabledCipherSuite.5=TLS_DHE_DSS_WITH_AES_128_CBC_SHA&lt;br />
enabledCipherSuite.6=SSL_RSA_WITH_3DES_EDE_CBC_SHA&lt;br />
enabledCipherSuite.7=SSL_DHE_RSA_WITH_3DES_EDE_CBC_SHA&lt;br />
enabledCipherSuite.8=SSL_DHE_DSS_WITH_3DES_EDE_CBC_SHA&lt;br />
</code>
</div>

How do you know these are safe cipher suites that you can use? I found the following website and you can see that the Cipher suites mentioned in the KB-article are safe to use:

[http://www.techstacks.com/howto/j2se5\_ssl\_cipher_strength.html](http://www.techstacks.com/howto/j2se5_ssl_cipher_strength.html)