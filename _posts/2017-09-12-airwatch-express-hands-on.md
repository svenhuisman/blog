---
id: 25321
title: AirWatch Express hands on
date: 2017-09-12T12:10:24+02:00
author: Sven Huisman
layout: post
guid: https://SvenHuisman.com/?p=25321
permalink: /2017/09/airwatch-express-hands-on/
categories:
  - Enterprise Mobility
tags:
  - AirWatch
  - Express
  - MDM
  - VMware
  - Workspace ONE
---
<a href="https://AirWatch Express is mobile device management made simple" target="_blank" rel="noopener noreferrer">AirWatch Express</a> is available for quite some time now, but I never had the chance to experience the features of this basic mobile device management (MDM) solution from VMware. I recently helped a customer to configure AirWatch Express and it really was &#8216;mobile device management made simple&#8217;. On the other hand, it offers really basic functionality, so if you need just a little bit more features you have to upgrade to the Green Suite (or <a href="https://www.vmware.com/products/workspace-one.html" target="_blank" rel="noopener noreferrer">Workspace ONE</a>).  
The features that AirWatch Express offers are:

  * **Devices**: Device management for Android, iOS, macOS and Windows devices.
  * **Apps**: Distribute apps from public app stores.
  * **Email**: Configure E-mail (Exchange Active sync).
  * **Wi-Fi**: Configure Wi-Fi.
  * **Integration**: Integrate with Directory services.
  * **Blueprints**: All configuration is done by creating blueprints. Just a couple of clicks to configure the policies.
  * **Security**: Create policies to secure your devices (remote wipe, lock, force encryption).
  * **Reports**: Use real-time dashboards to see information like security status, operating system, device ownership and more.

The get an impression of AirWatch Express, here are a couple of screenshots.

The first time you log on to your AirWatch Express console, you are guided through a setup:

[<img class="aligncenter size-large wp-image-25322" src="https://svenhuisman.com/wp-content/uploads/2017/09/AWE1-1024x509.jpg" alt="" width="650" height="323" srcset="https://svenhuisman.com/wp-content/uploads/2017/09/AWE1-1024x509.jpg 1024w, https://svenhuisman.com/wp-content/uploads/2017/09/AWE1-350x174.jpg 350w, https://svenhuisman.com/wp-content/uploads/2017/09/AWE1-768x382.jpg 768w, https://svenhuisman.com/wp-content/uploads/2017/09/AWE1-650x323.jpg 650w, https://svenhuisman.com/wp-content/uploads/2017/09/AWE1.jpg 1140w" sizes="(max-width: 650px) 100vw, 650px" />](https://svenhuisman.com/wp-content/uploads/2017/09/AWE1.jpg)

The first question you have to answer is if you are going to manage Apple devices. If so, you have to request a Apple Push Notification Certificate.

[<img class="aligncenter size-large wp-image-25323" src="https://svenhuisman.com/wp-content/uploads/2017/09/AWE2-1024x512.jpg" alt="" width="650" height="325" srcset="https://svenhuisman.com/wp-content/uploads/2017/09/AWE2-1024x512.jpg 1024w, https://svenhuisman.com/wp-content/uploads/2017/09/AWE2-350x175.jpg 350w, https://svenhuisman.com/wp-content/uploads/2017/09/AWE2-768x384.jpg 768w, https://svenhuisman.com/wp-content/uploads/2017/09/AWE2-650x325.jpg 650w, https://svenhuisman.com/wp-content/uploads/2017/09/AWE2.jpg 1242w" sizes="(max-width: 650px) 100vw, 650px" />](https://svenhuisman.com/wp-content/uploads/2017/09/AWE2.jpg)

After you downloaded the Certificate request file, uploaded it to Apple, downloaded the Apple certificate, you can then upload the Apple certificate to the AirWatch Express portal.

The next step is to install the VMware Enterprise Systems Connector (VMESC, also known as the AirWatch Cloud Connector). Enter a certificate password to secure the installer. You need this password to install the VMESC on an internal domain-joined server.

[<img class="aligncenter size-large wp-image-25324" src="https://svenhuisman.com/wp-content/uploads/2017/09/AWE3-1024x571.jpg" alt="" width="650" height="362" srcset="https://svenhuisman.com/wp-content/uploads/2017/09/AWE3-1024x571.jpg 1024w, https://svenhuisman.com/wp-content/uploads/2017/09/AWE3-350x195.jpg 350w, https://svenhuisman.com/wp-content/uploads/2017/09/AWE3-768x428.jpg 768w, https://svenhuisman.com/wp-content/uploads/2017/09/AWE3-650x362.jpg 650w, https://svenhuisman.com/wp-content/uploads/2017/09/AWE3.jpg 1251w" sizes="(max-width: 650px) 100vw, 650px" />](https://svenhuisman.com/wp-content/uploads/2017/09/AWE3.jpg)

This VMESC has an outgoing connection to your AirWatch Express environment.

Once the VMESC is installed and the connection is tested and successful, the Directory services can be configured. I recommend using a read-only AD service account:

[<img class="aligncenter size-large wp-image-25325" src="https://svenhuisman.com/wp-content/uploads/2017/09/AWE4-1024x668.jpg" alt="" width="650" height="424" srcset="https://svenhuisman.com/wp-content/uploads/2017/09/AWE4-1024x668.jpg 1024w, https://svenhuisman.com/wp-content/uploads/2017/09/AWE4-350x228.jpg 350w, https://svenhuisman.com/wp-content/uploads/2017/09/AWE4-768x501.jpg 768w, https://svenhuisman.com/wp-content/uploads/2017/09/AWE4-650x424.jpg 650w, https://svenhuisman.com/wp-content/uploads/2017/09/AWE4.jpg 1244w" sizes="(max-width: 650px) 100vw, 650px" />](https://svenhuisman.com/wp-content/uploads/2017/09/AWE4.jpg)

The final step of the configuration is set Up Apple&#8217;s Volume Purchase Program.

[<img class="aligncenter size-large wp-image-25326" src="https://svenhuisman.com/wp-content/uploads/2017/09/AWE5-1024x488.jpg" alt="" width="650" height="310" srcset="https://svenhuisman.com/wp-content/uploads/2017/09/AWE5-1024x488.jpg 1024w, https://svenhuisman.com/wp-content/uploads/2017/09/AWE5-350x167.jpg 350w, https://svenhuisman.com/wp-content/uploads/2017/09/AWE5-768x366.jpg 768w, https://svenhuisman.com/wp-content/uploads/2017/09/AWE5-650x310.jpg 650w, https://svenhuisman.com/wp-content/uploads/2017/09/AWE5.jpg 1246w" sizes="(max-width: 650px) 100vw, 650px" />](https://svenhuisman.com/wp-content/uploads/2017/09/AWE5.jpg)

This is an optional step. Once you finished the configuration, you are ready to create blueprints.

In the menu on the left, select Blueprints:

[<img class="aligncenter size-full wp-image-25327" src="https://svenhuisman.com/wp-content/uploads/2017/09/AWE6.jpg" alt="" width="215" height="443" srcset="https://svenhuisman.com/wp-content/uploads/2017/09/AWE6.jpg 215w, https://svenhuisman.com/wp-content/uploads/2017/09/AWE6-170x350.jpg 170w" sizes="(max-width: 215px) 100vw, 215px" />](https://svenhuisman.com/wp-content/uploads/2017/09/AWE6.jpg)

You are now presented with 7 steps to create a blueprint. In a blueprint, you configure Apps, resources and policies and assign the blueprint to users or user groups.

[<img class="aligncenter size-large wp-image-25328" src="https://svenhuisman.com/wp-content/uploads/2017/09/AWE7-1024x698.jpg" alt="" width="650" height="443" srcset="https://svenhuisman.com/wp-content/uploads/2017/09/AWE7-1024x698.jpg 1024w, https://svenhuisman.com/wp-content/uploads/2017/09/AWE7-350x239.jpg 350w, https://svenhuisman.com/wp-content/uploads/2017/09/AWE7-768x523.jpg 768w, https://svenhuisman.com/wp-content/uploads/2017/09/AWE7-650x443.jpg 650w, https://svenhuisman.com/wp-content/uploads/2017/09/AWE7.jpg 1300w" sizes="(max-width: 650px) 100vw, 650px" />](https://svenhuisman.com/wp-content/uploads/2017/09/AWE7.jpg)

First step is to give the blueprint a name:

[<img class="aligncenter size-large wp-image-25329" src="https://svenhuisman.com/wp-content/uploads/2017/09/AWE8-1024x698.jpg" alt="" width="650" height="443" srcset="https://svenhuisman.com/wp-content/uploads/2017/09/AWE8-1024x698.jpg 1024w, https://svenhuisman.com/wp-content/uploads/2017/09/AWE8-350x239.jpg 350w, https://svenhuisman.com/wp-content/uploads/2017/09/AWE8-768x523.jpg 768w, https://svenhuisman.com/wp-content/uploads/2017/09/AWE8-650x443.jpg 650w, https://svenhuisman.com/wp-content/uploads/2017/09/AWE8.jpg 1300w" sizes="(max-width: 650px) 100vw, 650px" />](https://svenhuisman.com/wp-content/uploads/2017/09/AWE8.jpg)

Add one or more applications to the blueprint:

[<img class="aligncenter size-large wp-image-25330" src="https://svenhuisman.com/wp-content/uploads/2017/09/AWE9-1024x698.jpg" alt="" width="650" height="443" srcset="https://svenhuisman.com/wp-content/uploads/2017/09/AWE9-1024x698.jpg 1024w, https://svenhuisman.com/wp-content/uploads/2017/09/AWE9-350x239.jpg 350w, https://svenhuisman.com/wp-content/uploads/2017/09/AWE9-768x523.jpg 768w, https://svenhuisman.com/wp-content/uploads/2017/09/AWE9-650x443.jpg 650w, https://svenhuisman.com/wp-content/uploads/2017/09/AWE9.jpg 1300w" sizes="(max-width: 650px) 100vw, 650px" />](https://svenhuisman.com/wp-content/uploads/2017/09/AWE9.jpg)

Configure Email and Wi-Fi.

[<img class="aligncenter size-large wp-image-25331" src="https://svenhuisman.com/wp-content/uploads/2017/09/AWE10-1024x698.jpg" alt="" width="650" height="443" srcset="https://svenhuisman.com/wp-content/uploads/2017/09/AWE10-1024x698.jpg 1024w, https://svenhuisman.com/wp-content/uploads/2017/09/AWE10-350x239.jpg 350w, https://svenhuisman.com/wp-content/uploads/2017/09/AWE10-768x523.jpg 768w, https://svenhuisman.com/wp-content/uploads/2017/09/AWE10-650x443.jpg 650w, https://svenhuisman.com/wp-content/uploads/2017/09/AWE10.jpg 1300w" sizes="(max-width: 650px) 100vw, 650px" />](https://svenhuisman.com/wp-content/uploads/2017/09/AWE10.jpg)

The Email configuration basically asks to enter the Exchange ActiveSync host and an account name (the name of the Email profile on the mobile devices). It seems that no other Email configurations are possible.

[<img class="aligncenter size-large wp-image-25332" src="https://svenhuisman.com/wp-content/uploads/2017/09/AWE11-1024x698.jpg" alt="" width="650" height="443" srcset="https://svenhuisman.com/wp-content/uploads/2017/09/AWE11-1024x698.jpg 1024w, https://svenhuisman.com/wp-content/uploads/2017/09/AWE11-350x239.jpg 350w, https://svenhuisman.com/wp-content/uploads/2017/09/AWE11-768x523.jpg 768w, https://svenhuisman.com/wp-content/uploads/2017/09/AWE11-650x443.jpg 650w, https://svenhuisman.com/wp-content/uploads/2017/09/AWE11.jpg 1300w" sizes="(max-width: 650px) 100vw, 650px" />](https://svenhuisman.com/wp-content/uploads/2017/09/AWE11.jpg)

Configuring Wi-Fi is also pretty basic. Security type can be set to: None, WEP, WPA or WPA2.

[<img class="aligncenter size-large wp-image-25333" src="https://svenhuisman.com/wp-content/uploads/2017/09/AWE12-1024x698.jpg" alt="" width="650" height="443" srcset="https://svenhuisman.com/wp-content/uploads/2017/09/AWE12-1024x698.jpg 1024w, https://svenhuisman.com/wp-content/uploads/2017/09/AWE12-350x239.jpg 350w, https://svenhuisman.com/wp-content/uploads/2017/09/AWE12-768x523.jpg 768w, https://svenhuisman.com/wp-content/uploads/2017/09/AWE12-650x443.jpg 650w, https://svenhuisman.com/wp-content/uploads/2017/09/AWE12.jpg 1300w" sizes="(max-width: 650px) 100vw, 650px" />](https://svenhuisman.com/wp-content/uploads/2017/09/AWE12.jpg)

The next step is to configure policies. You Can see which policies are applied to the different types of platforms. The &#8216;Require Passcode&#8217; policy is also very basic. If you want users to be able to use fingerprint are a pattern to unlock their phone, you can&#8217;t use this policy. Again, if you need more functionality, upgrade to Green.

[<img class="aligncenter size-large wp-image-25334" src="https://svenhuisman.com/wp-content/uploads/2017/09/AWE13-1024x698.jpg" alt="" width="650" height="443" srcset="https://svenhuisman.com/wp-content/uploads/2017/09/AWE13-1024x698.jpg 1024w, https://svenhuisman.com/wp-content/uploads/2017/09/AWE13-350x239.jpg 350w, https://svenhuisman.com/wp-content/uploads/2017/09/AWE13-768x523.jpg 768w, https://svenhuisman.com/wp-content/uploads/2017/09/AWE13-650x443.jpg 650w, https://svenhuisman.com/wp-content/uploads/2017/09/AWE13.jpg 1300w" sizes="(max-width: 650px) 100vw, 650px" />](https://svenhuisman.com/wp-content/uploads/2017/09/AWE13.jpg)

An overview of all the policies:

[<img class="aligncenter size-large wp-image-25335" src="https://svenhuisman.com/wp-content/uploads/2017/09/AWE14-1024x283.jpg" alt="" width="650" height="180" srcset="https://svenhuisman.com/wp-content/uploads/2017/09/AWE14-1024x283.jpg 1024w, https://svenhuisman.com/wp-content/uploads/2017/09/AWE14-350x97.jpg 350w, https://svenhuisman.com/wp-content/uploads/2017/09/AWE14-768x212.jpg 768w, https://svenhuisman.com/wp-content/uploads/2017/09/AWE14-650x179.jpg 650w, https://svenhuisman.com/wp-content/uploads/2017/09/AWE14.jpg 1054w" sizes="(max-width: 650px) 100vw, 650px" />](https://svenhuisman.com/wp-content/uploads/2017/09/AWE14.jpg) [<img class="aligncenter size-large wp-image-25336" src="https://svenhuisman.com/wp-content/uploads/2017/09/AWE15-1024x515.jpg" alt="" width="650" height="327" srcset="https://svenhuisman.com/wp-content/uploads/2017/09/AWE15-1024x515.jpg 1024w, https://svenhuisman.com/wp-content/uploads/2017/09/AWE15-350x176.jpg 350w, https://svenhuisman.com/wp-content/uploads/2017/09/AWE15-768x386.jpg 768w, https://svenhuisman.com/wp-content/uploads/2017/09/AWE15-650x327.jpg 650w, https://svenhuisman.com/wp-content/uploads/2017/09/AWE15.jpg 1052w" sizes="(max-width: 650px) 100vw, 650px" />](https://svenhuisman.com/wp-content/uploads/2017/09/AWE15.jpg)

Final step is to assign users or groups to the policy:

[<img class="aligncenter size-large wp-image-25337" src="https://svenhuisman.com/wp-content/uploads/2017/09/AWE16-1024x698.jpg" alt="" width="650" height="443" srcset="https://svenhuisman.com/wp-content/uploads/2017/09/AWE16-1024x698.jpg 1024w, https://svenhuisman.com/wp-content/uploads/2017/09/AWE16-350x239.jpg 350w, https://svenhuisman.com/wp-content/uploads/2017/09/AWE16-768x523.jpg 768w, https://svenhuisman.com/wp-content/uploads/2017/09/AWE16-650x443.jpg 650w, https://svenhuisman.com/wp-content/uploads/2017/09/AWE16.jpg 1300w" sizes="(max-width: 650px) 100vw, 650px" />](https://svenhuisman.com/wp-content/uploads/2017/09/AWE16.jpg)

Finally, you can publish the blueprint. Immediately it becomes active:

[<img class="aligncenter size-large wp-image-25338" src="https://svenhuisman.com/wp-content/uploads/2017/09/AWE17-1024x698.jpg" alt="" width="650" height="443" srcset="https://svenhuisman.com/wp-content/uploads/2017/09/AWE17-1024x698.jpg 1024w, https://svenhuisman.com/wp-content/uploads/2017/09/AWE17-350x239.jpg 350w, https://svenhuisman.com/wp-content/uploads/2017/09/AWE17-768x523.jpg 768w, https://svenhuisman.com/wp-content/uploads/2017/09/AWE17-650x443.jpg 650w, https://svenhuisman.com/wp-content/uploads/2017/09/AWE17.jpg 1300w" sizes="(max-width: 650px) 100vw, 650px" />](https://svenhuisman.com/wp-content/uploads/2017/09/AWE17.jpg)

In the dashboard you get a nice overview of the status of your devices:

[<img class="aligncenter size-large wp-image-25339" src="https://svenhuisman.com/wp-content/uploads/2017/09/AWE18-1024x635.jpg" alt="" width="650" height="403" srcset="https://svenhuisman.com/wp-content/uploads/2017/09/AWE18-1024x635.jpg 1024w, https://svenhuisman.com/wp-content/uploads/2017/09/AWE18-350x217.jpg 350w, https://svenhuisman.com/wp-content/uploads/2017/09/AWE18-768x476.jpg 768w, https://svenhuisman.com/wp-content/uploads/2017/09/AWE18-650x403.jpg 650w, https://svenhuisman.com/wp-content/uploads/2017/09/AWE18.jpg 1361w" sizes="(max-width: 650px) 100vw, 650px" />](https://svenhuisman.com/wp-content/uploads/2017/09/AWE18.jpg) [<img class="aligncenter size-large wp-image-25340" src="https://svenhuisman.com/wp-content/uploads/2017/09/AWE19.jpg" alt="" width="650" height="160" srcset="https://svenhuisman.com/wp-content/uploads/2017/09/AWE19.jpg 755w, https://svenhuisman.com/wp-content/uploads/2017/09/AWE19-350x86.jpg 350w, https://svenhuisman.com/wp-content/uploads/2017/09/AWE19-650x160.jpg 650w" sizes="(max-width: 650px) 100vw, 650px" />](https://svenhuisman.com/wp-content/uploads/2017/09/AWE19.jpg)

If you select one of the devices, and you go to profiles, you can actually get an overview of the profiles that are created by the blueprints:

[<img class="aligncenter size-large wp-image-25341" src="https://svenhuisman.com/wp-content/uploads/2017/09/AWE20.jpg" alt="" width="482" height="460" srcset="https://svenhuisman.com/wp-content/uploads/2017/09/AWE20.jpg 482w, https://svenhuisman.com/wp-content/uploads/2017/09/AWE20-350x334.jpg 350w" sizes="(max-width: 482px) 100vw, 482px" />](https://svenhuisman.com/wp-content/uploads/2017/09/AWE20.jpg)

You can also open the profiles to see what&#8217;s in it, but unfortunately you cannot edit the profiles. These are the profiles you normally configure with the other AirWatch suites.

[<img class="aligncenter size-large wp-image-25342" src="https://svenhuisman.com/wp-content/uploads/2017/09/AWE21-1024x879.jpg" alt="" width="650" height="558" srcset="https://svenhuisman.com/wp-content/uploads/2017/09/AWE21-1024x879.jpg 1024w, https://svenhuisman.com/wp-content/uploads/2017/09/AWE21-350x300.jpg 350w, https://svenhuisman.com/wp-content/uploads/2017/09/AWE21-768x659.jpg 768w, https://svenhuisman.com/wp-content/uploads/2017/09/AWE21-650x558.jpg 650w, https://svenhuisman.com/wp-content/uploads/2017/09/AWE21.jpg 1056w" sizes="(max-width: 650px) 100vw, 650px" />](https://svenhuisman.com/wp-content/uploads/2017/09/AWE21.jpg)

This was a quick overview of the AirWatch Express features. It&#8217;s pretty easy to configure and to setup, but also very basic. If you need more functionality, consider one of the other AirWatch suites or one of the Workspace ONE editions.