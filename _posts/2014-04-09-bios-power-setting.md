---
id: 2609
title: 'Don&#8217;t forget the BIOS power management setting of your VDI-hosts!'
date: 2014-04-09T16:22:23+02:00
author: Sven Huisman
layout: post
guid: https://svenhuisman.com/?p=2609
permalink: /2014/04/bios-power-setting/
categories:
  - Virtual Desktop
---
I sometimes come across a VDI environment where a certain setting is not set according best practices. The setting I refer to is a well known best practice, but is still often forgotten. The setting can be set two different ways and I discovered that one way will not (always) work. I&#8217;m talking about the Power management setting of the ESXi host. The best practice for VDI-hosts is to set this to &#8220;High Performance&#8221;.

Recently I was at customer and they use an application to do certain calculations. They had a sample script to do the a couple of calculations. On a VDI-desktop on one host this task took 2 minutes to complete and on another host this took 1 minute. This behaviour was consistent. I found out there was a difference in Power Management settings. On the host where the calculations took 2 minutes, the Power management in the BIOS was set at default &#8220;HP Dynamic Power Savings Mode&#8221;:

[<img class="aligncenter size-full wp-image-2611" alt="HP2" src="https://svenhuisman.com/wp-content/uploads/2014/04/HP2.png" width="632" height="131" srcset="https://svenhuisman.com/wp-content/uploads/2014/04/HP2.png 632w, https://svenhuisman.com/wp-content/uploads/2014/04/HP2-350x73.png 350w" sizes="(max-width: 632px) 100vw, 632px" />](https://svenhuisman.com/wp-content/uploads/2014/04/HP2.png)

On the host where the calculations where completed in 1 minute, the BIOS was set at &#8220;HP Static High Performance Mode&#8221;, no reboot required:  
[<img class="aligncenter size-full wp-image-2612" alt="HP3" src="https://svenhuisman.com/wp-content/uploads/2014/04/HP3.png" width="628" height="133" srcset="https://svenhuisman.com/wp-content/uploads/2014/04/HP3.png 628w, https://svenhuisman.com/wp-content/uploads/2014/04/HP3-350x74.png 350w" sizes="(max-width: 628px) 100vw, 628px" />](https://svenhuisman.com/wp-content/uploads/2014/04/HP3.png)

This is the prefered setting! Once I set this on the other hosts, the calculations took 1 minute on each host.

There is one other way to set this on &#8220;High Performance&#8221;. If the power management setting in the BIOS is set to &#8221; OS Control Mode&#8221;:

[<img class="aligncenter size-full wp-image-2610" alt="HP1" src="https://svenhuisman.com/wp-content/uploads/2014/04/HP1.png" width="636" height="125" srcset="https://svenhuisman.com/wp-content/uploads/2014/04/HP1.png 636w, https://svenhuisman.com/wp-content/uploads/2014/04/HP1-350x68.png 350w" sizes="(max-width: 636px) 100vw, 636px" />](https://svenhuisman.com/wp-content/uploads/2014/04/HP1.png)

You can set the Power management setting with the vSphere client on the host:[<img class="aligncenter size-full wp-image-2613" alt="HP4" src="https://svenhuisman.com/wp-content/uploads/2014/04/HP4.png" width="716" height="437" srcset="https://svenhuisman.com/wp-content/uploads/2014/04/HP4.png 716w, https://svenhuisman.com/wp-content/uploads/2014/04/HP4-350x213.png 350w, https://svenhuisman.com/wp-content/uploads/2014/04/HP4-650x396.png 650w" sizes="(max-width: 716px) 100vw, 716px" />](https://svenhuisman.com/wp-content/uploads/2014/04/HP4.png)

&nbsp;

&nbsp;

<span style="line-height: 1.5em;">However, I found out that this setting does not (always) work, or at least in ESXi 5.5 on HP server hosts it doesn&#8217;t. So the preferred method is to set this to Static High Performance in the BIOS. I&#8217;m sure Cisco, Dell, IBM and the other vendors have similar settings.</span>