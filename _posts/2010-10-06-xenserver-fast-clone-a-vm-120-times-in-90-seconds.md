---
id: 1772
title: 'Xenserver: fast-clone a VM 120 times in 90 seconds'
date: 2010-10-06T21:55:53+02:00
author: Sven Huisman
layout: post
guid: https://svenhuisman.com/?p=1772
permalink: /2010/10/xenserver-fast-clone-a-vm-120-times-in-90-seconds/
categories:
  - Virtual Infrastructure
tags:
  - Citrix
  - Clone
  - VRC
  - xenserver
---
<p style="text-align: left;">
  I&#8217;ve been working on Project VRC lately and in this role I&#8217;ve had the opportunity to work with different hypervisors. In my quest to conquer Xenserver I ran into a couple of challenges and I would like to share these with my readers (as I learned it the hard way, why not make it easier for you).<br /> One of the things I needed to figure out was how to clone a VM multiple times. With Xenserver, there are a couple of options to clone a VM. From XenCenter you can right-click a VM and choose: Copy VM&#8230;
</p>

<p style="text-align: left;">
  <img class="size-medium wp-image-1778 aligncenter" title="XScopyVM" src="https://svenhuisman.com/wp-content/uploads/2010/10/XScopyVM-350x335.png" alt="" width="221" height="214" />
</p>

<p style="text-align: left;">
  <!--more-->You then have 2 options: a full copy or a fast-clone, a faster &#8220;Copy-on-Write&#8221; (CoW) mode which only writes modified blocks to disk. I needed to fast-clone, because if I was going to full copy my Windows 7 VM I would need more diskspace than was available in the server.
</p>

<p style="text-align: left;">
  First challenge: I was working with local storage. By default, the XenServer installation creates the local storage with Logical Volume Manager (LVM). Fast Cloning of VM templates is currently supported with the following storage types: ext, nfs, netapp, equallogic, so no LVM! Luckily, there is a Citrix article where it is described <a title="LVM to EXT" href="http://support.citrix.com/article/CTX120867" target="_blank">how to change your existing Local LVM storage to ext type</a>. <!--more-->
</p>

<p style="text-align: left;">
  After doing this I was able to fast-clone a VM. Next was to find out how to script this fast-cloning, because I needed to fast-clone a VM 120 times. I asked around but no one had a script to do this. My colleague Ruben then posted a question on the <a title="Citrix Community" href="http://forums.citrix.com/thread.jspa?messageID=1500830" target="_blank">Citrix Community forum</a> and within a coupleof hours a simple script was posted. I tested the script and it seem to work: it successfully cloned a VM. I started the script for 120 VM&#8217;s and went to bed. The next morning, it had only cloned only 60 VM&#8217;s and was still busy. Also the local storage was almost full. Mmm&#8230; that&#8217;s no &#8220;fast&#8221; cloning. So I adjusted the script and now I was able to <strong>fast-clone a VM 120 times in 90 seconds</strong>! Here is the script I used:
</p>

`#!/bin/bash<br />
read -p "Template: " TEMPLATE<br />
read -p "Name Prefix: " NAME<br />
read -p "Quantity: " QUANTITY<br />
COUNT=1<br />
while [ $COUNT -le $QUANTITY ] ; do<br />
  xe vm-clone vm="$TEMPLATE" \<br />
  new-name-label="$NAME$COUNT";<br />
  let COUNT=COUNT+1<br />
  done<br />
exit 0`

I noticed it&#8217;s not easy/possible in XenCenter to select 120 VM&#8217;s and shut them down or start them up with one click. So I adjusted the script to do just that:

Start VM&#8217;s  
`#!/bin/bash<br />
read -p "Name Prefix: " NAME<br />
read -p "Quantity: " QUANTITY<br />
COUNT=1<br />
while [ $COUNT -le $QUANTITY ] ; do<br />
  xe vm-start vm="$NAME$COUNT";<br />
  let COUNT=COUNT+1<br />
  done<br />
exit 0`

Shutdown VM&#8217;s  
`#!/bin/bash<br />
read -p "Name Prefix: " NAME<br />
read -p "Quantity: " QUANTITY<br />
COUNT=1<br />
while [ $COUNT -le $QUANTITY ] ; do<br />
  xe vm-shutdown vm="$NAME$COUNT";<br />
  let COUNT=COUNT+1<br />
  done<br />
exit 0`

Delete VM&#8217;s  
`#!/bin/bash<br />
read -p "Name Prefix: " NAME<br />
read -p "Quantity: " QUANTITY<br />
COUNT=1<br />
while [ $COUNT -le $QUANTITY ] ; do<br />
  xe vm-uninstall vm="$NAME$COUNT" force=true;<br />
  let COUNT=COUNT+1<br />
  done<br />
exit 0`

As you notice, I am no script kiddy and there is probably an easy way to put this all in 1 script and create a menu for each option (if you can, be my guest and post it as comment).

On another note, I also couldn&#8217;t find a decent sysprep.xml to sysprep a Windows 7 machine which was 100% unattended (autogenerate computername, join domain). I could find some sysprep examples but none of them did what I wanted. Here&#8217;s the one I created and used for my Windows 7 VM&#8217;s. Just put on the C-drive of the VM and run the following command from c:\windows\system32\sysprep: sysprep.exe /generalize /oobe /shutdown /unattend:&#8221;C:\sysprep.xml&#8221;

`<?xml version="1.0" encoding="utf-8"?><br />
<unattend xmlns="urn:schemas-microsoft-com:unattend"><br />
    <settings pass="oobeSystem"><br />
        <component name="Microsoft-Windows-International-Core" processorArchitecture="x86" publicKeyToken="31bf3856ad364e35" language="neutral" versionScope="nonSxS" xmlns:wcm="<a href="http://schemas.microsoft.com/WMIConfig/2002/State">http://schemas.microsoft.com/WMIConfig/2002/State</a>" xmlns:xsi="<a href="http://www.w3.org/2001/XMLSchema-instance">http://www.w3.org/2001/XMLSchema-instance</a>"><br />
            <InputLocale>nl-US</InputLocale><br />
            <SystemLocale>nl-US</SystemLocale><br />
            <UILanguage>nl-US</UILanguage><br />
            <UserLocale>nl-US</UserLocale><br />
        </component><br />
        <component name="Microsoft-Windows-Shell-Setup" processorArchitecture="x86" publicKeyToken="31bf3856ad364e35" language="neutral" versionScope="nonSxS" xmlns:wcm="<a href="http://schemas.microsoft.com/WMIConfig/2002/State">http://schemas.microsoft.com/WMIConfig/2002/State</a>" xmlns:xsi="<a href="http://www.w3.org/2001/XMLSchema-instance">http://www.w3.org/2001/XMLSchema-instance</a>"><br />
            <OOBE><br />
                <HideEULAPage>true</HideEULAPage><br />
                <NetworkLocation>Work</NetworkLocation><br />
                <HideWirelessSetupInOOBE>true</HideWirelessSetupInOOBE><br />
                <ProtectYourPC>3</ProtectYourPC><br />
            </OOBE><br />
            <RegisteredOrganization>VRC</RegisteredOrganization><br />
            <RegisteredOwner>VRC</RegisteredOwner><br />
        </component><br />
    </settings><br />
    <settings pass="specialize"><br />
        <component name="Microsoft-Windows-Shell-Setup" processorArchitecture="x86" publicKeyToken="31bf3856ad364e35" language="neutral" versionScope="nonSxS" xmlns:wcm="<a href="http://schemas.microsoft.com/WMIConfig/2002/State">http://schemas.microsoft.com/WMIConfig/2002/State</a>" xmlns:xsi="<a href="http://www.w3.org/2001/XMLSchema-instance">http://www.w3.org/2001/XMLSchema-instance</a>"><br />
            <ComputerName>*</ComputerName><br />
            <DisableAutoDaylightTimeSet>false</DisableAutoDaylightTimeSet><br />
            <ShowWindowsLive>false</ShowWindowsLive><br />
            <TimeZone>W. Europe Standard Time</TimeZone><br />
        </component><br />
        <component name="Security-Malware-Windows-Defender" processorArchitecture="x86" publicKeyToken="31bf3856ad364e35" language="neutral" versionScope="nonSxS" xmlns:wcm="<a href="http://schemas.microsoft.com/WMIConfig/2002/State">http://schemas.microsoft.com/WMIConfig/2002/State</a>" xmlns:xsi="<a href="http://www.w3.org/2001/XMLSchema-instance">http://www.w3.org/2001/XMLSchema-instance</a>"><br />
            <DisableAntiSpyware>true</DisableAntiSpyware><br />
        </component><br />
        <component name="Microsoft-Windows-UnattendedJoin" processorArchitecture="x86" publicKeyToken="31bf3856ad364e35" language="neutral" versionScope="nonSxS" xmlns:wcm="<a href="http://schemas.microsoft.com/WMIConfig/2002/State">http://schemas.microsoft.com/WMIConfig/2002/State</a>" xmlns:xsi="<a href="http://www.w3.org/2001/XMLSchema-instance">http://www.w3.org/2001/XMLSchema-instance</a>"><br />
            <Identification><br />
                <Credentials><br />
                    <Domain>domain name here</Domain><br />
                    <Password>password here</Password><br />
                    <Username>username to join domain</Username><br />
                </Credentials><br />
                <JoinDomain>domain name here</JoinDomain><br />
                <MachineObjectOU>OU=Computers,OU=VRC,DC=domain,DC=local</MachineObjectOU><br />
            </Identification><br />
        </component><br />
    </settings><br />
    <settings pass="generalize"><br />
        <component name="Microsoft-Windows-Security-SPP" processorArchitecture="x86" publicKeyToken="31bf3856ad364e35" language="neutral" versionScope="nonSxS" xmlns:wcm="<a href="http://schemas.microsoft.com/WMIConfig/2002/State">http://schemas.microsoft.com/WMIConfig/2002/State</a>" xmlns:xsi="<a href="http://www.w3.org/2001/XMLSchema-instance">http://www.w3.org/2001/XMLSchema-instance</a>"><br />
            <SkipRearm>1</SkipRearm><br />
        </component><br />
    </settings><br />
    <cpi:offlineImage cpi:source="wim:c:/bin/asus.wim#EF WW W7HP 32R" xmlns:cpi="urn:schemas-microsoft-com:cpi" /><br />
</unattend>`