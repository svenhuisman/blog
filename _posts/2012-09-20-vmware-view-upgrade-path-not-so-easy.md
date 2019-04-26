---
id: 2436
title: 'VMware View upgrade path &#8211; not so easy&#8230;'
date: 2012-09-20T12:35:38+02:00
author: Sven Huisman
layout: post
guid: https://svenhuisman.com/?p=2436
permalink: /2012/09/vmware-view-upgrade-path-not-so-easy/
categories:
  - Virtual Infrastructure
tags:
  - migrate
  - upgrade
  - View 5
  - View 5.1.1
  - VMware View
  - vSphere
---
A customer is using VMware View 4.5 on ESX 4.1 and wants to upgrade to View 5.1.1 with ESX 5.0 U1. If you take a look at the following interoperability matrix, the upgrade path is not so easy:

[<img class="aligncenter size-medium wp-image-2437" title="View-upgrade" src="https://svenhuisman.com/wp-content/uploads/2012/09/View-upgrade-350x205.png" alt="" width="350" height="205" srcset="https://svenhuisman.com/wp-content/uploads/2012/09/View-upgrade-350x205.png 350w, https://svenhuisman.com/wp-content/uploads/2012/09/View-upgrade-1024x601.png 1024w, https://svenhuisman.com/wp-content/uploads/2012/09/View-upgrade.png 1392w" sizes="(max-width: 350px) 100vw, 350px" />](https://svenhuisman.com/wp-content/uploads/2012/09/View-upgrade.png)

The first step is to upgrade the View components to View 4.6.1. the next step is to upgrade ESX to 4.1 U3. Then the View components can be upgraded to View 5.1.1 and the final step is to upgrade the vSphere components to 5.0 U1. With every upgrade step, you have to be careful which component of View you upgrade first. Take a look at the following compatibility matrix for View 5.1 and 5.0:

[<img class="aligncenter size-medium wp-image-2439" title="View 5.1 upgrade" src="https://svenhuisman.com/wp-content/uploads/2012/09/Screen-Shot-2012-09-20-at-12.28.54-PM-350x240.png" alt="" width="350" height="240" srcset="https://svenhuisman.com/wp-content/uploads/2012/09/Screen-Shot-2012-09-20-at-12.28.54-PM-350x240.png 350w, https://svenhuisman.com/wp-content/uploads/2012/09/Screen-Shot-2012-09-20-at-12.28.54-PM-1024x702.png 1024w, https://svenhuisman.com/wp-content/uploads/2012/09/Screen-Shot-2012-09-20-at-12.28.54-PM.png 1216w" sizes="(max-width: 350px) 100vw, 350px" />](https://svenhuisman.com/wp-content/uploads/2012/09/Screen-Shot-2012-09-20-at-12.28.54-PM.png)

As you can see, some components are only compatible during the upgrade and some components are not compatible at all. And this is just the 5.1/5.0 matrix. Always doublecheck the versions you are currently running and don&#8217;t forget the View clients, which also need to be at a certain version, before you can upgrade.

Alternatively, a new View infrastructure can be build next to the old one. Then the current master image(s) can be copied to the new environment and upgrade the VMware tools and the View agent. Then point the users to the new environment.

As you can see, the latest vSphere version (5.1) is not supported with any version of View at the moment. When the next update of View (5.1.2? 5.2? 5.5?) supports vSphere 5.1, you will first need to upgrade the View components, and then the vSphere components. Updating VMware View is always fun 🙂