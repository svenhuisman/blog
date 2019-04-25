---
id: 1606
title: XenDesktop on VMware VI/vSphere
date: 2009-12-15T23:53:50+02:00
author: Sven Huisman
layout: post
guid: https://svenhuisman.com/?p=1606
permalink: /2009/12/xendesktop-on-vmware/
categories:
  - VDI Blog Battle
  - Virtual Desktop
tags:
  - Citrix
  - VMware
  - Xendesktop
---
As I was playing around with XenDesktop 4, I had some trouble connecting the Citrix Desktop Delivery Controller to the vCenter server. And as 95% of Xendesktop deployments are on VMware VI or vSphere, I thought this tip could be useful for you as wel. <!--more-->

What I was asked to do when creating a desktop group was to enter the vCenter Server address in the following format:

https://<vCenter server name>/sdk

(BTW, this address is case sensitive)

[<img class="aligncenter size-thumbnail wp-image-1605" title="xendesktop" src="https://svenhuisman.com/wp-content/uploads/2009/12/xendesktop-200x200.PNG" alt="xendesktop" width="200" height="200" srcset="https://svenhuisman.com/wp-content/uploads/2009/12/xendesktop-200x200.PNG 200w, https://svenhuisman.com/wp-content/uploads/2009/12/xendesktop-250x250.PNG 250w, https://svenhuisman.com/wp-content/uploads/2009/12/xendesktop-75x75.PNG 75w" sizes="(max-width: 200px) 100vw, 200px" />](https://svenhuisman.com/wp-content/uploads/2009/12/xendesktop.PNG)

The Desktop Delivery Controller only accepts a trusted certificate and by default, that is not the case with vCenter&#8217;s SDK website. So you have 3 options:

  * import the certificate that is used with vCenter server on the Desktop Delivery Controller server.
  * Use a trusted certificate.
  * Enable HTTP on the SDK website. 

For test/demo environments you can use the last option, for production I would recommend the second option. Jarian Gibson wrote an <a title="xendesktop on vmware" href="https://jariangibson.com/2009/10/13/using-xendesktop-with-vmware/" target="_blank">article</a> that describes how to do this.