---
id: 127
title: 'VMware Powershell script &#8211; remove connected iso'
date: 2008-07-29T12:09:49+02:00
author: Johan
layout: post
guid: https://svenhuisman.com/?p=127
permalink: /2008/07/powershell-remove-connected-iso/
categories:
  - Scripts
tags:
  - ESX
  - Powershell
  - script
  - Toolkit
  - VMware
---
In the light of the offically released Virtual Infrastructure Toolkit I decided to create a simple powershell script. I&#8217;m planning to create more powershell scripts and post them on virtualfuture.info.

The first one is a script which can remove the connected iso files from the CD drive. Some administrators do not disconnect a CD drive when the have finished use the ISO, the side effects of this behaviour are: the VM regurally polls the CD drive which creates a slight overhead and a VMotion may fail. This script can run unattended e.g. every night so even when an ISO file remains mounted it is ejected everynight. <!--more-->Here&#8217;s the script:

Connect-VIServer -Server myVIserver (connect to the VI server)  
get-cddrive -VM * |where {$_.ISOPATH -ne $null}|set-cddrive  -nomedia

I think the script speaks for itself.

So if anyone thinks of something to script and don&#8217;t know how please leave a comment and maybe we can find a way to script it.