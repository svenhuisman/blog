---
id: 1253
title: HOWTO manage HP P400 RAID controller in a vSphere whitebox
date: 2009-06-23T21:22:24+02:00
author: Sven Huisman
layout: post
guid: http://virtualfuture.info/?p=1253
permalink: /2009/06/howto-manage-hp-p400-raid-controller-in-a-vsphere-whitebox/
categories:
  - Virtual Infrastructure
tags:
  - ESX
  - ESX 4
  - esxi
  - ESXi4
  - HP Smartarray P400
  - P400
  - VMware
  - vSphere
---
A while ago I posted an article about my <a title="ESX Whitebox P400" href="https://svenhuisman.com/2009/02/esx-whitebox-local-storage-perfomance-tip/" target="_blank">ESX whitebox and the HP P400 RAID controller</a> I use in this whitebox server. At that time, I used ESXi 3.5 and there was no way I could configure or get the status from the RAID controller. Fortunately, someone commented that it was possible when using the regular ESX (no i) version by installing some HP software packages. I&#8217;ve been using ESXi 4 for some time now, but it was quiet annoying when of my disks died and I wasn&#8217;t informed about it or could not check the status, other than by restarting the server. I have switched to ESX 4 and now I want to be able to check and configure my P400 RAID controller. And I can! This is how I did it:<!--more-->

Download the following packages from the HP site:

<a title="hpsmh-3.0.1" href="http://h20000.www2.hp.com/bizsupport/TechSupport/SoftwareDescription.jsp?lang=en&cc=US&swItem=MTX-d7bcce2dc82d43daaec308eb40&prodTypeId=329290&prodSeriesId=1157687" target="_blank">hpsmh-3.0.1-73.x86_64.rpm</a>  
<a title="cpqacuxe-8.28" href="http://h20000.www2.hp.com/bizsupport/TechSupport/SoftwareDescription.jsp?lang=en&cc=us&prodTypeId=329290&prodSeriesId=1157687&prodNameId=1157689&swEnvOID=4004&swLang=8&mode=2&taskId=135&swItem=MTX-ad208f23dd0145d0a0fee8ada3" target="_blank">cpqacuxe-8.28-13.0.noarch.rpm</a>  
<a title="hpacucli-8.28" href="http://h20000.www2.hp.com/bizsupport/TechSupport/SoftwareDescription.jsp?lang=en&cc=us&prodTypeId=329290&prodSeriesId=1157687&prodNameId=1157689&swEnvOID=4004&swLang=8&mode=2&taskId=135&swItem=MTX-fc45026e3c2c441680ddfda356" target="_blank">hpacucli-8.28-13.0.noarch.rpm</a>

Copy these files to your ESX server (/tmp is a good location).

Install these packages with: rpm -ivh <packagename>

When installed, you can start the the acu web interface:

cpqacuxe -R

Open firewallport 2301 by using:

esxcfg-firewall -o 2301,tcp,out,HPACU

And your done. Go to: <http://<esxhostname>:2301> and you can manage your HP P400 RAID controller:

[<img class="aligncenter size-medium wp-image-1254" title="p400" src="https://svenhuisman.com/wp-content/uploads/2009/06/p400-349x159.jpg" alt="p400" width="349" height="159" />](https://svenhuisman.com/wp-content/uploads/2009/06/p400.jpg)