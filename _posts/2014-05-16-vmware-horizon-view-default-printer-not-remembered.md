---
id: 3112
title: 'VMware Horizon View default printer not remembered'
date: 2014-05-16T16:08:18+02:00
author: Sven Huisman
layout: post
guid: https://svenhuisman.com/?p=3112
permalink: /2014/05/vmware-horizon-view-default-printer-not-remembered/
categories:
  - Virtual Desktop
tags:
  - Horizon
  - Thinprint
  - View
  - VMware
---
With VMware Horizon View you can use thinprint to allow users to use the local connected printer to print. For example, when users connect from home and they have a local installed printer, Thinprint connects the local printer in the session using the Thinprint driver. This printer will become the default printer during the session. This is very practical, because the user doesn&#8217;t have to think about the printer that is connected to the session. The bad thing is, the next time the user works from the office, the previous default network printer the user had during the session connected from the office is not the default printer anymore. This is caused by the fact that the previous default printer (the one thinprint connects) isn&#8217;t available in the session connected from the office.

Assume that the users get network printers working from the office and that roaming profiles or Persona Management is configured.

When you ask VMware support about this, they will probably suggest to setup location-based printing. This will connect the nearest printer to the user, when the user launches a session from the office. Unfortunately, location-based printing is not always an option to implement.

You can also <a title="Disable default printer Thinprint" href="http://kb.vmware.com/selfservice/microsites/search.do?language=en_US&cmd=displayKC&externalId=2012770" target="_blank">edit the clients registry</a>, so the local connected printer will not be the default in the session. This is a good option if you can edit this setting on the home PC of your users and if the home PC is a Windows-based PC. On Mac OSX, this settings can&#8217;t be changed.

The easiest way to solve this, is to create a logoff-script that exports the default printer when connected from the office and create a logon-script to import the default printer when connected from the office. To check if a user is connected from the office, you can use different checks. In the following script, it checks if the user is connecting from a tunneled connection. I assume that internal users get a direct connection to the desktop and the external users are tunneled through a security server. If this is not the case, you could also check on client ip-range or client name.

<pre>Logoff script:
Set oShell = CreateObject("WScript.Shell")
Tunneled = oShell.ExpandEnvironmentStrings("%ViewClient_Broker_Tunneled%")</pre>

<pre>if (Tunneled = "false") then
oShell.Run("reg export ""HKCU\Software\Microsoft\Windows NT\CurrentVersion\Windows"" ""%APPDATA%\defaultprt.reg"" /y") 
End If</pre>

<pre>Logon script:
Set oShell = CreateObject("WScript.Shell")
Tunneled = oShell.ExpandEnvironmentStrings("%ViewClient_Broker_Tunneled%")</pre>

<pre>if (Tunneled = "false") then
oShell.Run("reg import ""%APPDATA%\defaultprt.reg"" /y") 
End If</pre>