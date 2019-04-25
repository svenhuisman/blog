---
id: 1066
title: VMware ThinApp 4.0.2 released
date: 2009-03-25T10:32:38+02:00
author: Sven Huisman
layout: post
guid: http://virtualfuture.info/?p=1066
permalink: /2009/03/vmware-thinapp-402-released/
categories:
  - Virtual Applications
tags:
  - Application Virtualization
  - Thinapp
  - VMware
---
<p style="TEXT-ALIGN: left">
  VMware just released a minor updated version of ThinApp. ThinApp is the application virtualization solution from VMware and allows you to virtualize an application into a single executable.
</p>

<p style="TEXT-ALIGN: left">
  The only thing that&#8217;s new in this version is:
</p>

<ul style="TEXT-ALIGN: left">
  <li>
    The 4.0.2 release adds the <tt>Wow64</tt> parameter to the <tt>Package.ini</tt> file. You can use this parameter to help run 32-bit applications on a 64-bit Windows operating system.
  </li>
</ul>

<p style="TEXT-ALIGN: left">
  But there are a lot of bugs fixed in this release. You can read them all in the <a title="ThinApp 4.0.2" href="http://www.vmware.com/support/thinapp4/doc/releasenotes_thinapp402.html" target="_blank">release notes</a>.
</p>

<p style="TEXT-ALIGN: left">
  And to show application virtualization isn&#8217;t that simple as it looks, take a look at the known bugs in this release: one bug is still not fixed, while it seems like a simple thing to fix:
</p>

<ul style="TEXT-ALIGN: left">
  <li>
    Acrobat Reader 9 causes 100 percent utilization.
  </li>
</ul>

<img class="size-full wp-image-1068 aligncenter" title="thinapp-diagram-cycle" src="https://svenhuisman.com/wp-content/uploads/2009/03/thinapp-diagram-cycle.gif" alt="thinapp-diagram-cycle" width="403" height="294" />