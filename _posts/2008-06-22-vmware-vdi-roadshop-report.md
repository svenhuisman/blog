---
id: 65
title: VMWare VDI RoadShow report
date: 2008-06-22T23:25:05+02:00
author: Matthijs Haverink
layout: post
guid: http://virtualfuture.info/?p=65
permalink: /2008/06/vmware-vdi-roadshop-report/
comment_count:
  - "1"
trackback_count:
  - "1"
categories:
  - Virtual Desktop
tags:
  - ChipPC
  - Desktone
  - Net2Display
  - RoadShow
  - Scense
  - TCO Calculator
  - VDI
  - VDI broker
  - VDM 2.1
  - VMware
---
[](https://svenhuisman.com/wp-content/uploads/2008/06/vdi_roadshow.jpg)<a title="Johan van Zanten" href="http://www.linkedin.com/in/jvzanten" target="_blank">Johan</a> <a href="https://svenhuisman.com/2008/06/free-desktop-virtualization-seminars-in-the-netherlands/" target="_blank">announced the 9th of June </a>that the <a title="VMWare VDI RoadShow" href="http://www.vmwarebenelux.nl/vdi/nl-nl/" target="_blank">VMWare VDI RoadShow</a> was coming up and last week I attended the RoadShow in Eefde (The Netherlands) and below you&#8217;ll find a short recap of the event and my opinion about the future of VDI.

<img class="aligncenter size-full wp-image-66" src="https://svenhuisman.com/wp-content/uploads/2008/06/vdi_roadshow.jpg" alt="" width="407" height="189" srcset="https://svenhuisman.com/wp-content/uploads/2008/06/vdi_roadshow.jpg 407w, https://svenhuisman.com/wp-content/uploads/2008/06/vdi_roadshow-300x139.jpg 300w" sizes="(max-width: 407px) 100vw, 407px" /> 

First of all it was interesting to see how many people were attending this roadshow. I talked to someone of VMWare and he told me that they got over 2000 applications within 2 weeks. We all know that VDI is hot but this even surprised VMWare ! Everybody is thinking about VDI and that&#8217;s logical : server virtualization is becoming commodity and people are looking for possibilities to fully benefit the potential of their Virtual Infrastructure.

For your info: VMWare is planning on expanding the VDI RoadShowthrough the entire Benelux with a total of 13 cities, but I can&#8217;t get VMWare to officially confirm that yet.<!--more-->

Now about the event itself. It off course started with the &#8220;why VDI&#8221;: what makes people so interested in VDI and why should we adopt it? Well the benefits of VDI cannot be ignored:

**<span style="underline;">1. $$$ : Fat clients are sooo 2007</span>**  
No seriously; people are more and more looking into VDI because investing in new hardware for your desktops now, could be real waste of your money. Not only the investment but also the other &#8220;default&#8221; advantages of Virtualization (less power: _thin clients_, less management: _centralized environment_ etc). <a title="VMWare VI TCO Calculator" href="http://www.vmware.com/products/vi/calculator.html" target="_blank">VMWare has released a TCO calculator </a>for your desktop environment which calculates the TCO of your hardware desktop environment and gives you insight in the ROI values when switching to VDI. Off-course it needs to be said that the calculator is from VMWare (who sells &#8220;the solution&#8221;) and not from an independent company, but nevertheless, take off 30% or so and still the results are quite astonishing.

<span style="underline;"><strong>2. SBC is nice but only for &#8220;standard users&#8221;</strong></span>  
Server Based Computing is powerful: VDI will never be able to get the User/CPU or User/Mem ratios that SBC does and that&#8217;s because you&#8217;ve got only one OS. But that one OS comes with disadvantages: you have to lock it down and restrict your users so that they don&#8217;t mess-up each others environment. Power-Users (the creative hard-working people who know how to use a computer) should not be limited in their use. Giving them their own personal desktop can free them from this problem and give them the possibility to use their full potential.

[<img class="aligncenter size-full wp-image-67" src="https://svenhuisman.com/wp-content/uploads/2008/06/vdivdm_diagram1.gif" alt="" width="408" height="348" srcset="https://svenhuisman.com/wp-content/uploads/2008/06/vdivdm_diagram1.gif 408w, https://svenhuisman.com/wp-content/uploads/2008/06/vdivdm_diagram1-300x255.gif 300w" sizes="(max-width: 408px) 100vw, 408px" />](https://svenhuisman.com/wp-content/uploads/2008/06/vdivdm_diagram1.gif)

**<span style="underline;">3. Lots of ease: Remote Workers, Management, Upgrades<br /> </span>**By centralizing your desktops and putting them behind a broker, remote access for users to their full desktop is within reach. Another advantage of centralizing and virtualizing your desktops is that **_you_** are in control concerning when patches are applied, computers are rebooted, computers are suspended or shut down etc. And last but not least; when working virtual, an OS upgrade is so much easier. You build and test a single vm, without the hassle of HAL and driver issues because of different hardware types, convert the VM to a template and publish it.

> _My personal advise though is to first start with application virtualization and profile virtualization and then start virtualizing your desktops because then you&#8217;ll save yourself a whole lot of application hassle in your new environment !_

_These might all be open doors you&#8217;d say but why isn&#8217;t everybody already moving to VDI then ?_

Off course there are downsides:

**1. Limitations of MultiMedia**  
It still uses a standard RDP-like protocol to access your desktop, so full MultiMedia performance is not there&#8230; yet &#8230; I say yet because we did get a pretty impressive demo of a movie running in a VMWare VDI environment using the <a title="VDM 2.1 Release Notes" href="http://www.vmware.com/support/vdm20/doc/releasenotes_vdm20.html" target="_blank">VDM 2.1 broker with MMR multimedia exentions</a> for XP. And I really was amazed! Off course it wasn&#8217;t an HD movie or anything, andit only works for XP at the moment but nevertheless it&#8217;s far better then what we&#8217;re used to with the default RDP protocol. And by the way: even viewing HD movies using VDI isn&#8217;t far away if we may believe <a href="http://www.chippc.com/" target="_blank">ChipPC</a>. Also the upcoming <a href="http://www.ncl.cs.columbia.edu/publications/adeac2006_fordist.pdf" target="_blank">Net2Display VESA standard </a>might bring us some relief. So I think when you start implementing VDI in 2009 you won&#8217;t have to worry about MultiMedia downsides anymore at all :).

<div>
  <strong>2. Offline usage<br /> </strong>At this moment working offline with your VDI desktop is not available yet with the VMWare Solution. VMWare is trying to get that into their VDM 2.x release in combination with VMWare ACE. Microsoft then again has acquired some very cool VDI offline techology by buying Kidaro. So for this I can also say: 2009 will be a magical year :). By the way: seeying prices of UMTS/HSPDA traffic getting lower and lower I don&#8217;t think that this needs to be a bottleneck at the moment.
</div>

<div>
  <strong></strong> 
</div>

<div>
  <strong><em>What was also an interesting comment from VMWare</em></strong> was that they called their own broker (VDM) a mid-range product. Not aiming to supply the best VDI broker in the world; just aiming to deliver all the functionality that&#8217;s wanted by the majority of VDI customers. And I think their doing a smart job because there are already a lot of companies (<a href="http://www.desktone.com/" target="_blank">Desktone</a>, <a href="http://www.qumranet.com/" target="_blank">QumraNet</a>, <a href="http://www.quest.com/" target="_blank">Quest</a>, <a href="http://www.sun.com/" target="_blank">Sun</a>, <a href="http://citrix.com/lang/English/home.asp" target="_blank">Citrix</a>, <a href="http://www.microsoft.com/en/us/default.aspx" target="_blank">Microsoft</a>) that are working on some very interesting VDI brokers. Especially Desktone (some ex-Softgridboys) has gotten my attention with their own philosophy about <a href="http://www.desktone.com/platform/index.php" target="_blank">enabling Desktops as an Outsourced Subscription Service</a>.
</div>

<div>
  <strong></strong><br /> <strong>Last thing I don&#8217;t want to leave unmentioned </strong>is that <a href="http://www.scense.com/" target="_blank">Scense </a>was one of the VMWare partners presenting themselves as a player in the <em>Profile Virtualization </em>area. I honestly never heard of <a href="http://www.scense.com/" target="_blank">Scense </a>before but I was impressed. Scense is a relatively small company in the Netherlands that exists for less then 2 years but with a minimum of 9 years experience in the development of Application Delivery and Desktop Management. And that is what Scense does. I haven&#8217;t been able to testdrive the product yet but it seems to embody the entire Application Delivery and Desktop Management proces : packaging an application, delivering it and managing it. Scense 5 has been released only to weeks ago and a demo can be acquired <a title="Scense 5 demo request" href="http://www.scense.com/Products/download.aspx" target="_blank">here</a>.
</div>