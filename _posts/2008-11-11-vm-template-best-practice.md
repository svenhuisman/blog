---
id: 558
title: VM-Template best practice
date: 2008-11-11T11:52:50+02:00
author: Sven Huisman
layout: post
guid: http://virtualfuture.info/?p=558
permalink: /2008/11/vm-template-best-practice/
categories:
  - Virtual Infrastructure
tags:
  - templates
  - thin provisioning
  - VM
  - VMware
---
Here are 2 great articles of best practices for creating templates for virtual machines. I&#8217;m referring them here as my own bookmarks:

<a title="VM Template best practices (Windows)…" rel="bookmark" href="http://lraikhman.blogsite.org/?p=281" target="_blank"><span style="color: #015d82;">VM Template best practices (Windows)</span></a>

<a title="VM Template best practices (Linux)" rel="bookmark" href="http://lraikhman.blogsite.org/?p=298" target="_blank"><span style="color: #015d82;">VM Template best practices (Linux)</span></a>

One thing I learned is that you already can create thin provisioned disks in VMware ESX 3.5:

> _vmkfstools -c 20G -d thin /vmfs/volumes/**datastore**/**virtualmachine_****name**/**virtualmachine_disk1.vmdk**_

Big thanks to <a title="http://lraikhman.blogsite.org" href="http://lraikhman.blogsite.org" target="_blank">lraikhman</a>