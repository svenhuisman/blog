---
id: 189
title: 'VMware Powershell script &#8211; HBA LoadBalancer script'
date: 2008-07-31T10:39:54+02:00
author: Matthijs Haverink
layout: post
guid: https://svenhuisman.com/?p=189
permalink: /2008/07/vmware-hba-loadbalancer-script/
categories:
  - Scripts
tags:
  - HBA
  - load balancing
  - Matthijs Haverink
  - Powershell
  - Rob Mokkink
  - script
  - VMware
---
One of the things you have to be carefull within a Virtual Infrastructure environment, just as in every other environment by the way, is how your LUNs are balanced over the HBA&#8217;s. Especially when you have a pretty dynamic infrastructure you might not always pay attention to this.

My colleague [Rob Mokkink](mailto:rob@mokkinksystems.com "Drop Rob an e-mail !") has made a pretty nice powershell script that balances LUN&#8217;s on the different HBA&#8217;s.

<span style="text-decoration: underline;">What it does :<br /> </span><!--more-->

  
&#8211; It sets the Path Management **Policy to fixed**  
&#8211; Sets **odd luns** to a preferred path of **vmhba1**  
&#8211; Sets **even luns** to a preferred path of **vmhba2**

**_We always need to state that usage of scripts like these should be done with extreme caution because every environment is different so results can differ !_**

You can <a href="https://communities.vmware.com/servlet/JiveServlet/download/999336-11423/set-allvmhost-storagepaths-fixed-v6.ps1?tstart=0&start=0" target="_blank">download the HBA Load Balancer script</a> now.

If you have any questions or comments you can drop them on the <a href="https://communities.vmware.com/thread/156302?tstart=0&start=0" target="_blank">tread at the vmware communities site</a>.