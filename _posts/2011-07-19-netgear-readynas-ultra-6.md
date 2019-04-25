---
id: 2091
title: Netgear ReadyNAS Ultra 6 review
date: 2011-07-19T14:00:58+02:00
author: Matthijs Haverink
layout: post
guid: https://svenhuisman.com/?p=2091
permalink: /2011/07/netgear-readynas-ultra-6/
image: /wp-content/uploads/2011/07/NetgearReadyNasUltra6.jpg
categories:
  - Storage
tags:
  - Cisco
  - comparison
  - failover
  - Iomega
  - Netgear ReadyNAS Ultra 6
  - QNAP
  - review
  - SMB
  - Synology
  - X-RAID2
---
**T**his is the fourth post in the [_**SMB/LAB NAS review**_](https://svenhuisman.com/2011/07/smblab-nas-review/). This review compares the following products on features and performance:

**&#8211; [Cisco NSS324](http://www.cisco.com/en/US/products/ps10854/index.html)  
** &#8211; **[Iomega IX4-200d](https://iomega-eu-en.custhelp.com/app/answers/detail/a_id/22024)  
** &#8211; **[Netgear ReadyNAS Ultra 6](http://www.netgear.com/home/products/storage/work-and-play/RNDU6000.aspx)  
** &#8211; **[QNAP TS-859U-RP+](http://www.qnap.com/pro_detail_feature.asp?p_id=185)  
** &#8211; **[Synology RS1511+](http://www.synology.com/products/product.php?product_name=DS1511%2B&lang=enu)**

**T**oday I describe my experiences with the the Netgear ReadyNAS Ultra 6. It is a 6 bay desktop model. It has a single power supply, dual NIC, 2 USB ports on the back and one USB port on the front, with a copy/backup button. It has lockable trays and a display on the front. It also has an on/off button on the back and that’s unique. <!--more-->

**Netgear ReadyNAS Ultra 6 Basics:**  
_\# Disks : 6_  
_\# Hot swappable: Yes_  
_\# CPU : Intel Atom 1,66 Ghz Dual Core_  
_# RAM : 1 GB DDR2_  
_\# FLASH : 128 MB_  
_\# Protocols : NFS, CIFS, iSCSI, AFB/Bonjour_

__**T**he Netgear looks slick and solid and is pretty quiet because of the use of 2 big fans, one on the back and one on the side. It has a regular 230V power supply so no additional adapter is required. Because of the 6 bays you can add up to 12 GB of storage to this device at the moment.

**W**hen it comes down to the management interface you see that it&#8217;s really SMB minded, meaning that it is designed for non-IT staff to manage. That can be a pro or a con, depending on what type of user you are of course. For me personally (IT-nerd) it is too limited in features and settings. But because of the limitation in features it is exactly the device you need in an SMB environment where no dedicated IT staff is available and it has to be managed by someone who probably doesn’t even want to manage it.[<img class="alignright size-medium wp-image-2104" title="Netgear ReadyNAS Ultra 6 - empty" src="https://svenhuisman.com/wp-content/uploads/2011/07/netgear_readynasultra6_opened-350x350.jpg" alt="" width="350" height="350" srcset="https://svenhuisman.com/wp-content/uploads/2011/07/netgear_readynasultra6_opened-350x350.jpg 350w, https://svenhuisman.com/wp-content/uploads/2011/07/netgear_readynasultra6_opened-200x200.jpg 200w, https://svenhuisman.com/wp-content/uploads/2011/07/netgear_readynasultra6_opened-250x250.jpg 250w, https://svenhuisman.com/wp-content/uploads/2011/07/netgear_readynasultra6_opened-75x75.jpg 75w, https://svenhuisman.com/wp-content/uploads/2011/07/netgear_readynasultra6_opened.jpg 1000w" sizes="(max-width: 350px) 100vw, 350px" />](https://svenhuisman.com/wp-content/uploads/2011/07/netgear_readynasultra6_opened.jpg)

**A**lso the alerting part; sending an e-mail when, for example, a quota has been reached, a disk has failed, the temperature gets high or the power source switched to UPS, is nice plus.

**W**hat strikes me is that the ReadyNAS is very much focused on what it’s supposed to do in basic: serve files and make backups. Those 2 parts can be configured into a very very granular level, without making it complicated. However, I would have expected Active Directory support in there so that it can be used seamlessly in, for example, an existing Microsoft SBS environment, but that’s not the case.

**W**hen it comes to backup, the ReadyNAS is your friend. It gives you a lot of control concerning your backups. It can back-up to ánd from a variety of devices/protocols.

**T**he interface is clear and very user friendly. It could have been the most user friendly interface; it hides complicated RAID choices and translates it to (business) needs and arranges it using it’s unique X-RAID2 feature. There’s only one but; it’s a pretty outdated (D)HTML based interface, no AJAX like the competition and in this case that means; a lot of scrolling in the config screens.

[](../wp-content/uploads/2011/07/ReadyNAS-Frontview-Netgear42-Mozilla-Firefox_2011-03-13_20-30-49.png)**<img class="size-medium wp-image-2096 alignleft" style="margin-top: 4px; margin-bottom: 4px;" title="Netgear ReadyNAS Ultra 6 - Interface" src="https://svenhuisman.com/wp-content/uploads/2011/07/ReadyNAS-Frontview-Netgear42-Mozilla-Firefox_2011-03-13_20-30-49-350x234.png" alt="" width="350" height="234" srcset="https://svenhuisman.com/wp-content/uploads/2011/07/ReadyNAS-Frontview-Netgear42-Mozilla-Firefox_2011-03-13_20-30-49-350x234.png 350w, https://svenhuisman.com/wp-content/uploads/2011/07/ReadyNAS-Frontview-Netgear42-Mozilla-Firefox_2011-03-13_20-30-49.png 948w" sizes="(max-width: 350px) 100vw, 350px" />I** do have to mention one other downside: the device has 2 NICS’s but you&#8217;re not able to configure them for load balancing or fail-over.

<span style="text-decoration: underline;"><strong>My conclusion</strong></span> of this device; for a small company with no dedicated IT staff that needs an easy to use and reliable device for serving file and backing them up; this is the one. But if you&#8217;re an advanced home user/freak that want&#8217;s a NAS device for as many features as possible, you should go look somewhere else.

**+ Easy interface (limited features)**  
**+ X-RAID2 user friendly RAID configuration**  
**&#8211; Limited features (easy interface)**  
**&#8211; No load balancing/fail-over mode available**  
**&#8211; No AD integration**

**STAY TUNED:** Since this isn’t all; this week after the general reviews we’ll present to you a feature comparison and some performance indicators and of course the general conclusion.