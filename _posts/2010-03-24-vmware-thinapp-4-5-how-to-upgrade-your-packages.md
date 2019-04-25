---
id: 1688
title: 'VMware ThinApp 4.5: How to upgrade your packages?'
date: 2010-03-24T22:26:34+02:00
author: Sven Huisman
layout: post
guid: https://svenhuisman.com/?p=1688
permalink: /2010/03/vmware-thinapp-4-5-how-to-upgrade-your-packages/
categories:
  - Virtual Applications
tags:
  - Application Virtualization
  - relink
  - VMware Thinapp
---
A new feature in ThinApp 4.5 is the &#8220;relink&#8221; utility. With this utility, it is very easy to update all you ThinApp applications to the latest ThinApp version.

**The old way**:  
Install/update ThinApp 4.5. Then rebuild each ThinApp package.

**The new way**:  
Install/update ThinApp 4.5. Then use the relink utility to update your ThinApp applications:  
relink.exe &#8220;Mozilla Firefox.exe&#8221;

[<img class="aligncenter size-medium wp-image-1689" title="Relink-thinApp45" src="https://svenhuisman.com/wp-content/uploads/2010/03/Relink-thinApp45-350x172.png" alt="" width="350" height="172" srcset="https://svenhuisman.com/wp-content/uploads/2010/03/Relink-thinApp45-350x172.png 350w, https://svenhuisman.com/wp-content/uploads/2010/03/Relink-thinApp45.png 668w" sizes="(max-width: 350px) 100vw, 350px" />](https://svenhuisman.com/wp-content/uploads/2010/03/Relink-thinApp45.png)

The old version will be renamed to .bak.<!--more-->

The relink.exe utility can use a wildcard pattern.  
relink \*.exe \*.dat

The relink.exe utility can use directory names to process all ThinApp files in that directory.  
relink C:MyPackages

If you specify the -Recursive flag, the relink.exe utility processes all ThinApp files in the directory and all subdirectories. This flag is intended for use only with directory names.

I also found this blogpost on VMware about <a title="Relink considerations" href="https://blogs.vmware.com/thinapp/2010/03/relink-considerations.html" target="_blank">Relink considerations</a>. If you want to use the new Memory Optimization or Quality Reporting features, you have to rebuild your application. Rebuild will use the new default setting for optimization, if not specified in the package.ini (OptimizeFor=Memory), while relink will use the old default behaviour (OptimizeFor=Disk). That explains why I didn&#8217;t see a faster launch of the applications.