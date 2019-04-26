---
id: 1217
title: 'Reduce MS licensing costs by 95% !!! in a virtualized environment.'
date: 2009-05-30T00:01:15+02:00
author: Matthijs Haverink
layout: post
guid: https://svenhuisman.com/?p=1217
permalink: /2009/05/reduce-ms-licensing-costs-by-95-in-a-virtualized-environment/
categories:
  - Virtual Infrastructure
tags:
  - '95%'
  - Citrix
  - Licensing
  - Microsoft
  - Microsoft Server Management Suite Enterprise
  - Reduce costs
  - SCOM
  - SMSE
  - virtual environment
  - VMware
---
**T**his sounds impossible but when I read <a href="https://searchvmware.techtarget.com/tip/0,289483,sid179_gci1357346_mem1,00.html" target="_blank">Gabe&#8217;s article</a> correctly he brings back **Microsoft OS licensing costs** of about** $800.000** (for 200 physical hosts) **back to just $40.000** (for 200 virtual hosts). Of course this presents an ideal situation.

<span style="text-decoration: underline;"><strong>T</strong>he situation Gabe describes:</span>  
&#8211; 200 physical hosts -> 200 virtual guests on 7 physical hosts  
&#8211; virtualization solution can be any: MS, Citrix, VMware or other  
<!--more-->&#8211; physical hosts contain 2 physical Quad Core CPU&#8217;s (8 cores total)

  
&#8211; consolidation ratio of 4 vm&#8217;s per core = 32 vm&#8217;s per physical host  
&#8211; Windows Server 2008 Datacenter licensing with a price of $2.999 per CPU so $5.998 per physical host  
&#8211; no physical extra capacity for redundancy  
&#8211; storage solution that can handle this kind of traffic  
&#8211; no CALs included (because of Datacenter edition)

**B**esides OS licensing Gabe also shows an example (same environment as above) of **SCOM licensing costs** that can be **reduced** with about **90%** by **choosing** for the **Microsoft Server Management Suite Enterprise (SMSE)** instead of single SCOM licenses per Guest/Host.

**A**gain, these are extreme situations but they do show that you can seriously cut back costs if you <span style="text-decoration: underline;">take a serious look at your MS licensing costs</span> and options, so check it out!

**C**heck out the full article of <a href="https://www.gabesvirtualworld.com/" target="_blank">Gabrie van Zanten</a> here : <a href="https://searchvmware.techtarget.com/tip/0,289483,sid179_gci1357346_mem1,00.html" target="_blank">https://searchvmware.techtarget.com/tip/0,289483,sid179_gci1357346_mem1,00.html</a>

**C**heck out the FAQ&#8217;s concerning W2K8 licensing here : <a href="https://www.microsoft.com/windowsserver2008/en/us/licensing-faq.aspx" target="_blank">https://www.microsoft.com/windowsserver2008/en/us/licensing-faq.aspx</a>