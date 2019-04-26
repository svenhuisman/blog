---
id: 683
title: Thinapp and licensing
date: 2009-01-20T15:00:12+02:00
author: Sven Huisman
layout: post
guid: https://svenhuisman.com/?p=683
permalink: /2009/01/thinapp-and-licensing/
categories:
  - Virtual Applications
tags:
  - Gabrie van Zanten
  - Thinapp
  - thinstall
  - Veeam
  - VMware
---
Today I had a conversation with Gabrie from <a title="Gabesvirtualworld" href="https://www.gabesvirtualworld.com" target="_blank">gabesvirtualworld.com</a> about licensing <a title="Thinapp" href="https://www.vmware.com/products/thinapp/" target="_blank">Thinapped</a> applications. He has a couple of tools that he Thinapped and he would like to share these tools (VI-client for example). Unfortunately he can&#8217;t do that because of the licensing Thinapp uses. The license of Thinapp is actually build into the executable Thinapp creates at buildtime of an application. Every endpoint needs a Thinapp license to run Thinapped applications.

<!--more-->

It would be nice if there was an option to enter a license at first-run of an application, Gabrie suggests. Where would the license be stored then? In the user&#8217;s sandbox? In the HKCU registry hive? And would this mean a user must do this with all applications at first-run or once per machine (HKLM)? This would take away the &#8220;installfree&#8221;-feature of Thinapp. I would rather suggest a &#8220;freeware&#8221;-license to distribute Thinapped software that is free, like the VI-Client or <a title="FastSCP" href="https://www.veeam.com/esx-fastscp.html" target="_blank">Veeam&#8217;s FastSCP</a>. Someone would still need the Thinapp-suite license to actually Thinapp (build) the freeware software.

I was also wondering if <a title="Thindownload.com" href="https://www.thindownload.com" target="_blank">Thindownload.com</a> was legally distributing Thinapped applications on their site? I guess not&#8230;