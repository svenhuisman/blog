---
id: 1556
title: 'KB article: Best practices for upgrading to VMware View 4.0'
date: 2009-11-23T22:23:18+02:00
author: Sven Huisman
layout: post
guid: https://svenhuisman.com/?p=1556
permalink: /2009/11/kb-article-best-practices-for-upgrading-to-vmware-view-4-0/
categories:
  - VDI Blog Battle
  - Virtual Desktop
tags:
  - best practices
  - View 4
  - VMware
  - VMware View 4
---
VMware released a KB article about <a title="Best practices upgrading to VMware View 4" href="http://kb.vmware.com/selfservice/microsites/search.do?language=en_US&cmd=displayKC&externalId=1015858" target="_blank">best practices for upgrading to VMware View 4</a>. This article gives a nice compatibility matrix of which components of View 4 are compatible with components of View 3. As you can see, View agent 3.x is compatible with Connection server 4.0 and View agent 4.0 is compatible with Connection server 3.x. View Client 4.0 is compatible with Connection server 3.x and View Client 3.x is compatible with Connection server 4.0. So it doesn&#8217;t really matter if you update the clients, the agents or the server first. Just be careful if you use the View composer component:<!--more-->

_ * Until both View Connection Server and View Composer are upgraded, View Composer operations do not work. If you have View Connection Server 4.0 and View Composer 1.0, you can connect to their desktops, but no new linked-clone desktops can be created, and recompose, rebalance, and refresh operations do not work.  
   
** Although View Composer 2.0 can work with View Connection Server 3.x, this setup is available only for cases where upgrading all View Connection Server instances during the same maintenance window is not feasible._