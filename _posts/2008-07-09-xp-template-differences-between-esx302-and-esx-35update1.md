---
id: 79
title: XP Template differences between ESX3.02 and ESX 3.5 Update1
date: 2008-07-09T08:24:19+02:00
author: Johan
layout: post
guid: https://svenhuisman.com/?p=79
permalink: /2008/07/xp-template-differences-between-esx302-and-esx-35update1/
categories:
  - Virtualization news
tags:
  - ESX
  - VMware
---
Recently I was a bit puzzled; a client of mine asked me which SCSI interface he should use for his XP test machine on ESX 3.02. Because after he loaded the VMWare SCSI driver the XP setup told him there was no disk present. I told him to use a Buslogic SCSI card instead of the LSI Logic and everything went smooth after that. Last day I did the same except I used the default SCSI<!--more--> card and noticed that the Buslogic SCSI card was already selected as oposite to my clients one where the LSI Logic SCSI card was selected. So I started a little investigation and found that the difference was primarily due to the ESX version (ESX 3.02 and ESX 3.5Upd1) there are some differences between the XP template of ESX 3.02 and ESX 3.5Upd1. Here are my findings:

  * the default disk size is increased to 8Gb (was 4Gb); this is equally true for the Windows 2003 template
  * the default SCSI Card is Buslogic (was LSI Logic)

So the Virtual Machine template is bound to the ESX version and not the Virtual Center Version. This brings a question to me which differences are there between the other VM templates .. So any comment is welcome !!