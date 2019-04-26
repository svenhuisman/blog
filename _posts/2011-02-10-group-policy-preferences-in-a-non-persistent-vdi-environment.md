---
id: 1849
title: Group Policy Preferences in a non-persistent VDI environment
date: 2011-02-10T12:05:52+02:00
author: Sven Huisman
layout: post
guid: https://svenhuisman.com/?p=1849
permalink: /2011/02/group-policy-preferences-in-a-non-persistent-vdi-environment/
categories:
  - Virtual Desktop
tags:
  - Group Policy Preferences
  - non-persistent
  - VDI
---
Using Group Policy preferences (GPP) is a great way to configure computer and user settings like mapped drives, printers, scheduled tasks, services, and Start menu settings. However, when using GPP in a non-persistent VDI environment, you have to be careful with one specific feature&#8230;<!--more-->

**Non-persistent VDI  
** If you want to know more about VDI in general and the different kind of VDI&#8217;s, you should read the <a title="VDI Smackdown" href="https://www.virtuall.nl/view-document-details/vdi-smackdown" target="_blank">VDI Smackdown whitepaper</a>. Basically, when talking about server hosted VDI you have two options: persistent and non-persistent desktops. Persistent desktops are desktops which will keep the changes made to the system (installed software for example). Non-persistent desktops are deleted after the user logs off, or the desktop is reverted to the original state. A non-persistent desktop has the benefit of maintaining a single disk-image and re-deploy it to all the non-persistent desktops in the pool. This is the reason why a non-persistent desktop is used 80% of the time in a VDI-environment.  
What&#8217;s import to remember for this article is that when the user logs off, the changes to the system are deleted.

**User profile and setting management**  
Group Policies and Group Policy Preferences can be used to manage the user&#8217;s profile and settings. When combined with folder-redirection you have a decent &#8220;user environment management&#8221; system. There are other solutions which are probably more flexible, easier to manage and have lots of other advantages, but Group Policies and Group Policy Preferences are free (as long as you have Active Directory) so why not give it a try? 

**Difference between Group Policy settings and Group Policy Preferences?  
** The key difference between policy settings and preferences is enforcement. Group Policy strictly enforces policy settings while Group Policy preferences enable you to deploy settings to client computers without restricting the users from changing the settings. Group Policy Preferences are not removed when the GPO is removed from the user or the computer. However, there is this one setting that changes this default behavior:  
_Remove this item when it is no longer applied_

<p style="text-align: center;">
  <a href="https://svenhuisman.com/wp-content/uploads/2011/02/ScreenHunter_01-Feb.-10-10.52.jpg"><img class="size-medium wp-image-1850 aligncenter" title="Remove this item when it is no longer applied" src="https://svenhuisman.com/wp-content/uploads/2011/02/ScreenHunter_01-Feb.-10-10.52-316x350.jpg" alt="" width="316" height="350" srcset="https://svenhuisman.com/wp-content/uploads/2011/02/ScreenHunter_01-Feb.-10-10.52-316x350.jpg 316w, https://svenhuisman.com/wp-content/uploads/2011/02/ScreenHunter_01-Feb.-10-10.52.jpg 405w" sizes="(max-width: 316px) 100vw, 316px" /></a>
</p>

For example: you can add a shortcut to a user&#8217;s start menu, and when this specific GPP doesn&#8217;t apply to the user anymore, the shortcut will be removed. This works fine with &#8220;regular&#8221; desktops and persistent desktops, but not always with non-persistent desktops.

**Problem situation**  
When is this a problem? When redirecting the start menu to a network location (because you allow users to add their own shortcuts to the start menu or desktop) or when using roaming profiles. In these situations shortcuts will not be removed on a non-persistent desktop when the GPP doesn&#8217;t apply to the user anymore. Why? Because the setting &#8220;_Remove this item when it is no longer applied_&#8221; uses the group policy history file which is located in the %commonappdata% directory. This directory is located in the All users\Appdata (XP) or c:\Programdata (windows 7) and changes to this directory are deleted when a user logs off from a non-persistent desktop.

And this is not only a problem with shortcuts, but also other settings that can be applied with Group Policy Preferences, like registry settings. For example, if you want to set a user registry setting and you use roaming profiles, the registry setting will be saved in the roaming user profile. But when you use the setting &#8220;_Remove this item when it is no longer applied_&#8220;, and you remove the user from the scope of this registry setting, this registry key will not be removed because it isn&#8217;t located in the GPP history file.

**Workaround**  
There is a workaround. If you create a shortcut and apply this shortcut when a user is member of a group, create the same shortcut in Group Policy Preferences, but with a delete action when the user is NOT a member of that group.

[<img class="aligncenter size-medium wp-image-1851" title="Delete action" src="https://svenhuisman.com/wp-content/uploads/2011/02/ScreenHunter_02-Feb.-10-10.59-315x350.jpg" alt="" width="315" height="350" srcset="https://svenhuisman.com/wp-content/uploads/2011/02/ScreenHunter_02-Feb.-10-10.59-315x350.jpg 315w, https://svenhuisman.com/wp-content/uploads/2011/02/ScreenHunter_02-Feb.-10-10.59.jpg 404w" sizes="(max-width: 315px) 100vw, 315px" />](https://svenhuisman.com/wp-content/uploads/2011/02/ScreenHunter_02-Feb.-10-10.59.jpg)