---
id: 817
title: 'Veeam Backup 3.0: faster backup than with VCB?'
date: 2009-02-17T23:10:05+02:00
author: Sven Huisman
layout: post
guid: https://svenhuisman.com/?p=817
permalink: /2009/02/veeam-backup-30-faster-backup-than-with-vcb/
categories:
  - Virtual Infrastructure
tags:
  - backup
  - esxi
  - Veeam
  - VMware
---
Today <a title="Veeam backup 3.0" href="http://www.veeam.com/vmware-esx-backup.html" target="_blank">Veeam Backup 3.0</a> was released and the big eye-catcher of this backup and recovery tool is that it is the first tool ever that supports ESXi without the use of VCB:

> _Veeam Backup 3.0 now supports ESXi backup without VCB. Veeam Backup is the only VMware backup solution that lets you backup and restore virtual machines running on all existing editions of ESXi, including ESXi free._

As I&#8217;m using ESXi at home I decided to quickly test if there was a speed difference in backup with Veeam backup 3.0 vs Veeam Backup 3.0 with VCB (over LAN) vs Backup Exec 12.5 with VCB (over LAN). The VM has a disk size of 10GB and has 6,5 GB files on it. In all situations the backup-destination was to disk.  
Here are the stats:<!--more-->

<span style="text-decoration: underline;"><strong>Veeam (Agentless):</strong></span>  
Total VM size: 10,00 GB  
Processed size: 10,00 GB  
Avg. performance rate: 36 MB/s  
Backup mode: agentless

<span style="text-decoration: underline;"><strong>Veeam (with VCB):</strong></span>  
Total VM size: 10,00 GB  
Processed size: 10,00 GB  
Avg. performance rate: 34 MB/s  
Backup mode: VCB NBD

**<span style="text-decoration: underline;">Backup Exec 12.5 with VCB:<br /> </span>**Backed up 13 files in 1 directory.  
Processed 6.238.658.855 bytes in  9 minutes and  26 seconds.  
Throughput rate: 631 MB/min (10,5 MB/s)

So in this situation, Backup of a VM on an ESXi server is the fastest with Veeam Backup 3.0 agentless. It was only slightly faster than Veeam backup 3.0 with VCB, but a lot faster than Backup Exec 12.5 with VCB. Of course, this is not a real test I&#8217;ve done. It&#8217;s just a quick look at the new functionality that Veeam offers now, and I must admit, it works like a charm.

PS: I think there is a typo on the Veeam site:

> _**Veeam Backup** is the first enterprise-ready solution that combines backup and replication in a single product for fast recovery of your VMware ESX servers._

You cannot actually backup or recover an ESX server with Veeam Backup, just the VM&#8217;s running on it 🙂