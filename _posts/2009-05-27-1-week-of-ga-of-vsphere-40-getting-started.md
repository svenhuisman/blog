---
id: 1171
title: '1 week of G/A of vSphere 4.0 : getting started'
date: 2009-05-27T12:00:36+02:00
author: Matthijs Haverink
layout: post
guid: https://svenhuisman.com/?p=1171
permalink: /2009/05/1-week-of-ga-of-vsphere-40-getting-started/
categories:
  - Virtual Infrastructure
tags:
  - Download vSphere trial here
  - ESX
  - Licensing
  - Matthijs Haverink
  - minimizing memory requirements
  - Running ESX 4.0 in ESX
  - running ESX4 in VMware Workstation 6.5
  - "running nested vm's"
  - Upgrade Options
  - VMware
  - vSphere
  - vSphere Evaluators Guide
---
<img class="aligncenter size-medium wp-image-1107" title="introvsphere" src="https://svenhuisman.com/wp-content/uploads/2009/04/introvsphere-350x104.png" alt="introvsphere" width="350" height="104" srcset="https://svenhuisman.com/wp-content/uploads/2009/04/introvsphere-350x104.png 350w, https://svenhuisman.com/wp-content/uploads/2009/04/introvsphere.png 716w" sizes="(max-width: 350px) 100vw, 350px" />

**vSphere** is out on the market for about a week now and the blogosphere was already actively releasing all kinds of information about VMware&#8217;s next-gen &#8220;Cloud Operating System&#8221;.

**I**&#8216;ve been reading quite a lot and made a list for myself with articles that I found most interesting concerning VMware vSphere 4.0 and I would like to share it with you.  
**<!--more-->

  
F**irst of all : you can read whatever you want but you only get to know it by testdriving it ! So <a href="https://www.vmware.com/tryvmware/index.php?p=vsphere&lp=1" target="_blank">download your VMware vSphere 60-day trial here (Official VMware website).</a>  And while your at it, directly download the <a href="http://www.vmware.com/resources/techresources/10020" target="_blank">VMware vSphere Evaluators Guide (vmware.com)</a>; it&#8217;s a 120 page document that walks you through the new features.

**O**ff course I understand that not everyone has a physical lab available, so for those who want to check it out on there laptop or regular PC I suggest the article <a href="http://www.mikes.eu/index.php/troubleshooting/182-install-vmware-esx4-on-workstation.html" target="_blank">Running ESX4 in VMware Workstation 6.5 by Roy Mikes</a>. It&#8217;s a simple article that describes how to install the ESX product virtually. Do pay attention that if you want to run VM&#8217;s within that Virtual ESX server you should also implement the suggestion by Jim Mattson : <a href="http://communities.vmware.com/docs/DOC-8970" target="_blank">Running nested VM&#8217;s</a>.

**T**o make max use of the physical memory you have available on your laptop you should check the article that describes <a href="http://www.yellow-bricks.com/2009/05/08/running-vsphere-within-workstation-will-take-up-a-lot-of-memory/" target="_blank">Minimizing Memory Requirements by Duncan Epping</a>. It describes how to remove the 2gig minimum memory limit and, for example, set it back to 1gig.

**O**ne other interesting article that I found worth mentioning was <a href="http://www.vcritical.com/2009/05/vmware-esx-4-can-even-virtualize-itself/" target="_blank">Virtualizing ESX4 on ESX4 by Eric Gray</a>. It explains one of the new capabilities of VMware ESX 4.0 : it can virtualize itself, so that you can play around with features like HA, DRS and so-on.

**W**hen you&#8217;re already a bit further in the process you might find it interesting to know more about the upgrade and licensing options and you should check out <a href="http://kb.vmware.com/selfservice/microsites/search.do?language=en_US&cmd=displayKC&externalId=1010690" target="_blank">vSphere 4.0 upgrade options (kb.vmware.com)</a> and <a href="http://kb.vmware.com/selfservice/microsites/search.do?language=en_US&cmd=displayKC&externalId=1010839" target="_blank">Licensing vSphere products (kb.vmware.com)</a>.

**Conclusion**: one week of General Availability of vSphere and there&#8217;s already ton&#8217;s of information available to really get into vSphere so enjoy it !

_**Update (05/06/2009)** :_ <a href="https://svenhuisman.com/2009/06/xtravirt-how-to-install-esx-40-on-workstation-652-as-a-vm/" target="_self"><em>Xtravirt just released their own whitepaper </em></a>_(PDF) on Installing ESX 4.0 on VMware workstation including nested VM&#8217;s._