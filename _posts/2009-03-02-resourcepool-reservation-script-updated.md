---
id: 943
title: ResourcePool Reservation Script updated
date: 2009-03-02T22:18:36+02:00
author: Matthijs Haverink
layout: post
guid: https://svenhuisman.com/?p=943
permalink: /2009/03/resourcepool-reservation-script-updated/
categories:
  - Scripts
tags:
  - ESX
  - Powershell
  - VMware
---
The following script is based on <a title="NTpro.nl" href="http://www.ntpro.nl" target="_blank">Eric Sloof</a>&#8216;s Resourcepool calculator.

I modified it quit a bit. It now has, logging, can be run as a scheduled task, % of resource reservation for memory and cpu that can be set on a resourcepool. The script respects the reservertion set on a particular vm.

You need to adjust the following variables:<!--more-->

#SCRIPTVARIABLES  
$MEMRES = 30 # %OF MEMORY USED FOR RESERVATION  
$CPURES = 15 # %OF CPU USED FOR RESERVATION  
$HOSTCPUMHZ = 2931 # AMOUNT OF MHZ PER CPU/CORE ON THE ESX HOST  
$VCSERVER = &#8220;localhost&#8221;  
$ARCHDAYS = 7  
$LOGFOLDER = &#8220;c:\ViLOG&#8221; #LOG DIRECTORY  
$LFILEOBJ = &#8220;respool-*&#8221;

The script can be downloaded at the following site:

<http://communities.vmware.com/docs/DOC-9610>