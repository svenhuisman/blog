---
id: 543
title: HOWTO deploy ThinApp applications with Active Directory
date: 2008-11-06T22:31:33+02:00
author: Sven Huisman
layout: post
guid: https://svenhuisman.com/?p=543
permalink: /2008/11/howto-deploy-thinapp-applications-with-active-directory/
categories:
  - Virtual Applications
tags:
  - Application Virtualization
  - comparison chart
  - Thinapp
  - VMware
---
<span class="C_Command">So our <a title="Application virtualization comparison chart" href="https://svenhuisman.com/2008/09/updated-application-virtualization-comparison-chart/" target="_blank">application virtualization comparison chart</a> seems to be very popular. We get a lot of positive responses, but one thing that we get a lot is the fact that we mention <a title="ThinApp" href="http://www.vmware.com/products/thinapp/" target="_blank">ThinApp</a> has no central management for deploying the virtualized apps, and that it can easily be done with Active Directory. Although that is true, we still say that ThinApp has no central management for deploying the apps, just to compare it with other products that do come with a central deployment tool, like <a title="InstallFree" href="http://www.installfree.com" target="_blank">InstallFree</a> or <a title="Microsoft" href="http://www.microsoft.com" target="_blank">Microsoft</a> App-V.</span>

<span class="C_Command">Okay, so how can you distribute ThinApp Applications? There a a lot of possibilities, I will explain 2: through Active Directory and with a login script.<!--more--></span>

<span class="C_Command"><strong><span style="text-decoration: underline;">Active Directory<br /> </span></strong>When you capture an application with ThinApp you have the possibility to build a MSI-file. You might wonder why you want to build an MSI, because one of the big advantages of ThinApp that it creates a single executable which doesn&#8217;t need to be installed. Well, this MSI doesn&#8217;t install the captured application. It contains the single executable and thinreg. Thinreg is a tool that creates shortcuts and file type associations. It also puts the application to the Add/remove programs list (this is also useful for software inventory tools).</span>

<p style="TEXT-ALIGN: center">
  <span class="C_Command"><img class="size-medium wp-image-547 aligncenter" title="thinapp_msi" src="https://svenhuisman.com/wp-content/uploads/2008/11/thinapp_msi-300x255.jpg" alt="" width="300" height="255" /></span>
</p>

<span class="C_Command">When the MSI has been build, you create a Group Policy Object (GPO) and add the MSI to the software installation. Add a security group to this policy and add the users who needs this app to the security group.</span>

<p style="TEXT-ALIGN: center">
  <span class="C_Command"><a href="https://svenhuisman.com/wp-content/uploads/2008/11/thinapp_gpo.jpg"><img class="size-medium wp-image-546 aligncenter" title="thinapp_gpo" src="https://svenhuisman.com/wp-content/uploads/2008/11/thinapp_gpo-300x125.jpg" alt="" width="300" height="125" /></a></span>
</p>

<span class="C_Command">After the ThinApp is &#8220;installed&#8221;, a couple of files have been copied (the executable and a couple of VB-scripts to &#8220;uninstall&#8221; the application), the shortcuts are created, file type associations are registered and the app is added to the add/remove programs list.</span>

<p style="TEXT-ALIGN: center">
  <span class="C_Command"><a href="https://svenhuisman.com/wp-content/uploads/2008/11/thinapp_install.jpg"><img class="size-medium wp-image-545 aligncenter" title="thinapp_install" src="https://svenhuisman.com/wp-content/uploads/2008/11/thinapp_install-300x169.jpg" alt="" width="300" height="169" /></a></span>
</p>

<p style="TEXT-ALIGN: left">
   <span class="C_Command">When doing a per-machine deployment, the default installation directory is the localized equivalent of &#8220;%ProgramFilesDir%\<InventoryName> (captured). For a per-user deployment, the default is %AppData%\<InventoryName> (captured).</span>
</p>

<p style="text-align: center;">
  <span class="C_Command"><img class="size-medium wp-image-544 aligncenter" title="thinapp_scripts" src="https://svenhuisman.com/wp-content/uploads/2008/11/thinapp_scripts-300x153.jpg" alt="" width="300" height="153" /></span>
</p>

<span class="C_Command"><strong><span style="text-decoration: underline;">Login script<br /> </span></strong>So Thinreg does cool stuff like creating shortcuts and file type associations. How can this be used in a login script? Easy:<br /> &#8211; Put your packages on a fileshare<br /> &#8211; create a login script with the following command: ThinReg.exe &#8220;\\server\share\*.exe&#8221;</span>

<span class="C_Command">This will register all the applications for the user. If you want more control on who gets what application, you can use the PermittedGroups option. When building an ThinApp application, you can specify a security group that has rights to launch the application. Best practice is to create one group per application and add users to the specific application group.<br /> Using Thinreg does one thing else: it doesn&#8217;t copy the executable to the local client, but only register the application. It will remain on the file share. So when a user starts the application, it will be streamed to the clients memory.</span>

<span class="C_Command">There are other ways to distribute ThinApp applications, but these 2 are free to use (when Active Directory is available or using a login script). </span>