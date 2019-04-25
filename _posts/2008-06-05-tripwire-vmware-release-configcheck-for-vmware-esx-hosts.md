---
id: 12
title: 'Tripwire &amp; VMWare release ConfigCheck for VMware ESX Hosts'
date: 2008-06-05T09:34:13+02:00
author: Matthijs Haverink
layout: post
guid: http://virtualfuture.info/?p=12
permalink: /2008/06/tripwire-vmware-release-configcheck-for-vmware-esx-hosts/
categories:
  - Virtualization news
tags:
  - ConfigCheck
  - ESX
  - Security
  - Tripwire
  - VMware
---
Yesterday <a title="Tripwire" href="http://www.tripwire.com" target="_blank">Tripwire</a> released their free utility call <a title="Tripwire ConfigCheck for VMware ESX Hosts" href="http://www.vmware.com/security/resources/configcheck.html" target="_blank">TripWire ConfigCheck</a>.

Together with <a title="VMWare" href="http://www.vmware.com" target="_blank">VMWare</a> <a href="http://www.tripwire.com" target="_blank">Tripwire</a> has developed this tool which helps to rapidly assess the security of your VMWare ESX 3.5 servers. Among other things the joint effort consists of VMWare delivering the VMWare Infrastructure 3 Security Hardening guidelines. This tool also provides the necessary steps that are needed for full remediation.

A couple of configuration parameters that are being checked are:

&#8211; Virtual network labeling  
&#8211; Port Group settings  
&#8211; Network isolation for VMotion and iSCSI  
&#8211; NIC Mode settings / Layer 2 Security settings  
&#8211; VMWare ESX Service Console security settings  
&#8211; SAN resource masking and zoning

The website states that the system requirements are Windows Server 2003 + <a title="Download JRE 1.5 here" href="https://cds.sun.com/is-bin/INTERSHOP.enfinity/WFS/CDS-CDS_Developer-Site/en_US/-/USD/ViewProductDetail-Start?ProductRef=jre-1.5.0_15-oth-JPR@CDS-CDS_Developer" target="_blank">JRE 1.5</a> so that&#8217;s the official supported platform by TripWire. But as you can see in Gavin&#8217;s post below: Windows XP, Linux and even OS-X should work without a problem. Great work Gavin!

You can download the tool <a href="http://www.tripwire.com/configcheck/configcheckdownload.cfm" target="_blank">here</a>.

Edit [10-6-2008 Matthijs] : Gavin Millard from TripWire yesterday published a &#8220;How To&#8221; concerning ConfigCheck : <http://www.tripwire.org/blog/?p=38> . Kind-a-handy since there&#8217;s no official manual :).