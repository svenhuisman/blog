---
id: 147
title: 'VMware Powershell script &#8211; Remove snapshots'
date: 2008-07-30T12:17:07+02:00
author: Johan
layout: post
guid: http://virtualfuture.info/?p=147
permalink: /2008/07/remove-snapshots-script/
categories:
  - Scripts
tags:
  - Powershell
  - remove
  - snapshot
---
On one of my previous articles Sven, who is actually a colleque of mine, asked if it would be possible to remove snapshots which were left unaccounted for. I reacted is a simple way: yeah, of course and as a matter of fact is is very easy. I really must say the guys from the VI Toolkit have done a great job on maki<!--more-->ng a lot of complicated things very easy !! Hats off guys.

When I was doing a little background check for this I found another script made by Bas Vinken which can be found <a href="http://www.ntpro.nl/blog/archives/295-PowerShell-Snapshot-Remover.html" target="_blank">here,</a> but what I like about Powershell scripting are what are known to be &#8220;Oneliners&#8221; all code on a single line. This is what shows the real power of powershell and that&#8217;s what I want to show everybody.

So when I created this script I had one thing in mind: &#8220;Keep it simple !&#8221;. Ok here the script:

$snap=get-snapshot -vm * ; remove-snapshot -snapshot $snap

What does it do ?

The Get-snapshot -vm * queries the connected VI server for all VM&#8217;s with associated snapshots, the $snap= statement puts these values in the variable $snap, the remove-snapshot commandlet uses this variable to &#8230;&#8230; commit the snapshot to the Virtual Disk. The &#8220;;&#8221; between the 2 commandlets is nothing else than a seperator instead of a hardreturn (otherwise it wouldn&#8217;t be a oneliner .. duh)

I cannot emphasize the importance of carefullness of using these types of scripts, whatif a snapshot has been made of a disk that has real userdata or an exchange database on it and you revert to a pre-snapshot state ? That&#8217;s why I really hope that everybody uses persistent disks for these kind of data containers. But fortunatly there is not an commandlet to revert to a previous snapshot.