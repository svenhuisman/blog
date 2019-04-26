---
id: 453
title: 'VMWorld 2008 &#8211; ThinApp desktop?'
date: 2008-09-19T04:16:11+02:00
author: Sven Huisman
layout: post
guid: https://svenhuisman.com/?p=453
permalink: /2008/09/vmworld-2008-thinapp-desktop/
categories:
  - VMworld 2008 Vegas
tags:
  - Thinapp
  - VMware
  - VMworld 2008
---
Today I was at the &#8220;ThinApp &#8211; going deep on capturing applications&#8221; session. I expected a real technical session about how to tweak a captured application and maybe some best practices. It was a little bit of a soft presentation until one of the presenters showed something used in R&D at the moment: ThinApps that run in a second (virtual) desktop.<!--more-->

It started of kind of slow, because the presenter started of with explaining what ThinApp was and what the advantages where. I guess when 90% raises their hand when you ask who worked with ThinApp before, you can skip the basic explanation (assuming the other 10% already knows what ThinApp can do, otherwise they wouldn&#8217;t be in a session for advanced audience).

After the slow start, he went further with a short video of automating the capture and build of ThinApps (which can be accomplished just by using batch-file, VMware Workstation and the ThinApp runtime).

MSI building and thinreg were also discussed. Both can handle shell integration, but only limited. This will be improved in the future:

&#8211; rightclick  
&#8211; dde  
&#8211; mime types  
&#8211; limited support for com objects  
&#8211; support for protocol: http, mailto

And out of nowhere there it  was: ThinApps that will start in a second (virtual) desktop. The guy said they use it currently as R&D prototype and it isn&#8217;t even sure if this ever will be available. But this feature is way too cool. Because what happens is (and correct me if I&#8217;m wrong, because it&#8217;s a few hours ago) you start the ThinApp application and the desktops switches to a second (virtual) desktop. This virtual desktop has full shell integration. The user can also install their own applications in this second desktop. You had to be there to see how it actually worked, but it looked pretty cool.

Overall, the session was not that technical deep dive at all. I guess ThinApp is not that hard to master ;-).

Earlier today I had another session about ThinApp, here are my quick notes:

Planning and designing ThinApp implementation

in memory and compressed

licenses can be audited with 3th party tools

MSI will create file accociation ad add/remove program.

best practice capturing:  
&#8211; clean PC  
&#8211; use oldest os in environment  
&#8211; Leverage VMware workstation an snapshots  
&#8211; Add the VMware workstation VM to AD to enable AD security group assignment  
 &#8211; disable dynamic machine account password rest

Repositories  
&#8211; source &#8211; storage of ThinApp project folders  
&#8211; UAT &#8211; used to stage ThinAppp packages for user acceptance testing (UAT)  
 &#8211; use a subfolder of UAT for Applink-accessible plugins  
&#8211; PROD &#8211; High available and load balanced distr. point  
 &#8211; use a subfolder of PROD for Applink-accessible plugins

Good practices:  
&#8211; backup source and prod

package naming conventionL  
&#8211; vendor\_appname\_appversion_packageversion

AD groups:  
&#8211; make group name the same as application name  
&#8211; exclude version number from group name  
&#8211; use dedicated OU to store the package groups  
&#8211; create a seperate group for containing user objects, and add this group the application&#8217;s  dedicated group

Logon script:  
-Thinreg in login script