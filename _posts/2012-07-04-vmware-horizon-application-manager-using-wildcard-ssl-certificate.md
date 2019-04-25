---
id: 2368
title: 'VMware Horizon Application Manager &#8211; Using wildcard SSL certificate'
date: 2012-07-04T20:55:46+02:00
author: Sven Huisman
layout: post
guid: https://svenhuisman.com/?p=2368
permalink: /2012/07/vmware-horizon-application-manager-using-wildcard-ssl-certificate/
categories:
  - Workspace Management
tags:
  - Horizon App Manager
  - Horizon Application Manager
  - SSL
  - VMware
---
As I can not find any documentation on how to do this, I might as well write a little blogpost about this topic. If it is not interesting for you, at least it is an online documentation for myself. The problem that I had was that I already had a wildcard certificate in a PFX file format that I wanted to use and I couldn’t get that into the certificate keystore that <a href="http://www.vmware.com/products/desktop_virtualization/horizon-application-manager/overview.html" target="_blank">Horizon Application Manager</a> uses. I posted my question on twitter and on the <a href="http://communities.vmware.com/message/2064575#2064575" target="_blank">VMware community forum</a>. <a href="http://www.itbloodpressure.com/2012/06/23/setting-up-horizon-application-manager-with-a-internal-ca/" target="_blank">Dwayne Lessner</a> had the same problem and he was able to configure Horizon with a certificate from an internal CA. Unfortunately, his steps did not help me. Luckily, <a href="http://twitter.com/#!/vmware_guy" target="_blank">Mike Barnett</a> from <a href="http://www.vmware.com" target="_blank">VMware</a> offered to help me out and in this blogpost I describe the steps he took the get it working. Follow these steps if you have a PFX wildcard certificate and want to use it with Horizon Application manager.

<!--more-->

First of all, there are 2 virtual appliances and they both need the wildcard certificate: the Horizon application manager virtual appliance and the Horizon application manager connector appliance.

1 ) Put the wildcard certificate (certificate.pfx), the rootCA certificate (rootca.crt) and the intermediate certificate (intermediate.crt) on the Horizon application manager virtual appliance. You can use <a href="http://winscp.net/eng/download.php" target="_blank">WinSCP</a> or <a href="http://www.veeam.com/virtual-machine-backup-solution-free.html" target="_blank">VeeamZIP</a> to logon to the appliance and transfer the files to \tmp\ssl for example. In the following steps the password on the PFX file is “password”.

2 ) Create a new keystore using certificate.pfx using the following cmd (The keytool command is located at _/usr/java/jre-vmware/bin)_:

**./keytool -importkeystore -srckeystore /tmp/SSL/certificate.pfx -destkeystore tcserver.keystore -srcstoretype pkcs12 -srcstorepass password -deststorepass changeme**

3 ) Import the rootCA certificate into the keystore:

**./keytool -import -keystore tcserver.keystore -storepass changeme -alias rootCA -file /tmp/SSL/rootca.crt**

4 ) Import the intermediate certificate into the keystore:

**./keytool -import -keystore tcserver.keystore -storepass changeme -alias intermediateCA -file /tmp/SSL/intermediate.crt**

5 ) Show the certificate in the keystore to get the alias. You should look for Entry Type: PrivateKeyEntry. The Alias is mentioned above that:

**./keytool -list -v -keystore tcserver.keystore | more**

(password is &#8220;changeme&#8221;)

[<img style="background-image: none; padding-top: 0px; padding-left: 0px; display: inline; padding-right: 0px; border: 0px;" title="Capture" src="https://svenhuisman.com/wp-content/uploads/2012/07/Capture_thumb.png" alt="Capture" width="244" height="200" border="0" />](https://svenhuisman.com/wp-content/uploads/2012/07/Capture.png)

6 ) Change the alias to “tcserver”. Use this command:

**./keytool -changealias -alias {oldalias} -destalias tcserver -keystore tcserver.keystore -storepass changeme**

7 ) Change the password of the alias key entry

**./keytool -keypasswd -alias tcserver -keypass password -new changeme -keystore tcserver.keystore**

8 ) Rename the old keystore:

**mv /opt/vmware/horizon/horizoninstance/conf/tcserver.keystore /opt/vmware/horizon/horizoninstance/conf/tcserver.keystore.old**

9 ) Copy the new keystore:

**cp tcserver.keystore /opt/vmware/horizon/horizoninstance/conf/**

10 ) Change the rights on the file:  
**chmod 750 /opt/vmware/horizon/horizoninstance/conf/tcserver.keystore**

11 ) Restart the Tomcat web server from the console or the commandline.

Now you have to do the same thing for the Horizon application manager connector appliance. One difference is the location of the keystore: **/opt/vmware/c2/c2instance/conf/tcserver.keystore**

You could also use the tcserver.keystore from the Horizon Application Manager Appliance you just created and copy it to the connector appliance.

Another thing you have to do is to import the SSL certificate from the Horizon Application Manager into the Connector appliance using the console:

[<img style="background-image: none; padding-top: 0px; padding-left: 0px; display: inline; padding-right: 0px; border: 0px;" title="Capture2" src="https://svenhuisman.com/wp-content/uploads/2012/07/Capture2_thumb.png" alt="Capture2" width="525" height="293" border="0" />](https://svenhuisman.com/wp-content/uploads/2012/07/Capture2.png)

Select “Configure”

[<img style="background-image: none; padding-top: 0px; padding-left: 0px; display: inline; padding-right: 0px; border: 0px;" title="Capture3" src="https://svenhuisman.com/wp-content/uploads/2012/07/Capture3_thumb.png" alt="Capture3" width="528" height="294" border="0" />](https://svenhuisman.com/wp-content/uploads/2012/07/Capture3.png)

Select “3”. (In the screenshots, the certificate was already imported).

[<img style="background-image: none; padding-top: 0px; padding-left: 0px; display: inline; padding-right: 0px; border: 0px;" title="Capture4" src="https://svenhuisman.com/wp-content/uploads/2012/07/Capture4_thumb.png" alt="Capture4" width="530" height="295" border="0" />](https://svenhuisman.com/wp-content/uploads/2012/07/Capture4.png)

Press “ENTER” if the correct domain name is displayed.

The certificate will now be imported.

And now you’re done!