---
id: 455
title: 'VMworld 2008 &#8211; Great news on ESX 4.0'
date: 2008-09-19T16:32:44+02:00
author: Johan
layout: post
guid: http://virtualfuture.info/?p=455
permalink: /2008/09/vmworld-2008-great-news-on-esx-40/
categories:
  - VMworld 2008 Vegas
tags:
  - VMware
  - 'VMWorld 2008 - ESX 4.0'
---
Yesterday I went to the very last session of VMworld, it was an hands on lab with ESX 4.0 Beta. The labs guys were very strict on no taking photographs and the disclaimer that everything is still under development and could change as it is being developed. They were saying new, renamed or changed features with every new build they got.<!--more-->

**The interface**

I must admit I was pretty pleased with the new vCenter functionality and the VC Interface. All features are grouped together so it is much more intuitive. Almost everywhere it is possible to rightclick and get the same features as if you were rightclicking the object itself e.g. if a vSwitch is selected you can get the properties by rightclicking it but it is also possible to rightclick in the rightpane to get the same options.

**Features**

The last couple of days we heard enough about all the new features that will probably come with ESX 4.0 like Fault Tolerant (vLockstep), Thin provisioning, vCenter now becoming a vApp and so on. I will not go into that.

Remember the limit on the amount of vNIC&#8217;s in a VM ? Yes it&#8217;s 4 because the chipset it is based on is a 440BX (correct me if I&#8217;m wrong) which allows only 6 PCI cards (Video, SCSI and max 4 NIC&#8217;s). Normally when more NIC&#8217;s are required e.g. for a router or firewall like ISA, you would install the VLANning driver from Intel and thus create NIC&#8217;s. I have done so in my own testing environment and created a number of Nic as shown below.

[<img class="alignnone size-medium wp-image-456" src="https://svenhuisman.com/wp-content/uploads/2008/09/nics-300x134.jpg" alt="" width="300" height="134" />](https://svenhuisman.com/wp-content/uploads/2008/09/nics.jpg) 

I noticed during the session that there was an Virtual Machine detail that&#8217;s called VM version (the version of the hardware which will be 7) and immediately I realized that the limitation could have been removed. So we added a couple of NIC&#8217;s and added some more and ended up with 10 NIC&#8217;s and we could add even more if we wanted to. I personally think that&#8217;s great news because you could create very interesting VM&#8217;s.

BTW: Have you read about the <a title="Shirt Vmotion" href="https://svenhuisman.com/2008/09/vizioncore-releases-new-technology-shirt-vmotion" target="_self">shirt-vmotion</a> technology introduced by Vizioncore ? As it seems even VMware noticed this and I personally did a succesfull shirt-vmotion with one of the lab instructors &#8230;