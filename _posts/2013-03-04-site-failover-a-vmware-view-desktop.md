---
id: 2502
title: Site-failover a VMware View Stateful desktop, not supported?!
date: 2013-03-04T14:00:08+02:00
author: Sven Huisman
layout: post
guid: http://virtualfuture.info/?p=2502
permalink: /2013/03/site-failover-a-vmware-view-desktop/
categories:
  - Virtual Desktop
tags:
  - Desktop
  - failover
  - Site recovery
  - stateful
  - stateless
  - VMware View
---
In this blogpost I describe the challenge with stateful desktops in a multi-datacenter View environment: VMware doesn&#8217;t support it!

**Stateful vs. Stateless**

In my opinion, a stateful desktop is a desktop, usually with a static user assignment, where the user can make changes to the system, like installing applications. A stateless desktop is a desktop in a desktop pool with a floating assignment and configured to refresh after the user logs off. It&#8217;s no problem to failover a user to another View site, using stateless desktops. This blogposts is about site-failover a stateful desktop.

**Multi-datacenter View architecture**

A typical VMware View architecture is based on the concept of View blocks and pods. A View block consist of one or more vSphere clusters with a maximum of 2000 virtual desktops (<a title="Horizon View 5.2 limits" href="http://myvirtualcloud.net/?p=4432" target="_blank">this limit is changed in Horizon View 5.2 to 10.000</a>). A View Pod consists of one or more View blocks and a View Management block, where the View Connection servers are &#8220;clustered&#8221;. All the View Connection servers in a View block share the same information and replicates an ADAM database which contains the configuration of the View infrastructure.

[<img class="size-medium wp-image-2505 aligncenter" title="ViewPod" src="https://svenhuisman.com/wp-content/uploads/2013/03/ViewPod-350x259.png" alt="" width="350" height="259" srcset="https://svenhuisman.com/wp-content/uploads/2013/03/ViewPod-350x259.png 350w, https://svenhuisman.com/wp-content/uploads/2013/03/ViewPod.png 916w" sizes="(max-width: 350px) 100vw, 350px" />](https://svenhuisman.com/wp-content/uploads/2013/03/ViewPod.png)

One of the disadvantages of VMware View in my opinion, is that if you want to implement a VMware View infrastructure across multiple datacenters and you want an architecture that is supported by VMware, you have to create multiple VMware View Pods. One of the &#8220;rules&#8221; of VMware is that View Connection servers needs to be on the same LAN and the same location. If you have multiple datacenters where you want to implement View Connection servers, each datacenter will be configured as a separate View environment.  
<!--more-->

  
From the <a title="VMware View architecture planning guide" href="http://pubs.vmware.com/view-51/topic/com.vmware.ICbase/PDF/view-51-architecture-planning.pdf" target="_blank">View Architecture planning guide</a>:

> _**View Connection Server Cluster Design Considerations**_  
> _You can deploy multiple replicated View Connection Server instances in a group to support load balancing and high availability. Groups of replicated instances are designed to support clustering within a LAN-connected single-datacenter environment. <span style="text-decoration: underline;">VMware does not recommend</span> using a group of replicated View Connection Server instances across a WAN due to the communication traffic needed between the grouped instances. In scenarios where a View deployment needs to span datacenters, create a separate View deployment for each datacenter._

&#8220;VMware does not recommend&#8221; is not the same as not supported in my opinion.

**Update**: this is the statement in the <a title="View Horizon Architecture planning guide" href="http://pubs.vmware.com/view-52/topic/com.vmware.ICbase/PDF/horizon-view-52-architecture-planning.pdf" target="_blank">View Architecture planning guide in the Horizon View 5.2</a> version:

> _IMPORTANT VMware does not recommend or support using a group of replicated View Connection Server instances across a WAN, MAN (metropolitan area network), or other non-LAN due to the communication traffic needed between the grouped instances. In scenarios where a View deployment needs to span datacenters, create a separate Horizon View deployment for each datacenter._

From the <a title="VMware View Installation guide" href="http://pubs.vmware.com/view-51/topic/com.vmware.ICbase/PDF/view-51-installation.pdf" target="_blank">View installation guide</a>:

>  _**Network Requirements for Replicated View Connection Server Instances**_  
>  _If you install replicated View Connection Server instances, configure the instances in the same location and connect them over a high-performance LAN._  
>  _Do not use a WAN to connect replicated View Connection Server instances._  
>  _Even a high-performance WAN with low average latency and high throughput might have periods when the network cannot deliver the performance characteristics that are needed for View Connection Server instances to maintain consistency._  
>  _If the View LDAP configurations on View Connection Server instances become inconsistent, users might not be able to access their desktops. A user might be denied access when connecting to a View Connection Server instance with an out-of-date configuration._

So replicating View connection servers over WAN can lead to inconsistent LDAP configuration, but still no support statement.

**Update**: from the <a title="Horizon View 5.2 installation guide" href="http://pubs.vmware.com/view-52/topic/com.vmware.ICbase/PDF/horizon-view-52-installation.pdf" target="_blank">Horizon View 5.2 installation guide</a>:

> _**Network Requirements for Replicated View Connection Server Instances**_
> 
> _If you install replicated View Connection Server instances, configure the instances in the same location and connect them over a high-performance LAN. When installing replicated View Connection Server instances, you must configure the instances in the same physical location and connect them over a high-performance LAN._ 
> 
> _Do not use a WAN, MAN (metropolitan area network), or other non-LAN to connect replicated View Connection Server instances. Even a high-performance WAN, MAN, or other non-LAN with low average latency and high throughput might have periods when the network cannot deliver the performance characteristics that are needed for View Connection Server instances to maintain consistency. If the View LDAP configurations on View Connection Server instances become inconsistent, users might not be able to access their desktops. A user might be denied access when connecting to a View Connection Server instance with an out-of-date configuration._

Finally, in the KB article &#8220;<a title="Network connectivity requirements for VMware View Manager 4.5 and later" href="http://kb.vmware.com/kb/1027217" target="_blank">Network connectivity requirements for VMware View Manager 4.5 and later</a>&#8221; the following statement can be found:

> _Ensure that the Replica Server is on the same LAN as the Connection Server. Replication over WAN is not supported._

[<img class="aligncenter size-medium wp-image-2506" title="View-WAN" src="https://svenhuisman.com/wp-content/uploads/2013/03/View-WAN-350x267.png" alt="" width="350" height="267" srcset="https://svenhuisman.com/wp-content/uploads/2013/03/View-WAN-350x267.png 350w, https://svenhuisman.com/wp-content/uploads/2013/03/View-WAN.png 515w" sizes="(max-width: 350px) 100vw, 350px" />](https://svenhuisman.com/wp-content/uploads/2013/03/View-WAN.png)

There is a good discussion in the <a title="VMware community" href="http://communities.vmware.com/message/2013905" target="_blank">VMware community</a> about this topic and the definition of LAN and why replication is not supported over WAN.

**Challenges**

****The first challenge is to let your users logon to the right View Pod. F5 has a load balancer that has the capabilities to check in which View pod a user has a virtual desktop entitlement and then redirect the user to that View Pod. More information can be found in <a title="F5" href="http://www.slideshare.net/Ernestopellegrino/enhancing-the-user-experience-for-multipod-vmware-view-deployments" target="_blank">this presentation</a>.

The second challenge is to be able to login to another View Pod, when a disaster happens to one of the datacenters for example. When the user logs on to a stateless desktop this is not a big issue. A new stateless desktop pool can be created on the other datacenter and once the users are entitled they are able to log on again. This can be automated with powershell or the stateless desktop pool can even be pre-deployed, just in case of disaster.  
And now I&#8217;m getting to the point I want to make. Stateful desktops can not be transferred from one datacenter to another datacenter in case of a disaster. Even if the stateful desktops are replicated on storage, it is not supported by VMware to add the stateful desktops to another View Pod.

From the VMware KB article &#8220;<a title="Moving View-Managed desktops between vCenter servers is not supported" href="http://kb.vmware.com/kb/1018045" target="_blank">Moving View-managed desktops between vCenter Servers is not supported</a>&#8220;:

_IMPORTANT NOTE: Moving View-managed desktops between vCenter Servers is NOT supported._

[<img class="aligncenter size-medium wp-image-2511" title="failover" src="https://svenhuisman.com/wp-content/uploads/2013/03/failover-350x267.png" alt="" width="350" height="267" srcset="https://svenhuisman.com/wp-content/uploads/2013/03/failover-350x267.png 350w, https://svenhuisman.com/wp-content/uploads/2013/03/failover.png 515w" sizes="(max-width: 350px) 100vw, 350px" />](https://svenhuisman.com/wp-content/uploads/2013/03/failover.png)

I find it disturbing that VMware, a company that is build on virtualization, high availability and disaster recovery, cannot support a site-failover of a stateful desktop! I don&#8217;t think this has changed in Horizon View 5.2, but I will update this post once I know. BTW, the fact that it&#8217;s not supported by VMware doesn&#8217;t mean it is not <span style="text-decoration: underline;">possible</span>, but usually the first requirement of the customer is to implement a design supported by VMware.

**Solution**

****To be honest, to failover stateful desktops to another datacenter is not a common requirement. Being able to use a stateless desktop in case of a disaster is sufficient for some customers. On the other hand, there is a reason someone needs a stateful desktop, so not being able to use it in case of a datacenter disaster can be unacceptable for other customers.  
To me, the only difference between a stateless desktop and a stateful destop is that the user can install applications in the stateful desktop and the next time the user logs in, those applications are still present. The user profile, personal application settings and (personal) data can be managed by different technologies already. Think about user profile management and folder redirection for example. What if there was a technology that is capable of capturing the applications that the user installs and put them on a separate location? This way, stateless desktops can be used together with this technology and when one site fails, the user can log on to a new stateless desktop on the other location and this technology will present the personal applications in this desktop. But wait, this technology already exists, it&#8217;s called &#8220;layering&#8221;!

[<img class="aligncenter size-medium wp-image-2512" title="user-installed-apps-main" src="https://svenhuisman.com/wp-content/uploads/2013/03/user-installed-apps-main-350x159.jpg" alt="" width="350" height="159" srcset="https://svenhuisman.com/wp-content/uploads/2013/03/user-installed-apps-main-350x159.jpg 350w, https://svenhuisman.com/wp-content/uploads/2013/03/user-installed-apps-main.jpg 650w" sizes="(max-width: 350px) 100vw, 350px" />](https://svenhuisman.com/wp-content/uploads/2013/03/user-installed-apps-main.jpg)

In the next weeks, I will review a couple of solutions, like <a title="Horizon Mirage" href="http://www.vmware.com/products/desktop_virtualization/mirage/overview.html" target="_blank">VMware Horizon Mirage</a>, <a title="FlexApp" href="http://www.liquidwarelabs.com/products/profileunity.asp" target="_blank">LiquidwareLabs ProfileUnity FlexApp</a>, <a title="Ceedo desktop" href="http://www.ceedo.com/solutions/user-installed-applications.html" target="_blank">Ceedo Desktop</a> and <a title="Appsense StrataApps" href="http://www.appsense.com/products/appsense-labs/strataapps/" target="_blank">Appsense StrataApps</a>, to see if this is the way to solve the &#8220;problem&#8221;. Maybe it&#8217;s time to say goodbye to stateful desktops forever and embrace the layering technology!

In the meantime, let me know if you:

  * use a multi-site VMware View environment (Multiple View pods or a single View Pod (unsupported)?)
  * site-failover stateful desktops in a VMware View environment. How have you implemented this?
  * Use an application layering technology in a VMware View environment.