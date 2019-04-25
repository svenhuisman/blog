---
id: 583
title: Virtualize SQL Servers? VMware says you should!
date: 2008-11-26T23:58:11+02:00
author: Matthijs Haverink
layout: post
guid: https://svenhuisman.com/?p=583
permalink: /2008/11/virtualize-sql-servers-vmware-says-you-should/
categories:
  - Virtualization news
tags:
  - ESX
  - Microsoft
  - SQL
  - VMware
---
I stumbled upon a nice white paper on the VMware blog concerning virtualizing SQL servers. The conclusion of the article (how surprising) is that in high workload scenario&#8217;s it can be really interesting and usefull to virtualize your Microsoft SQL database servers.

I really advise you to read the full article, because every situation is different but for those who are lazy:

> _Based on the test data presented in this paper, we can conclude that:_
> 
> _&#8211; As the number of virtual machines is increased ESX offers linear scaling of performance until the physical CPUs are saturated.  
> &#8211; Fairness in resource sharing makes ESX a robust platform for hosting and consolidating virtual machines running SQL Server workloads.  
> &#8211; While resources are available, the CPU load on the host has minimal impact on the performance of applications running in virtual machines on that host.  
> &#8211; Virtual machines get the resources they need when resources are not overcommitted. Resources not used by idle virtual machines are dynamically allocated to other virtual machines that need resources without affecting performance._ 

You can read the <a href="https://blogs.vmware.com/performance/2008/11/database-worklo.html" target="_blank">entire article</a> here on the <a href="https://blogs.vmware.com/performance" target="_blank">VMware Blog (VROOM section)</a>