---
id: 579
title: What bad memory can do to your virtual machines
date: 2008-11-23T23:16:15+02:00
author: Sven Huisman
layout: post
guid: http://virtualfuture.info/?p=579
permalink: /2008/11/esx_badmemor/
categories:
  - Virtual Infrastructure
tags:
  - ESX
  - memory
  - VMware
---
I was configuring my ESX whitebox (ESXi 3.5 update 3) and I was having some troubles with installing new VM&#8217;s. I was having problems during the installation of Windows 2003 from a mounted ISO. Some files couldn&#8217;t be copied during installation:

<p style="TEXT-ALIGN: center">
  <img class="size-medium wp-image-580 aligncenter" title="errorcopy" src="https://svenhuisman.com/wp-content/uploads/2008/11/errorcopy-300x205.jpg" alt="" width="300" height="205" />
</p>

After I retried to copy the files, it sometimes continued copying, but after a while, I got a nice bluescreen:

<p style="TEXT-ALIGN: center">
  <a href="https://svenhuisman.com/wp-content/uploads/2008/11/stoperror.jpg"><img class="size-medium wp-image-581 aligncenter" title="stoperror" src="https://svenhuisman.com/wp-content/uploads/2008/11/stoperror-300x268.jpg" alt="" width="300" height="268" /></a>
</p>

From the error&#8217;s it is not directly clear that it is a memory problem, but the first thing I tried was to pull out some memory modules. The problems disappeared immediately.

Now this is why VMware advises to test the memory for 72 hours ( you can use <a title="Memtest" href="http://www.memtest86.com/" target="_blank">Memtest86</a>) before you put an ESX server in production.