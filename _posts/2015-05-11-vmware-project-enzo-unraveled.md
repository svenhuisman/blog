---
id: 3770
title: VMware Project Enzo unraveled
date: 2015-05-11T23:21:22+02:00
author: Sven Huisman
layout: post
guid: http://SvenHuisman.com/?p=3770
permalink: /2015/05/vmware-project-enzo-unraveled/
image: /wp-content/uploads/2015/05/Screen-Shot-2015-05-11-at-20.58.41-e1431372590932.png
categories:
  - Virtual Desktop
tags:
  - DaaS
  - Horizon
  - Project Enzo
  - View
  - VMware
---
Today VMware announce <a href="http://blogs.vmware.com/euc/2015/05/vmware-previews-project-enzo-next-generation-hybrid-cloud-architecture-designed-transform-virtual-workspaces.html&src=vmw_so_vex_shuis_302" target="_blank">Project Enzo</a>:

> Project Enzo is a new hybrid cloud-scale architecture that is designed to combine the economic benefits of cloud-based VMware virtual desktops and application technology, with the simplicity of hyper-converged infrastructure to transform the IT experience.

As I was watching the <a href="http://youtu.be/9TEZqHEN7eM" target="_blank">video demonstration Project Enzo</a> I had a couple of questions and I want to answer these in this blogpost as a note to myself. Disclaimer: I work for a VMware partner but I have no insight information about this project. All this information come from the video-demo, the VMware blogpost and my own experience.

**What is Project Enzo?**

Project Enzo is descibed in the blogpost:

> VMware Project Enzo represents a new approach to building, delivering and managing virtual workspaces. Project Enzo will enable the unified management of on-premises and cloud-based virtual workspace services (desktops and applications) through a single web-based portal that will be available as a cloud service on VMware vCloud® Air™.

Enzo is basically two technologies:

<div>
  &#8211; Enzo smartnode software: intelligent orchestration layer.
</div>

<div>
  &#8211; Enzo cloud control plane: hosted and managed by VMware.
</div>

**What is the single web-based portal about?**

A single web-based portal sounds good. Now we have to use multiple (web-based) interfaces to manage the virtual workspace of a user: Horizon View Administrator Console, vSphere Web client, App Volumes Web administrator interface, VMware User Environment Manager management console, Mirage Management console and the Horizon Workspace Portal administrator interface. From the video-demo, I captured the following management interface:

[<img class="aligncenter  wp-image-3774" src="https://svenhuisman.com/wp-content/uploads/2015/05/Screen-Shot-2015-05-11-at-21.01.26.png" alt="ENZO2" width="697" height="466" srcset="https://svenhuisman.com/wp-content/uploads/2015/05/Screen-Shot-2015-05-11-at-21.01.26.png 1572w, https://svenhuisman.com/wp-content/uploads/2015/05/Screen-Shot-2015-05-11-at-21.01.26-350x234.png 350w, https://svenhuisman.com/wp-content/uploads/2015/05/Screen-Shot-2015-05-11-at-21.01.26-1024x684.png 1024w, https://svenhuisman.com/wp-content/uploads/2015/05/Screen-Shot-2015-05-11-at-21.01.26-650x434.png 650w" sizes="(max-width: 697px) 100vw, 697px" />](https://svenhuisman.com/wp-content/uploads/2015/05/Screen-Shot-2015-05-11-at-21.01.26.png)

That looks familiar, doesn&#8217;t it? Well it does if you know what the current AirWatch 8 management interface looks like:

[<img class="aligncenter  wp-image-3775" src="https://svenhuisman.com/wp-content/uploads/2015/05/Admin-Panel.png" alt="Admin-Panel-AirWatch" width="713" height="296" srcset="https://svenhuisman.com/wp-content/uploads/2015/05/Admin-Panel.png 1128w, https://svenhuisman.com/wp-content/uploads/2015/05/Admin-Panel-350x145.png 350w, https://svenhuisman.com/wp-content/uploads/2015/05/Admin-Panel-1024x425.png 1024w, https://svenhuisman.com/wp-content/uploads/2015/05/Admin-Panel-650x270.png 650w" sizes="(max-width: 713px) 100vw, 713px" />](https://svenhuisman.com/wp-content/uploads/2015/05/Admin-Panel.png)

&nbsp;

So the single web-based portal will be available as a cloud service solution, hosted on VMware vCould Air, and is probably based on or build by AirWatch.

**How does this work?**

First, login on the Enzo Portal:

[<img class="aligncenter  wp-image-3787" src="https://svenhuisman.com/wp-content/uploads/2015/05/Screen-Shot-2015-05-11-at-20.59.54.png" alt="Enzo setup" width="240" height="251" srcset="https://svenhuisman.com/wp-content/uploads/2015/05/Screen-Shot-2015-05-11-at-20.59.54.png 622w, https://svenhuisman.com/wp-content/uploads/2015/05/Screen-Shot-2015-05-11-at-20.59.54-334x350.png 334w" sizes="(max-width: 240px) 100vw, 240px" />](https://svenhuisman.com/wp-content/uploads/2015/05/Screen-Shot-2015-05-11-at-20.59.54.png)

&nbsp;

The Smartnodes that are registered to your Enzo portal will be available to be included in the Enzo-grid:

[<img class="aligncenter wp-image-3786" src="https://svenhuisman.com/wp-content/uploads/2015/05/Screen-Shot-2015-05-11-at-21.00.13.png" alt="Smartnode" width="727" height="487" srcset="https://svenhuisman.com/wp-content/uploads/2015/05/Screen-Shot-2015-05-11-at-21.00.13.png 1572w, https://svenhuisman.com/wp-content/uploads/2015/05/Screen-Shot-2015-05-11-at-21.00.13-350x234.png 350w, https://svenhuisman.com/wp-content/uploads/2015/05/Screen-Shot-2015-05-11-at-21.00.13-1024x685.png 1024w, https://svenhuisman.com/wp-content/uploads/2015/05/Screen-Shot-2015-05-11-at-21.00.13-650x435.png 650w" sizes="(max-width: 727px) 100vw, 727px" />](https://svenhuisman.com/wp-content/uploads/2015/05/Screen-Shot-2015-05-11-at-21.00.13.png)

With just a couple of steps, the software will be installed and updated on the Smartnodes:

[<img class="aligncenter wp-image-3785" src="https://svenhuisman.com/wp-content/uploads/2015/05/Screen-Shot-2015-05-11-at-21.00.29.png" alt="Enzo update" width="728" height="487" srcset="https://svenhuisman.com/wp-content/uploads/2015/05/Screen-Shot-2015-05-11-at-21.00.29.png 1576w, https://svenhuisman.com/wp-content/uploads/2015/05/Screen-Shot-2015-05-11-at-21.00.29-350x234.png 350w, https://svenhuisman.com/wp-content/uploads/2015/05/Screen-Shot-2015-05-11-at-21.00.29-1024x685.png 1024w, https://svenhuisman.com/wp-content/uploads/2015/05/Screen-Shot-2015-05-11-at-21.00.29-650x435.png 650w" sizes="(max-width: 728px) 100vw, 728px" />](https://svenhuisman.com/wp-content/uploads/2015/05/Screen-Shot-2015-05-11-at-21.00.29.png)

After the setup of the hardware is finished, the next step will be to initialize the Enzo environment. As you can see, this looks a lot like the AirWatch configuration:

[<img class="aligncenter wp-image-3784" src="https://svenhuisman.com/wp-content/uploads/2015/05/Screen-Shot-2015-05-11-at-21.00.54.png" alt="Enzo-start" width="726" height="485" srcset="https://svenhuisman.com/wp-content/uploads/2015/05/Screen-Shot-2015-05-11-at-21.00.54.png 1574w, https://svenhuisman.com/wp-content/uploads/2015/05/Screen-Shot-2015-05-11-at-21.00.54-350x234.png 350w, https://svenhuisman.com/wp-content/uploads/2015/05/Screen-Shot-2015-05-11-at-21.00.54-1024x684.png 1024w, https://svenhuisman.com/wp-content/uploads/2015/05/Screen-Shot-2015-05-11-at-21.00.54-650x434.png 650w" sizes="(max-width: 726px) 100vw, 726px" />](https://svenhuisman.com/wp-content/uploads/2015/05/Screen-Shot-2015-05-11-at-21.00.54.png)

When the initial configuration is completed, you can create images, desktop and application pools:

[<img class="aligncenter wp-image-3782" src="https://svenhuisman.com/wp-content/uploads/2015/05/Screen-Shot-2015-05-11-at-21.01.261.png" alt="Enzo-desktops" width="693" height="462" srcset="https://svenhuisman.com/wp-content/uploads/2015/05/Screen-Shot-2015-05-11-at-21.01.261.png 1572w, https://svenhuisman.com/wp-content/uploads/2015/05/Screen-Shot-2015-05-11-at-21.01.261-350x234.png 350w, https://svenhuisman.com/wp-content/uploads/2015/05/Screen-Shot-2015-05-11-at-21.01.261-1024x684.png 1024w, https://svenhuisman.com/wp-content/uploads/2015/05/Screen-Shot-2015-05-11-at-21.01.261-650x434.png 650w" sizes="(max-width: 693px) 100vw, 693px" />](https://svenhuisman.com/wp-content/uploads/2015/05/Screen-Shot-2015-05-11-at-21.01.261.png)

I&#8217;m not sure if VMware Mirage is involved in creating and maintaining the desktop images. The video mentions the with Enzo, maintenance and updates to images, applications and infrastructure can be performed anytime, without downtime for the users.

After you have created a desktop or application, you can assign it to the users:

[<img class="aligncenter wp-image-3781" src="https://svenhuisman.com/wp-content/uploads/2015/05/Screen-Shot-2015-05-11-at-21.01.53.png" alt="Enzo-assign" width="695" height="614" srcset="https://svenhuisman.com/wp-content/uploads/2015/05/Screen-Shot-2015-05-11-at-21.01.53.png 1042w, https://svenhuisman.com/wp-content/uploads/2015/05/Screen-Shot-2015-05-11-at-21.01.53-350x309.png 350w, https://svenhuisman.com/wp-content/uploads/2015/05/Screen-Shot-2015-05-11-at-21.01.53-1024x904.png 1024w, https://svenhuisman.com/wp-content/uploads/2015/05/Screen-Shot-2015-05-11-at-21.01.53-650x574.png 650w" sizes="(max-width: 695px) 100vw, 695px" />](https://svenhuisman.com/wp-content/uploads/2015/05/Screen-Shot-2015-05-11-at-21.01.53.png)

Assign applications:

[<img class="aligncenter wp-image-3780" src="https://svenhuisman.com/wp-content/uploads/2015/05/Screen-Shot-2015-05-11-at-21.02.13.png" alt="Enzo-apps" width="686" height="605" srcset="https://svenhuisman.com/wp-content/uploads/2015/05/Screen-Shot-2015-05-11-at-21.02.13.png 1048w, https://svenhuisman.com/wp-content/uploads/2015/05/Screen-Shot-2015-05-11-at-21.02.13-350x309.png 350w, https://svenhuisman.com/wp-content/uploads/2015/05/Screen-Shot-2015-05-11-at-21.02.13-1024x903.png 1024w, https://svenhuisman.com/wp-content/uploads/2015/05/Screen-Shot-2015-05-11-at-21.02.13-650x573.png 650w" sizes="(max-width: 686px) 100vw, 686px" />](https://svenhuisman.com/wp-content/uploads/2015/05/Screen-Shot-2015-05-11-at-21.02.13.png)

And an overview of the performance and capacity used:

[<img class="aligncenter wp-image-3777" src="https://svenhuisman.com/wp-content/uploads/2015/05/Screen-Shot-2015-05-11-at-21.07.07.png" alt="Enzo-perf" width="696" height="464" srcset="https://svenhuisman.com/wp-content/uploads/2015/05/Screen-Shot-2015-05-11-at-21.07.07.png 1574w, https://svenhuisman.com/wp-content/uploads/2015/05/Screen-Shot-2015-05-11-at-21.07.07-350x233.png 350w, https://svenhuisman.com/wp-content/uploads/2015/05/Screen-Shot-2015-05-11-at-21.07.07-1024x682.png 1024w, https://svenhuisman.com/wp-content/uploads/2015/05/Screen-Shot-2015-05-11-at-21.07.07-650x433.png 650w" sizes="(max-width: 696px) 100vw, 696px" />](https://svenhuisman.com/wp-content/uploads/2015/05/Screen-Shot-2015-05-11-at-21.07.07.png)

&nbsp;

**Where are the desktops hosted with Project Enzo?**

The desktops and applications can be hosted on-premises and can be cloud-based. With this information and if you look at the interfaces presented in the video-demo, you can only conclude that the software to broker the desktops and applications is Horizon DaaS (previously known as Desktone).

**When on-premises, which hardware can I use?**

> Project Enzo features cloud-scale architecture. The Smart Node technology will come fully integrated into the next-generation EVO:RAIL™, and future EVO:RACK™ solutions from VMware. All of our EVO partners will have the ability to offer appliances and racks compatible with Project Enzo.

<div>
  In the video, you can also see a screenshot of EVO:
</div>

<div>
  <img class="aligncenter wp-image-3773" src="https://svenhuisman.com/wp-content/uploads/2015/05/Screen-Shot-2015-05-11-at-20.59.36.png" alt="Enzo1" width="709" height="379" srcset="https://svenhuisman.com/wp-content/uploads/2015/05/Screen-Shot-2015-05-11-at-20.59.36.png 1568w, https://svenhuisman.com/wp-content/uploads/2015/05/Screen-Shot-2015-05-11-at-20.59.36-350x187.png 350w, https://svenhuisman.com/wp-content/uploads/2015/05/Screen-Shot-2015-05-11-at-20.59.36-1024x547.png 1024w, https://svenhuisman.com/wp-content/uploads/2015/05/Screen-Shot-2015-05-11-at-20.59.36-650x347.png 650w" sizes="(max-width: 709px) 100vw, 709px" />
</div>

<div>
</div>

<div>
  <strong>What is Smartnode?</strong>
</div>

> <div>
>   One key element of Smart Node technology will be just-in-time (JIT) provisioning of virtual desktops and applications. Smart Node will leverage the built-in VMware AppVolumes, User Environment Management and the VMware Instant Cloning technologies to assemble personalized virtual desktop and application environments when an end-user logs-in
> </div>

<div>
  So Smartnode technology are two existing products (<a href="http://www.vmware.com/nl/products/appvolumes&src=vmw_so_vex_shuis_302" target="_blank">App Volumes</a> and <a href="http://www.vmware.com/products/user-environment-manager&src=vmw_so_vex_shuis_302" target="_blank">VMware User Environment Manager</a>) combined with the new <a href="http://blogs.vmware.com/cloudnative/tag/instant-clone&src=vmw_so_vex_shuis_302" target="_blank">instant cloning technology</a> (available in vSphere 6). What really is interesting is that these technologies will be integrated in Smartnode enabled EVO solutions.
</div>

<div>
</div>

<div>
  <strong>What will it cost?</strong>
</div>

<div>
</div>

<div>
  In the video it is stated that this Enzo technology will cost less than a cup of coffee per day per end-user. Let&#8217;s say a cup of coffee costs $2,50, that&#8217;s $912,50 a year per user. I don&#8217;t know if that includes hardware or Horizon Air resources.
</div>

<div>
</div>

<div>
  <strong>When will Enzo be available?</strong>
</div>

<div>
</div>

<div>
  The Early access program will be available by the end of this summer (probably during or right after VMworld). The general availability will be by the end of this year.
</div>

<div>
</div>

<div>
  <strong>What will happen to Horizon View?</strong>
</div>

<div>
</div>

<div>
  What does this new approach mean for the current approach? If you look at this picture, it looks like there will be a VMware Horizon 6 adapter available to connect your existing Horizon View infrastructure to the Enzo Portal:
</div>

[<img class="aligncenter wp-image-3788" src="https://svenhuisman.com/wp-content/uploads/2015/05/Screen-Shot-2015-05-11-at-22.56.41.png" alt="Horizon Adapter" width="617" height="295" srcset="https://svenhuisman.com/wp-content/uploads/2015/05/Screen-Shot-2015-05-11-at-22.56.41.png 1780w, https://svenhuisman.com/wp-content/uploads/2015/05/Screen-Shot-2015-05-11-at-22.56.41-350x168.png 350w, https://svenhuisman.com/wp-content/uploads/2015/05/Screen-Shot-2015-05-11-at-22.56.41-1024x490.png 1024w, https://svenhuisman.com/wp-content/uploads/2015/05/Screen-Shot-2015-05-11-at-22.56.41-650x311.png 650w" sizes="(max-width: 617px) 100vw, 617px" />](https://svenhuisman.com/wp-content/uploads/2015/05/Screen-Shot-2015-05-11-at-22.56.41.png)On the long term, I&#8217;m not sure if the Horizon View brokers will continue to be developed. I will not be surprised if Horizon DaaS will eventually replace the Horizon View connection brokers. Horizon DaaS is more suitable for multi tenancy and multi datacenter. The underlying technology (PCoIP and Blast features) is the same for both products.

Project Enzo sounds very promising and I hope VMware can deliver on the promises. I&#8217;m also very curious if VMware will bring some of these new technologies to the Horizon View customers, like instant cloning and single pane of glass.

If I have more information about Project Enzo, I will let you know!

Update: here&#8217;s another video about how to get started with Enzo:

  
&nbsp;