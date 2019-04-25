---
id: 552
title: 'VMware ESX 3.5 Update 3: update older ESX versions with tarball'
date: 2008-11-07T10:33:36+02:00
author: Johan
layout: post
guid: https://svenhuisman.com/?p=552
permalink: /2008/11/updating-older-esx-versions-with-tarball/
categories:
  - Virtual Infrastructure
tags:
  - ESX
  - ESX 3.5u3
  - vi
  - VMware
---
Yesterday VMware released version 3.5u3 of their flagship product ESX, several new features are appealing for me. In previous 3.5 versions it was not possible to tarball upgrade to those versions; gladly VMware corrected this and with the u3 version it&#8217;s possible. To do this follow the procedure in the <a href="https://www.vmware.com/pdf/vi3_35/esx_3/r35u2/vi3_35_25_u2_upgrade_guide.pdf" target="_blank">Upgrade Guide</a> pages 76 for ESX2 hosts and 77 for ESX3 hosts.

This u3 version incorporates a number of other features <!--more-->and bugfixes you can read all of them in the 

<a href="https://www.vmware.com/support/vi3/doc/vi3_esx35u3_rel_notes.html" target="_blank">release notes</a>, as a good system administrator should. If you do so you can read that an extra entry (rootPasswdExpiration) has been made in the <span style="Courier New;">/etc/vmware/hostd/config.xml</span>file to create an expiring root password which is in my opinion a good practice !! Although this is by default of for the sake of downward compatibility but this can change as we have this with the remote root login (which was enabled on pre ESX3 versions but enabled on all ESX3 versions).

By the way the download of u3 is at the normal download section of the site, please be advised to regression test this version thoroughly as we don&#8217;t want an other expiration bug ..