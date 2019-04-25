---
id: 85
title: Convert partitions to separate disks with VMware Converter
date: 2008-07-18T10:13:51+02:00
author: Sven Huisman
layout: post
guid: http://virtualfuture.info/?p=85
permalink: /2008/07/convert-disks-vmware-converter/
categories:
  - Virtual Infrastructure
tags:
  - Converter
  - P2V
  - Platespin
  - Powerconvert
  - VMware
---
When I virtualize a physical server, and the server has a logical disk with multiple partitions on it, I always want to convert those partitions into separate virtual disks. In some cases I want those virtual disks on separate datastores (in case of different RAID types for example). When not using a tool like <a title="Platespin Powerconvert" href="http://www.platespin.com/products/powerconvert/" target="_blank">Platespin Powerconvert</a>, it could be a lot of work. I would convert just the system partition with <a title="VMware converter" href="http://www.vmware.com/products/converter/" target="_blank">VMware Converter</a> and I would clone the other partitions with a disk cloning tool like Symantec Ghost.

It was a while ago that I P2V’d a server, but when I converted a server yesterday, it took me way less time, and I only used VMware converter! This is why:

<!--more-->A couple of months ago VMware released an updated version of VMware converter (version 3.0.3). In this update a new feature was introduced that makes P2V-ing a little bit easier. It is finally possible to convert individual volumes on a single physical disk from the source physical machine to separate and independent virtual disks across different datastores. Thank you VMware!

[](https://svenhuisman.com/wp-content/uploads/2008/07/converter303.jpg)[<img class="alignnone size-medium wp-image-84" title="converter303" src="https://svenhuisman.com/wp-content/uploads/2008/07/converter303-300x253.jpg" alt="" width="300" height="253" srcset="https://svenhuisman.com/wp-content/uploads/2008/07/converter303-300x253.jpg 300w, https://svenhuisman.com/wp-content/uploads/2008/07/converter303.jpg 560w" sizes="(max-width: 300px) 100vw, 300px" />](https://svenhuisman.com/wp-content/uploads/2008/07/converter303.jpg)  
Select: _Create a separate disk for each volume_

[](https://svenhuisman.com/wp-content/uploads/2008/07/converter303-2.jpg)[<img class="alignnone size-medium wp-image-86" title="converter303-2" src="https://svenhuisman.com/wp-content/uploads/2008/07/converter303-2-300x253.jpg" alt="" width="300" height="253" srcset="https://svenhuisman.com/wp-content/uploads/2008/07/converter303-2-300x253.jpg 300w, https://svenhuisman.com/wp-content/uploads/2008/07/converter303-2.jpg 559w" sizes="(max-width: 300px) 100vw, 300px" />](https://svenhuisman.com/wp-content/uploads/2008/07/converter303-2.jpg)  
Select the appropriate datastore for each disk.