---
id: 75
title: Citrix on VI3.x recommendations
date: 2008-07-01T15:21:15+02:00
author: Sven Huisman
layout: post
guid: https://svenhuisman.com/?p=75
permalink: /2008/07/citrix-on-vi3x-recommendations/
categories:
  - Virtual Applications
tags:
  - Citrix
  - recommendations
  - VI3
  - VMware
---
<a title="Verron Martina" href="http://www.linkedin.com/in/vsmartina" target="_blank">Verron Martina</a> from <a title="VMware" href="http://www.vmware.com" target="_blank">VMware</a> dropped me an e-mail with a lot of recommendations for running <a title="Citrix" href="http://www.citrix.com" target="_blank">Citrix</a> in a VI3.x environment. These recommendations come from other system engineers from VMware working in the field. Thanks Verron, for sharing this.<!--more-->

<span style="font-family: 'Calibri','sans-serif';"><strong>Technical Recommendations:</strong></span>  
<span style="font-family: 'Calibri','sans-serif';"> </span>  
<span style="font-family: 'Calibri','sans-serif';">&#8211; I used the ballooning driver. Some Citrix forums will tell you not to use it but for us the ballooning driver made a complete difference.</span>  
<span style="font-family: 'Calibri','sans-serif';"> </span>  
<span style="font-family: 'Calibri','sans-serif';">&#8211; Start by using only one vCPU per VM and if possible use affinity to make sure that the VM is not running on the same core as the console or another VM.</span>  
<span style="font-family: 'Calibri','sans-serif';"> </span>  
<span style="font-family: 'Calibri','sans-serif';">-The sweet spot we found was to assign only 2GB to the VM and something between 30 and 40 users per VM.</span>  
<span style="font-family: 'Calibri','sans-serif';"> </span>  
<span style="font-family: 'Calibri','sans-serif';">&#8211; Our target was not to beat a physical CPS server with a single VM but get more aggregated users using 2 or 3 VMs (depending on the number of cores available) with no more than 40 users per VM. Do not over commit the cores as that will lose advantage.</span>  
<span style="font-family: 'Calibri','sans-serif';"> </span>  
<span style="font-family: 'Calibri','sans-serif';">&#8211; The final target for us was to demonstrate that the VMs running simultaneously on the same physical server can get a higher number of users (between 70 and 90% more) than a normal CPS installed on the same HW while user experience (keyboard-screen response times, login times, app launch times, etc) are very similar.</span>  
<span style="font-family: 'Calibri','sans-serif';"> </span>  
<span style="font-family: 'Calibri','sans-serif';">&#8211; Some times we have to be patient and wait a few minutes for the VM to get steady, then the magic shows up and the VMs will surpass the physical server regarding load tolerance.</span>  
<span style="font-family: 'Calibri','sans-serif';"> </span>  
<span style="font-family: 'Calibri','sans-serif';">&#8211; Regarding login times, the VM can show longer times; however, once the user is in, the VMs will look fast. Check than DNS servers are not getting messy as this is commonly the problem with long login times.</span>  
<span style="font-family: 'Calibri','sans-serif';"> </span>  
<span style="font-family: 'Calibri','sans-serif';">&#8211; Make sure that the network interfaces are using fixed speed when connecting to the network, do not leave auto negotiated speeds. The best is to use 1000 mbps FULL DUPLEX.</span>  
<span style="font-family: 'Calibri','sans-serif';"> </span>  
<span style="font-family: 'Calibri','sans-serif';">-Use one virtual disk for Windows and CPS and a different virtual disk for Windows paging of the same VM.</span>  
<span style="font-family: 'Calibri','sans-serif';"> </span>  
<span style="font-family: 'Calibri','sans-serif';">-When installing VMware tools use a custom installation and remove the shared folder feature. This is very important as Citrix seems not to like that and it is a useless feature on ESX as it s meant for Workstation.</span>  
<span style="font-family: 'Calibri','sans-serif';"> </span>  
<span style="font-family: 'Calibri','sans-serif';">·         Follow VMware’s best practices for performance tuning on ESX (</span><a href="http://www.vmware.com/pdf/vi_performance_tuning.pdf" target="_blank"><span style="font-family: 'Calibri','sans-serif';">http://www.vmware.com/pdf/vi_performance_tuning.pdf</span></a><span style="font-family: 'Calibri','sans-serif';">)</span>  
<span style="font-family: 'Calibri','sans-serif';">·         Build your template Citrix virtual machine from scratch (don’t convert an existing physical server).</span>  
<span style="font-family: 'Calibri','sans-serif';">·         Use a single virtual CPU for the template vm</span>  
<span style="font-family: 'Calibri','sans-serif';">·         This will allow the Windows operating system in the guest to use a uni-processor HAL, as opposed to a SMP HAL, streamlining the guest operating system.</span>  
<span style="font-family: 'Calibri','sans-serif';">·         Configure the template vm for 2-4 GB RAM.</span>  
<span style="font-family: 'Calibri','sans-serif';">·         Configure separate virtual disks (VMDK files) for the operating system and the pagefile.</span>  
<span style="font-family: 'Calibri','sans-serif';">·         </span><span style="font-family: 'Calibri','sans-serif';">at VMware &#8211; </span><a href="http://www.vmware.com/vmtn/resources/608" target="_blank"><span style="font-family: 'Calibri','sans-serif';">http://www.vmware.com/vmtn/resources/608</span></a><span style="font-family: 'Calibri','sans-serif';">).</span>  
<span style="font-family: 'Calibri','sans-serif';">·         Use a 64-bit Windows installation.</span>  
<span style="font-family: 'Calibri','sans-serif';">·         Have an understanding of what an ‘acceptable’ threshold of users will be… Some customers see an increase in the number of users per Citrix instance when virtualized, some see fewer.  You should go into it with the expectation that you may get fewer users, as well as what you would like to see (ie 80% of physical or better?  70%?).</span>  
<span style="font-family: 'Calibri','sans-serif';"> </span>  
<span style="font-family: 'Calibri','sans-serif';">Bear in mind that even if you get fewer users per vm than in a physical environment, there are many other benefits to using virtualized Citrix servers:</span>  
<span style="font-family: 'Calibri','sans-serif';"> </span>  
<span style="font-family: 'Calibri','sans-serif';">·         Deployment</span>  
<span style="font-family: 'Calibri','sans-serif';">o   One of the things many Citrix shops struggle with is their deployment process – how do we maintain an up-to-date image for the farm that incorporates the required applications and accommodates the hardware in question… rolling out Windows, including updates and patches, and the Citrix software (though this could be handled by Citrix Installation Manager).  Either way, you are maintaining server images somewhere – either through the use of a complicated installation script, or through imaging software such as Ghost.</span>  
<span style="font-family: 'Calibri','sans-serif';">o   Deploying a virtual machine through the use of templates is far quicker and more efficient than any other physical imaging process you might have used.  VMs can be deployed in a matter of minutes using templates.  The templates themselves can be created from existing virtual machines, and can be copied and used with VMware snapshots or SAN/NAS snapshots, giving you the ability to easily maintain a library of templates for different types of operating systems, applications, etc.</span>  
<span style="font-family: 'Calibri','sans-serif';">·         Disaster recovery </span>  
<span style="font-family: 'Calibri','sans-serif';">o   Setting up a Citrix farm to failover to another site requires a large investment in hardware, and man-hours to configure the remote site to handle all the applications necessary.  Furthermore, the hardware in the remote site has to be of the same type as the primary, or your deployment strategy has to take hardware differences into account.</span>  
<span style="font-family: 'Calibri','sans-serif';">o   Using virtual machines, all you need to do to enable a DR site is have a copy of the required virtual machines in the remote location – hence you only need to set up the farm once, and maintain a copy of it in the remote location.  Spinning up your DR or business continuity site is a matter of ‘powering up’ the virtual machines.  VMware Site Recovery Manager may even help automate that process.</span>  
<span style="font-family: 'Calibri','sans-serif';">·         Stability</span>  
<span style="font-family: 'Calibri','sans-serif';">o   Since the citrix system is accessed by users like a PC on a regular basis, a Citrix server is more prone to failure than a regular server (though, with proper maintenance, hopefully less prone than a desktop).  Server outages mean lost productivity for your users, and a significant effort in troubleshooting the problem, since Terminal Services is a good deal more complicated than a regular server.</span>  
<span style="font-family: 'Calibri','sans-serif';">o   To properly design for the outages we know we will have, you have to have extra capacity in the farm to handle the overflow users when one of the servers is down.  This is true for both planned and unplanned downtime.</span>  
<span style="font-family: 'Calibri','sans-serif';">o   VMware ESX has been recognized in the industry as one of the most stable platforms to be introduced… ever.  This means fewer outages due to host failures.  Also, since we standardize and virtualize the hardware of the guest operating systems, this holds true across different hosts, enabling your virtual machines to run across hosts from different manufacturers and chipsets.</span>  
<span style="font-family: 'Calibri','sans-serif';">o   See </span><a href="http://redmondmag.com/features/article.asp?EditorialsID=2400" target="_blank"><span style="font-family: 'Calibri','sans-serif';">http://redmondmag.com/features/article.asp?EditorialsID=2400</span></a>  
<span style="font-family: 'Calibri','sans-serif';">·         Application Deployment</span>  
<span style="font-family: 'Calibri','sans-serif';">o   Many Citrix shops do a good deal of work maintaining multiple images – deploying applications in ‘stovepipe’ configurations…  that is to say, multiple small groups of Citrix servers, each dedicated to a specific set of applications.  Frequently, this is due to largely due to application incompatibility.  However, it results in the Citrix admin being required to maintain several different images for the Citrix farm.</span>  
<span style="font-family: 'Calibri','sans-serif';">o   Even if the shop has standardized on a single Citrix image, they will not be using the company’s standard application deployment methodology…  Terminal Services is too funky with regards to application deployment, and requires much handholding.  Most Citrix shops has compeletely separate processes for packaging applications for a PC versus a Citrix server.</span>  
<span style="font-family: 'Calibri','sans-serif';">o   VMware ThinApp (</span><a href="http://www.thinstall.com/" target="_blank"><span style="font-family: 'Calibri','sans-serif';">http://www.thinstall.com</span></a><span style="font-family: 'Calibri','sans-serif';">) can be used to image your applications separately from the Citrix image… In fact, an application that has been packaged with ThinApp on Windows 2003 will work on Terminal Services, Citrix, Windows XP, and Vista, eliminating the need to package that application for the different platforms.  Furthermore, ThinApp includes a ‘sandbox’ to prevent applications from conflicting with each other.  You simply place the packaged application on a file share on the network, accessible to the Citrix servers (or PCs, or both), and you are done.  Your users simply execute the application from the shared directory, and they are off and running.  This results in a win-win for the customer – the ability to package an application once, and use it for either a PC environment or a Citrix environment.</span>  
<span style="font-family: 'Calibri','sans-serif';"> </span>  
<span style="font-family: 'Calibri','sans-serif';">In short, there is a lot more to the story than just consolidation.  We have customers here in Richmond that have deployed VMware ESX server for their high-end Oracle databases (Markel Corp), and they have accepted a 1:1 consolidation ratio (that means one virtual machine per physical host).  The value to the organization is not just in consolidation, but in the strength of the platform, the disaster recovery capabilities, and how the infrastructure immediately becomes more fluid and resilient.</span>  
<span style="font-family: 'Calibri','sans-serif';"> </span>  
<span style="font-size: 10pt; font-family: 'Calibri','sans-serif';">Citrix:</span>  
<span style="font-size: 10pt; font-family: 'Calibri','sans-serif';">Optimizing Citrix Presentation Server on Vmware ESX Server &#8211; </span><a href="http://download3.vmware.com/vmworld/2006/med0115.pdf" target="_blank"><span style="font-size: 10pt; font-family: 'Calibri','sans-serif';">http://download3.vmware.com/vmworld/2006/med0115.pdf</span></a>  
<span style="font-size: 10pt; font-family: 'Calibri','sans-serif';">Citrix and Vmware &#8211; </span><a href="http://download3.vmware.com/vmworld/2006/tac9728.pdf" target="_blank"><span style="font-size: 10pt; font-family: 'Calibri','sans-serif';">http://download3.vmware.com/vmworld/2006/tac9728.pdf</span></a>  
<span style="font-size: 10pt; font-family: 'Calibri','sans-serif';">Best practices for deploying Citrix on ESX &#8211; </span><a href="http://virtrix.blogspot.com/2007/03/vmware-best-practices-for-deploying.html" target="_blank"><span style="font-size: 10pt; font-family: 'Calibri','sans-serif';">http://virtrix.blogspot.com/2007/03/vmware-best-practices-for-deploying.html</span></a>  
<span style="font-size: 10pt; font-family: 'Calibri','sans-serif';">Improving Scalability for Citrix Presentation Server &#8211; </span><a href="http://www.vmware.com/pdf/esx_citrix_scalability.pdf" target="_blank"><span style="font-size: 10pt; font-family: 'Calibri','sans-serif';">http://www.vmware.com/pdf/esx_citrix_scalability.pdf</span></a>  
<span style="font-size: 10pt; font-family: 'Calibri','sans-serif';">To virtualize or not Citrix and Terminal Server &#8211; </span><a href="http://www.vmware.com/community/thread.jspa?messageID=671864" target="_blank"><span style="font-size: 10pt; font-family: 'Calibri','sans-serif';">http://www.vmware.com/community/thread.jspa?messageID=671864</span></a>  
<span style="font-size: 10pt; font-family: 'Calibri','sans-serif';">Citrix and VMware: Oil and Water? &#8211; </span><a href="http://redmondmag.com/features/article.asp?EditorialsID=718" target="_blank"><span style="font-size: 10pt; font-family: 'Calibri','sans-serif';">http://redmondmag.com/features/article.asp?EditorialsID=718</span></a>  
<span style="font-size: 10pt; font-family: 'Calibri','sans-serif';">BriForum 2006 Video: Ron Oglesby on the feasibility of running Citrix in a VM &#8211; </span><a href="http://www.brianmadden.com/content/article/BriForum-2006-Video-Ron-Oglesby-on-the-feasibility-of-running-Citrix-in-a-VM" target="_blank"><span style="font-size: 10pt; font-family: 'Calibri','sans-serif';">http://www.brianmadden.com/content/article/BriForum-2006-Video-Ron-Oglesby-on-the-feasibility-of-running-Citrix-in-a-VM</span></a>  
<span style="font-family: 'Calibri','sans-serif';"> </span>  
<span style="font-family: 'Calibri','sans-serif';"> </span>  
<span style="font-family: 'Calibri','sans-serif';">1)     You typically run more instances of Citrix = more OS licenses.  Always several Citrix PS instances per (very expensive ESX  server) instead of 1 per (very cheap low-end box).  It’s not necessarily a consolidation/cost savings model.  It depends on #users/host in the Citrix environment etc.</span>  
<span style="font-family: 'Calibri','sans-serif';"> </span>  
<span style="font-family: 'Calibri','sans-serif';">2)     The real advantages are:</span>  
<span style="font-family: 'Calibri','sans-serif';"> </span>  
<span style="font-family: 'Calibri','sans-serif';">a.     Snapshots!  So handy to make a change/patch and rollback if it screwed everything up</span>  
<span style="font-family: 'Calibri','sans-serif';">b.    Hardware Independence for Citrix instances</span>  
<span style="font-family: 'Calibri','sans-serif';">                                          i.    vMotion/HA benefits of anytime hardware maintenance and greater uptime even on failure</span>  
<span style="font-family: 'Calibri','sans-serif';">                                         ii.    Ability to actually DR your Citrix environment</span>