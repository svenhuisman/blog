---
id: 1535
title: 'Introduction to Citrix XenDesktop 4 [BlogBattle]'
date: 2009-11-23T22:28:31+02:00
author: Matthijs Haverink
layout: post
guid: http://virtualfuture.info/?p=1535
permalink: /2009/11/introduction-to-citrix-xendesktop-4-blogbattle/
categories:
  - VDI Blog Battle
  - Virtual Desktop
tags:
  - Citrix
  - Desktop Virtualization
  - VDI BlogBattle
  - View 4
  - Virtual Desktop
  - XenDesktop 4
---
<a href="http://www.citrix.com" target="_blank"><img class="alignleft size-full wp-image-1565" title="citrix_logo" src="https://svenhuisman.com/wp-content/uploads/2009/11/citrix_logo.gif" alt="citrix_logo" width="93" height="35" />Citrix</a> last week released their Virtual Desktop product named <a href="http://www.citrix.com/xendesktop4" target="_blank">Citrix XenDesktop 4</a>. For Citrix it is the 3rd (have you ever seen 1.0 ?) generation of their VDI product. As part of the <a href="https://svenhuisman.com/2009/11/bloggers-battle-citrix-xendesktop-vs-vmware-view/" target="_self">VDI Blog Battle</a>. I&#8217;ll be using this post to update you on the architecture and basic info concerning Citrix XenDesktop 4.

**What is Citrix XenDesktop ?**

In <a href="https://svenhuisman.com/2009/11/vdi-blog-battle-part-1-citrix-xendesktop-4-introduction/" target="_self">my previous post</a>, and in <a href="https://svenhuisman.com/2009/11/bloggers-battle-desktop-virtualization-is-the-way-to-go/" target="_self">Svens previous post</a> we already explained what VDI is so I’ll skip that part.

Citrix announced XenDesktop 4 like this:

> “A groundbreaking new product that makes virtual desktops a mainstream reality for hundreds of millions of corporate users for the first time ever.”

<!--more-->

  
I’m not sure if version 4.0 will be the version that will make virtual desktops mainstream for hundreds of millions of corporate users but it is a very good step. Definitely when you look at the rest of the products in the market, Citrix has a rock-solid Virtual Desktop solution.

**_Components:_**

Citrix XenDesktop 4 lets you install the following components:

&#8211; **License Server** : necessity  
&#8211; **Destop Delivery Controller** : the broker  
&#8211; **Datastore Database** : stores the configuration  
&#8211; **Provisioning Server** : streams OS images to VM’s or physical machines !  
&#8211; **Web Interface** : presentation to the user  
&#8211; **Secure/Access Gateway** : arranges access to “the outside”

They fit together like this:

<p style="text-align: center;">
  <a href="https://svenhuisman.com/wp-content/uploads/2009/11/XD4architecture.jpg"><img class="aligncenter size-medium wp-image-1537" title="XD4architecture" src="https://svenhuisman.com/wp-content/uploads/2009/11/XD4architecture-350x145.jpg" alt="XD4architecture" width="350" height="145" srcset="https://svenhuisman.com/wp-content/uploads/2009/11/XD4architecture-350x145.jpg 350w, https://svenhuisman.com/wp-content/uploads/2009/11/XD4architecture-1024x424.jpg 1024w" sizes="(max-width: 350px) 100vw, 350px" /></a>
</p>

 _**The new features:**_

• **FlexCast delivery technology** – adapting the solution to the situation.  
• **Full XenApp integration** – delivering apps and desktops in the most dynamic way.  
•**HDX Mediastream**– flash redirection / audio optimization, wmp support for Vista and Win7.  
• **HDX Plug-n-Play Multi-Monitor Support** – Support for multiple monitors in U and L shaped configurations.  
• **HDX Intellicache**– XenDesktop integrates with the Citrix Repeater so that ICA for XD is accelerated.  
• **Smartcard features extend** – Vista and Win7 support : smooth roaming, multiple cards, multiple readers etc.  
• **Enhanced USB support**– web-cams, headsets, scanners, dongles, tablets, 3d mice etc.

As you can see, a big part of the enhancements is in the HDX area, which is a bundle of techniques that enrich the multimedia experience of the Citrix end-user tremendously. This is one of the many big advantages of Citrix XenDesktop 4 over <a href="http://www.vmware.com/view" target="_blank">VMware View 4</a>. In the next post I&#8217;ll tell you more about the unique features that XenDesktop has.

I’d like to keep the outline of this post the same as Sven did with his intro of View 4. The only thing is that Sven had a chapter _What’s missing_, and I wouldn’t know what to put in there ;). Well, the only thing that is missing is the option to get your virtual desktop available off-line on a laptop for example, but hey, that&#8217;s experimental on View 4 too.

Well, I&#8217;m partially serious concerning the lack of downsides on XenDesktop 4, so hereby I&#8217;m challenging you to name them !

This was my intro to XD4, thank you for reading and watch closely because later this week you&#8217;ll get a more comparative &#8220;view&#8221; on View 4 and XenDesktop 4 !