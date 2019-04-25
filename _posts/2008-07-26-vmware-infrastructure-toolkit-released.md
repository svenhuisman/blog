---
id: 103
title: VMware Infrastructure Toolkit Released
date: 2008-07-26T17:12:34+02:00
author: Johan
layout: post
guid: http://virtualfuture.info/?p=103
permalink: /2008/07/vmware-infrastructure-toolkit-released/
categories:
  - Scripts
tags:
  - Powershell
  - Toolkit
  - VMware
---
People who want to have scripting abilities added to their ESX farm can now finally download the Powershell addon for VMware Infrastructure because is has been officially released and thus supported. This addon is far more easy to learn than visual basic or perl scripting (the previous scripting languages you had to learn if you wanted this kind automation). The VI Toolkit added over 120 commandlets which eases the automation and scriptablity of ESX servers or an ESX farm.

<!--more-->Adding a host e.g uses the following command: &#8220;

_Add-VMHost -Name 10.23.113.24 -Location (Get-Datacenter Main) -User root -Password MyPass&#8221;_ . __

Powershell in general uses easy to read and understand commands. I have used powershell on numerous ocassions and was impressed by the ease and clarity of the commands and am glad that the VI Toolkit is no exception.

Download it <a href="http://www.vmware.com/sdk/vitk_win/index.html" target="_blank">the VI Toolkit</a> and start using it. I would really recommend it.