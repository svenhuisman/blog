---
id: 184
title: 'VMware Tweak: Disable Screensaver'
date: 2008-07-30T22:32:05+02:00
author: Johan
layout: post
guid: http://virtualfuture.info/?p=184
permalink: /2008/07/vmware-tweak-disable-screensaver/
categories:
  - Virtual Desktop
tags:
  - ESX
  - tweak
---
I found <a href="http://kb.vmware.com/selfservice/microsites/search.do?language=en_US&cmd=displayKC&externalId=9275881" target="_blank">this</a> interesting article on the VMware Knowledge base site, at least one I really never thought of &#8230; a virtual machine doesn&#8217;t need a screensaver. Below is exactly told how to do this.<!--more-->

  * Screen savers are not necessary for virtual machines
  * Running screen savers wastes CPU resources
  * There is no interface option to disable the screen saver on the log on screen in Windows    
       
    To disable Windows Logon Screen Saver:  
    Click Start > Run, type regedit, click OK.  
    Locate the following registry key:   
     _HKEY_USERS\.DEFAULT\Control Panel\Desktop  
_ Double-click the _ScreenSaveActive_ string value item in the Details pane.  
    In the Value data box, replace the number 1 with the number 0, and then click OK.

For more information, see Microsoft KB article <a href="http://support.microsoft.com/kb/185348" target="_blank">http://support.microsoft.com/kb/185348</a>.