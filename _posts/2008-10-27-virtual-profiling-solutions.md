---
id: 507
title: Virtual Profiling Solutions
date: 2008-10-27T15:53:26+02:00
author: Matthijs Haverink
layout: post
guid: https://svenhuisman.com/?p=507
permalink: /2008/10/virtual-profiling-solutions/
categories:
  - Workspace Management
tags:
  - Citrix
  - Citrix User Profile Manager; RES Powerfuse 2008; Flex Profile Kit
  - Profile
  - User Preferences
  - VDI
---
User settings and profiles always make the design of a new Architecture with virtualisation products (are there still any others?) a lot more difficult. Users want to be able to save application preferences, favorites etc etc. and administrators want a good managed performance (network and servers). Due to the different ways to provide a workspace to users (SBC, VDI, Old fahioned deployment etc.), the way of moving user preferences with the users becomes more and more of an issue. Because profiles are becoming bigger and bigger, a roaming profile isn&#8217;t much of a solution anymore. So a new way of user profiling is needed, I&#8217;ve found three solid options.

<!--more-->

First solution in a citrix environment that was used on big scale and making use of &#8220;mandatory&#8221; profiles was the flex profile kit. This was the <a title="Flex Profile Kit" href="http://www.loginconsultants.com/index.php?option=com_docman&task=doc_details&gid=1&Itemid=149" target="_blank">flex profile kit</a> developed by Login Consultants. Although this cool tool created a very static solution it did and still does the Job. Problem remains the building of a perfect script that points out all important files and registry keys takes a lot of time and work.

RES Powerfuse 2008 is the second solution that I started working with a while ago. RES Powerfuse 2008 gave me the possibility to distribute a modified manadatory profile accross my Citrix Farm using the custom resources (Which makes it easy to update or modify the profile). In this new version I&#8217;m able to easily copy settings like this to the hidden RES folder on the Homedrive, by making use of <a title="RES Workspace management" href="http://www.ressoftware.com/page.aspx?id=273&l=EN" target="_blank">User Preferences</a>. This way I&#8217;m happy because not my whole profile is copied over the network every login but just the controlled features and the user is happy because it&#8217;s fast and his/her background and favorites move with him/her. RES has worked hard to even make is possible to make use of the same functionality in a VDI environment. Unforunately this solution only comes within the enterprise edition of the product and not within the Free Express Edition.

The third solution is the Citrix (unfortunatly still tech preview) <a title="Citrix User Profile Manager" href="http://community.citrix.com/pages/viewpage.action?pageId=33587458" target="_blank">User Profile Manager</a>. Off course nothing is perfect in a tech preview, but it certainly does the job almost the same way the Flex profiles of RES Powerfuse work. I hope this solutions becomes a free new feature in the next version of XenApp, because for now the Flex Profile Kit is the only solution that provides a free solution for the profiling issues. Problem is almost the same as with the flex profile kit, it involves a lot of work to select which preferences to save and which to discard. Most powerfull of this solution is the usage of windows GPO&#8217;s to distribute the settings.