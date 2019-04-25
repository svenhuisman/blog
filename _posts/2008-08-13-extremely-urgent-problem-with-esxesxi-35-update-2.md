---
id: 242
title: EXTREMELY URGENT PROBLEM WITH ESX/ESXi 3.5 Update 2
date: 2008-08-13T06:17:29+02:00
author: Johan
layout: post
guid: http://virtualfuture.info/?p=242
permalink: /2008/08/extremely-urgent-problem-with-esxesxi-35-update-2/
categories:
  - Virtualization news
---
I received an e-mail from VMWare mentioning the problem with their latest build concerning the inability to start and VMotion. Here is the e-mail:

Dear VMware Customers,

Please find the latest update about the product expiration issue. From this point on, we’ll provide an update every two hours. Thanks.

**Problem:**

An issue has been discovered by many VMware customers and partners with ESX/ESXi 3.5 Update 2 where Virtual Machines fail to power on or VMotion successfully. <!--more-->This problem began to occur on August 12, 2008 for customers that had upgraded to ESX 3.5 Update 2. The problem is caused by a build timeout that was mistakenly left enabled for the release build.

**Affected Products:**

  * VMware ESX 3.5 Update 2 & ESXi 3.5 Update 2
  * Reports of problems with ESX 3.5 U1 with the following 3.5 Update 2 patch applied.  
            1. ESX350-200806201-UG
  * No other VMware products are affected.

**What has been done?**

  * Product and Web teams pulled the ESX 3.5 Update 2 bits from the download pages last night so no more customers will be able to download the broken build.
  * VMware Engineering teams have isolated the cause of the problem and are working around the clock to deliver updated builds and patches for impacted customers.
  * A Knowledgebase article has been published (<a href="https://svenhuisman.com/wp-admin/redir.aspx?C=e39a0e40b0d54bb1a9f864f5375bb3f8&URL=http%3a%2f%2fapp.connect.vmware.com%2fe%2fer.aspx%3fs%3d524%26lid%3d3164%26elq%3dB92D6F1711AD4CED938ADC46D1F9BB5C" target="_blank">http://kb.vmware.com/kb/1006716</a>), but traffic to the knowledgebase is causing time outs. A new static page has been published at <a href="https://svenhuisman.com/wp-admin/redir.aspx?C=e39a0e40b0d54bb1a9f864f5375bb3f8&URL=http%3a%2f%2fapp.connect.vmware.com%2fe%2fer.aspx%3fs%3d524%26lid%3d3165%26elq%3dB92D6F1711AD4CED938ADC46D1F9BB5C" target="_blank">http://www.vmware.com/support/esx35u2_supportalert.html</a> that customers and partners will be able to view.
  * The phone system has been updated to advise customers of the problem
  * Vmware partners have been notified of the issue.

**Workarounds:**

  1. Do not install ESX 3.5 U2 if it has been downloaded from VMware’s website or elsewhere prior to August 12, 2008.
  2. Set the host time to a date prior to August 12, 2008. This workaround has a number of very serious side affects that could impact product environments. Any Virtual Machines that sync time with the ESX host and serve time sensitive applications would be broken. These include, but are not limited to database servers, mail servers, & domain administration systems.

**Next Steps:**  
VMware to notify customers who have downloaded this version and provide an update every two hours.

**Resolution:**

VMware Engineering has isolated the root cause and is working to produce an express patch for impacted customers today. The target timeframe is 6pm, August 12, 2008 PST.

**FAQ:**

  1. What would this express patch do? 
    More information will be provided in subsequent communication updates.</li> 
    
      * Will VMware still reissue the upgrade media and patch bundles in the timeframe that has been communicated? 
        Yes. We still plan to reissue upgrade media by 6pm, August 13 PST (instead of noon, August 13 PST) and all update patch bundles later in the week. We will provide an ETA for the update patch bundles subsequently. NOTE: the &#8220;patch bundles&#8221; referred to here are for the patches listed above under &#8220;Affected Products&#8221; and the other bundles released at GA. They are not the same as the express patch which is targeted for 6pm, August 12, 2008 PST as stated above.</li> 
        
          * Why does VMware plan to reissue the upgrade media before the patch bundles? That is a wrong priority call! 
            This is not a matter of priority. Since we can get done building and testing the upgrade media before the patch bundles, we want to make that available to customers first instead of reissuing all the binaries later in the week.</li> 
            
              * Can VMware issue a patch that opens the licensing backdoor in the next hour as a critical measure? 
                There is no licensing backdoor in our code.</li> 
                
                  * Does this issue affect VC 2.5 Update 2? 
                    No.</li> 
                    
                      * What is VMware doing to make sure that the problem won’t happen again? 
                        We are making improvements on all fronts. The product team had endeavored to deliver a release with support customers deem important. But we fell short and we are deeply sorry about all the disruption and inconveniences we have caused. We have identified where the holes are and they will be addressed to restore customers’ confidence.</li> </ol>