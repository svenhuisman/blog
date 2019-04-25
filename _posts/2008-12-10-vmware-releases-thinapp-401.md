---
id: 598
title: VMware releases ThinApp 4.0.1
date: 2008-12-10T12:06:03+02:00
author: Sven Huisman
layout: post
guid: http://virtualfuture.info/?p=598
permalink: /2008/12/vmware-releases-thinapp-401/
categories:
  - Virtualization news
tags:
  - Application Virtualization
  - Thinapp
  - VMware
---
ThinApp 4.0.1 is now available for <a title="Thinapp 4.0.1" href="http://www.vmware.com/support/thinapp4/doc/releasenotes_thinapp401.html" target="_blank">download</a>. This is a maintenance release that addresses a number of known issues. It also delivers some nice additions to utilities within the ThinApp Suit: Application link for example now supports multi-level links, such that application A links to application B, which links to application C, and so on. File type association also have been improved. Here is the complete list:<!--more-->

  * The thinreg.exe utility has been enhanced, facilitating file type association. It also includes support for DDE, extra verbs, and MIME type registration.
  * Enhanced support for double-byte applications and double-byte locales.
  * Enhanced support for 16-bit MSDOS programs.
  * Support for control panel extensions. Some applications, such as QuickTime or the mail applet for Microsoft Outlook 2007, have control panel extensions that you can now see in a ThinApp environment.
  * Ability to register files other than .exe files. For example, if you install an application that installed a README file or has another link to documentation, you can access those files.
  * Protocol registration. If an application invokes SMTP or HTTP, ThinApp starts any virtual applications that can handle the tasks. If ThinApp cannot locate virtual applications, ThinApp invokes native applications to handle the tasks.
  * ThinApp includes the RequiredAppLinks parameter in the Package.ini file. Previously, the user had to manually add this parameter.
  * ThinApp makes the MSI build template accessible to users to customize the MSI database.
  * User documentation has been restructured to start with basic functionality targeted at the novice user, building towards advanced functionality regarding deployment and customizations.
  * Log Monitor now supports the ability to pause and resume trace file capture.
  * Application link now supports multi-level links, such that application A links to application B, which links to application C, and so on.
  * Special entrypoints cmd, regedit and iexplore are marked with an asterisk (*) to denote these are not virtual applications. Rather, they load respective native EXEs in virtual environment.
  * Isolation mode can now be specified at the root of registry (for example, for HKCU, HKLM).
  * Stub executables changed to improve security and interaction with roaming profiles and system-installed applications.
  * Support for creating MSI distribution larger than 2GB (requires separate CAB file to be distributed).
  * upport for creation of compressed trace files.
  * Support for running ThinApp application on GoGlobal platform.
  * Support packaging application wrapped with the &#8220;Shrinker&#8221; packer.