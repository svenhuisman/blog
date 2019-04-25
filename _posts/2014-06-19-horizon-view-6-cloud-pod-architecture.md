---
id: 3273
title: 'Horizon View 6 &#8211; Cloud Pod Architecture'
date: 2014-06-19T21:15:04+02:00
author: Sven Huisman
layout: post
guid: https://svenhuisman.com/?p=3273
permalink: /2014/06/horizon-view-6-cloud-pod-architecture/
categories:
  - Virtual Desktop
tags:
  - Architecture
  - Cloud Pod
  - Horizon
  - View
  - VMware
---
In this blogpost I will share my experience with one of the new features of Horizon View 6: Cloud Pod Architecture. What are the use-cases, advantages and disadvantages and I will show how to configure a Horizon View Cloud Pod Architecture.

**Cloud Pod Architecture**  
Horizon View can be implemented acording a so called “block” and “Pod” architecture. With this architecture a View infrastructure of 10.000 desktops can be created. More information about Vi View “Blocks” and View “Pods” can be found in the “<a title="View Architecture Planning Guide" href="http://pubs.vmware.com/view-52/topic/com.vmware.ICbase/PDF/horizon-view-52-architecture-planning.pdf" target="_blank">View Architecture Planning Guide</a>”.  
[<img class="aligncenter size-full wp-image-3274" src="https://svenhuisman.com/wp-content/uploads/2014/06/Pods.png" alt="Pods" width="800" height="567" srcset="https://svenhuisman.com/wp-content/uploads/2014/06/Pods.png 800w, https://svenhuisman.com/wp-content/uploads/2014/06/Pods-350x248.png 350w, https://svenhuisman.com/wp-content/uploads/2014/06/Pods-650x460.png 650w" sizes="(max-width: 800px) 100vw, 800px" />](https://svenhuisman.com/wp-content/uploads/2014/06/Pods.png)  
The most important part to know about a Horizon View Pod is that 1 View Pod can only be implemented within a datacenter. A View Pod cannot cross multiple datacenters. This is because the communication between the connection servers and the View desktops is very sensitive to latency. The slightest latency or connection loss between connection servers can cause corruption in the database. This means that when you want to use multiple datacenters with Horizon View you have to create multiple View Pod environments, which you have to manage separately. In case of an active-active or an active-passive datacenter configuration, you have to use a session-aware loadbalancer. The only one capable of load balancing multiple View Pods is the F5 BIG-IP loadbalancer. With Horizon View 6 a new feature is introduced: Cloud Pod architecture. With this feature, multiple View Pods exchange information about sessions and assignements.  
Horizon View 6 introduces the so called “Global Entitlements”. These entitlements can consists desktop pools from multiple View Pods.

**Global Entitlement**  
To create a Cloud Pod architecture, a number of steps need to be taken. A commandline utility called “lvmutil.cmd” needs to be used to configure a Cloud Pod Architecture. In this version of Horizon View the initialization, the configuration and the entitlement needs to be configured using the commandline utlity. The global entitlements are not visible in the View Admin console unfortunately.  
The following steps are required:

  * Initialize the Cloud Pod Architecture
  * Connect the Pods to the Pod Federation
  * Create and configure a Global entitlement
  * Create Sites
  * Assign a “Home site” to a user or group

**Cloud Pod initialization**  
From one of the connection servers the following command needs to be executed:  
Lmvutil.cmd &#8211;authAs <username> &#8211;authDomain <FQDN> &#8211;authPassword “*” &#8211;initialize  
[<img class="aligncenter size-full wp-image-3275" src="https://svenhuisman.com/wp-content/uploads/2014/06/Initialize.png" alt="Initialize" width="645" height="140" srcset="https://svenhuisman.com/wp-content/uploads/2014/06/Initialize.png 645w, https://svenhuisman.com/wp-content/uploads/2014/06/Initialize-350x75.png 350w" sizes="(max-width: 645px) 100vw, 645px" />](https://svenhuisman.com/wp-content/uploads/2014/06/Initialize.png)  
The Cloud Pod Federation is now created.

**Connect the Pods to the Pod Federation**  
The next step is to add other Pods to the Cloud Pod Federation. From a connection server from another View Pod, execute the following command:  
Lmvutil.cmd &#8211;authAs <username> &#8211;authDomain <FQDN> &#8211;authPassword “\*” &#8211;join &#8211;joinServer <FQDN of a server of the Cloud Pod Federation> &#8211;username <domain\username> &#8211;password “\*”

[<img class="aligncenter size-full wp-image-3276" src="https://svenhuisman.com/wp-content/uploads/2014/06/join.png" alt="join" width="669" height="405" srcset="https://svenhuisman.com/wp-content/uploads/2014/06/join.png 669w, https://svenhuisman.com/wp-content/uploads/2014/06/join-350x211.png 350w, https://svenhuisman.com/wp-content/uploads/2014/06/join-650x393.png 650w" sizes="(max-width: 669px) 100vw, 669px" />](https://svenhuisman.com/wp-content/uploads/2014/06/join.png)

**Create and configure a Global Entitlement**

A Global Entitlement needs to be created. Use the following command:  
Lmvutil.cmd &#8211;authAs <username> &#8211;authDomain <FQDN> &#8211;authPassword “*” &#8211;createGlobalEntitlement &#8211;entitlementName “Global Win7” &#8211;scope <ANY|SITE|LOCAL> &#8211;isFloating|isDedicated  
[<img class="aligncenter size-full wp-image-3277" src="https://svenhuisman.com/wp-content/uploads/2014/06/Globalentitlement.png" alt="Globalentitlement" width="645" height="59" srcset="https://svenhuisman.com/wp-content/uploads/2014/06/Globalentitlement.png 645w, https://svenhuisman.com/wp-content/uploads/2014/06/Globalentitlement-350x32.png 350w" sizes="(max-width: 645px) 100vw, 645px" />](https://svenhuisman.com/wp-content/uploads/2014/06/Globalentitlement.png)  
There are a couple of other options you could use with this command, but these are the most important ones. The “Scope” specifies where Horizon View looks for an available desktop. The following scope options are valid:

  * ANY &#8211; Horizon View looks for desktops on any pod in the pod federation.
  * SITE &#8211; Horizon View looks for desktops only on pods within the same site as the pod to which the user is connected.
  * LOCAL &#8211; Horizon View looks for desktops only in the pod to which the user is connected.

A Global entitlement group called “Global Win7” has now been created. You can now add pools to the Global entitlement. Use the next command from a connection server which the desktop pool hosts to add a desktop pool to a Global entitlement:  
Lmvutil.cmd &#8211;authAs <username> &#8211;authDomain <FQDN> &#8211;authPassword “*” &#8211;addPoolAssociation &#8211;entitlementName “Global Win7” &#8211;poolID W7-B1-Pool  
[<img class="aligncenter size-full wp-image-3278" src="https://svenhuisman.com/wp-content/uploads/2014/06/entitlement.png" alt="entitlement" width="642" height="66" srcset="https://svenhuisman.com/wp-content/uploads/2014/06/entitlement.png 642w, https://svenhuisman.com/wp-content/uploads/2014/06/entitlement-350x35.png 350w" sizes="(max-width: 642px) 100vw, 642px" />](https://svenhuisman.com/wp-content/uploads/2014/06/entitlement.png)

The poolID is the ID from the pool that needs to be added. It is best practice not to locally entitle users or groups to this pool. Users could then see two desktop pools in their View client, which would represent the same desktop-pool.  
Now is the time to add users or user groups to the Global Entitlement:  
Lmvutil.cmd &#8211;authAs <username> &#8211;authDomain <FQDN> &#8211;authPassword “*” &#8211;addGroupEntitlement &#8211;groupName <Domain group> &#8211;entitlementName “Global Win7”  
[<img class="aligncenter size-full wp-image-3279" src="https://svenhuisman.com/wp-content/uploads/2014/06/group.png" alt="group" width="645" height="56" srcset="https://svenhuisman.com/wp-content/uploads/2014/06/group.png 645w, https://svenhuisman.com/wp-content/uploads/2014/06/group-350x30.png 350w" sizes="(max-width: 645px) 100vw, 645px" />](https://svenhuisman.com/wp-content/uploads/2014/06/group.png)  
Now the domain user group called “Horizon Users” is entitled to the global entitlement group called “Global Win7”.

**Configure sites**  
In a Cloud Pod Architecture a site is a collection of LAN-connected pods on the same physical location, for example a datacenter. By default with Cloud Pod architecture, All Pods are placed in a site called “Default First Site”. When there are multiple locations, used in a Cloud Pod architecture, Pods need to be configured in a separate site per location.  
To configure a site, execute the following command:  
Lmvutil.cmd &#8211;authAs <username> &#8211;authDomain <FQDN> &#8211;authPassword “*”&#8211;createSite &#8211;siteName “site 1”  
The Pods can now be assigned to a site. Use the following command from any connection server in a Pod:  
Lmvutil.cmd &#8211;authAs <username> &#8211;authDomain <FQDN> &#8211;authPassword “*” &#8211;assignPodToSite &#8211;podName <podnaam> &#8211;siteName <sitename>

**Home site**  
A “Home Site” can be assigned to a user or group. This means that Horizon View will search in the user’s home site, even if the user is connected to a connection server from another Pod. Let’s take a look at an example:  
John usually works at location New York (Site 2). Today, John works in Amsterdam (Site 1) and is connected to the local connection server. However, his data is located New York. When John connects to the View Pod in Amsterdam, the Global Entitlement will make sure John will connect to a desktop in New York:  
[<img class="aligncenter size-full wp-image-3280" src="https://svenhuisman.com/wp-content/uploads/2014/06/scen1.png" alt="scen1" width="910" height="621" srcset="https://svenhuisman.com/wp-content/uploads/2014/06/scen1.png 910w, https://svenhuisman.com/wp-content/uploads/2014/06/scen1-350x238.png 350w, https://svenhuisman.com/wp-content/uploads/2014/06/scen1-650x443.png 650w" sizes="(max-width: 910px) 100vw, 910px" />](https://svenhuisman.com/wp-content/uploads/2014/06/scen1.png)  
Another scenario can be that John needs the fastest connection to a desktop, in an active-active datacenter configuration for example. John will then be assigned to the first available desktop:

[<img class="aligncenter size-full wp-image-3281" src="https://svenhuisman.com/wp-content/uploads/2014/06/scen2.png" alt="scen2" width="933" height="620" srcset="https://svenhuisman.com/wp-content/uploads/2014/06/scen2.png 933w, https://svenhuisman.com/wp-content/uploads/2014/06/scen2-350x232.png 350w, https://svenhuisman.com/wp-content/uploads/2014/06/scen2-650x431.png 650w" sizes="(max-width: 933px) 100vw, 933px" />](https://svenhuisman.com/wp-content/uploads/2014/06/scen2.png)

The Global entitlement will make sure that whenever there is no desktop available in Site 1, John will be assigned to a desktop in Site 2:

[<img class="aligncenter size-full wp-image-3282" src="https://svenhuisman.com/wp-content/uploads/2014/06/scen3.png" alt="scen3" width="902" height="610" srcset="https://svenhuisman.com/wp-content/uploads/2014/06/scen3.png 902w, https://svenhuisman.com/wp-content/uploads/2014/06/scen3-350x236.png 350w, https://svenhuisman.com/wp-content/uploads/2014/06/scen3-650x439.png 650w" sizes="(max-width: 902px) 100vw, 902px" />](https://svenhuisman.com/wp-content/uploads/2014/06/scen3.png)  
**Limits**  
In this version of Cloud Pod architecture the following limits need to be considered:  
Number of Pods: 4  
Number of Sites: 2  
Maximum number of desktops: 20,000  
These limits could be higher in next versions.

**Advantages**  
The Cloud Pod architecture with Horizon View 6 offers a couple of advantages over local group entitlements. Especially the ability to create an Active-Active and Disaster Recovery environment using Horizon View.

**Disadvantages**  
The disadvantage of this option is that the configuration of Global Entitlements is performed through a command line tool (lmvutil). When a global entitlement is created, this is not presented in the administrator console of Horizon View. This can be very confusing for Horizon View administrators. When a desktop pool has a global entitlement, this will be in the admin console when the administrator looks at the properties of a pool:

[<img class="aligncenter size-full wp-image-3288" src="https://svenhuisman.com/wp-content/uploads/2014/06/no-users.png" alt="no-users" width="990" height="67" srcset="https://svenhuisman.com/wp-content/uploads/2014/06/no-users.png 990w, https://svenhuisman.com/wp-content/uploads/2014/06/no-users-350x23.png 350w, https://svenhuisman.com/wp-content/uploads/2014/06/no-users-650x43.png 650w" sizes="(max-width: 990px) 100vw, 990px" />](https://svenhuisman.com/wp-content/uploads/2014/06/no-users.png)

In the View Admin console, the only thing you will see about Cloud Pod architecture is the health of the remote pods:

[<img class="aligncenter size-full wp-image-3286" src="https://svenhuisman.com/wp-content/uploads/2014/06/health.png" alt="health" width="198" height="243" />](https://svenhuisman.com/wp-content/uploads/2014/06/health.png)

**Conclusion**  
View Cloud Pod architecture offers the possibility to use Horizon View in multiple datacenters in an active-active or active-passive configuration. Unfortunately, this first version lacks the integration in de View admin console. And you still have to manage multiple View Pods, which means you have to take care of a consistent configuration and manage the desktop master images across multiple environments. You could of course use Horizon Mirage to manage the desktop master images.