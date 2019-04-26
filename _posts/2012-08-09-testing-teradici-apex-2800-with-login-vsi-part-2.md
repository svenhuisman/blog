---
id: 2410
title: 'Testing Teradici APEX 2800 with Login VSI &#8211; part 2'
date: 2012-08-09T01:29:04+02:00
author: Sven Huisman
layout: post
guid: https://svenhuisman.com/?p=2410
permalink: /2012/08/testing-teradici-apex-2800-with-login-vsi-part-2/
categories:
  - Virtual Desktop
tags:
  - APEX 2800
  - LoginVSI
  - PCoIP
  - Teradici
  - View
  - VMware
  - VMware View
---
Before you continue to read this article, make sure you first read [part 1](https://svenhuisman.com/2012/07/testing-teradici-apex-2800-with-login-vsi-part-1/). In part 1 I explain what the Teradici APEX 2800 card is and what the use-case is for the card. I also explain about LoginVSI, a VDI-benchmarking tool which I also use with [Project VRC](https://www.projectvrc.com/). My goal was to see the impact of the Teradici APEX 2800 card using the LoginVSI tool. I used different types of workloads and different types of tests to compare number of users, CPU usage, response times and network using different display protocols (RDP, PCoIP software and PCoIP with APEX 2800 card). These tests are not to compare user experience but to compare the impact on the host. These tests do not say anything about presenting a better image to the end-users! These tests are about **user-density, impact on CPU and impact on network**.

**Disclaimer**: As explained before, I performed the tests with LoginVSI. According to [Teradici&#8217;s whitepaper](https://www.arrowecs.co.uk/ArrowECS/media/Main-Library/Virtualisation/Teradici/APEX_EvaluationGuide_LoginVSI.pdf), this is nog a good way to show the capabilities of the APEX 2800 card. I explained the reasons in part 1. LoginVSI is THE VDI benchmarking tool used by large companies like Citrix, HP and Cisco, to validate their reference architectures. In my opinion, LoginVSI is a very good tool to show the impact of using the Teradici APEX 2800 card compared to a situation where you don&#8217;t use the APEX 2800 card, if you want to see the impact on user-density. Again, it does not say anything about user experience!

I&#8217;ve performed 2 types of tests:

**&#8211; VSIMax tests:**  
105 VMs (Windows 7 SP1, 1GB RAM, Office 2007SP2) are pre-booted. Every 30 seconds a user logs in and starts a LoginVSI test. During the entire test, response times are measured. Once an average response has reached the dynamic maximum, the VSIMax has been reached, which can be seen as the maximum number of users. After the last users has started a session, the sessions starts to log off.

**&#8211; Steady-state tests:**  
10 or 30 VMs are pre-booted (depending on the workload). Every 30 seconds a user logs in and starts a LoginVSI test. After the last user has started a session, the users will continue the LoginVSI test. A timer has been set between 30 and 60 minutes. And the end of the timer, the users starts to log off.<!--more-->

All tests have been performed multiple times to see if there were big differences between the tests. Where possible, averages were taken and presented in the graphs. The colour-coding for the graphs and charts:  
Black = RDP  
Orange = PCoIP software (no APEX 2800 card)  
Blue = PCoIP with APEX 2800 card

**<span style="text-decoration: underline;">VSIMax tests</span>**

First I wanted to see the impact of using PCoIP compared to RDP. I knew that using PCoIP had an impact on the CPU compared to using RDP. It&#8217;s interesting to see if the APEX 2800 card can compensate the CPU overhead of PCoIP. The following chart shows the number of active sessions at a CPU utilisation of 80% and the maximum number of users on the host (VSIMax). Higher is better.

<img style="display: block; margin-left: auto; margin-right: auto;" title="Sessions_Medium_RDPvsPCoIPvsAPEX.png" src="https://svenhuisman.com/wp-content/uploads/2012/08/Sessions_Medium_RDPvsPCoIPvsAPEX1.png" alt="Sessions Medium RDPvsPCoIPvsAPEX" width="600" height="322" border="0" /> 

As you can see, with the Medium workload, the APEX 2800 card does not improve the user-density. The maximum number of users is even lower with APEX 2800 card! The lower VSIMax could also be caused by a lower baseline response time. The following chart shows the response times:

<img style="display: block; margin-left: auto; margin-right: auto;" title="Response_Medium_RDPvsPCoIPvsAPEX.png" src="https://svenhuisman.com/wp-content/uploads/2012/08/Response_Medium_RDPvsPCoIPvsAPEX.png" alt="Response Medium RDPvsPCoIPvsAPEX" width="600" height="319" border="0" /> 

The response times are very close to each other, with APEX 2800 a little lower than without, so this could explain the slightly lower VSIMax (although I expected a VSIMax for APEX 2800 similar to the VSIMax of the RDP tests.

The following graph shows the CPU utilisation during a VSIMax test:

<img style="display: block; margin-left: auto; margin-right: auto;" title="CPU_Medium_RDPvsPCoIPvsAPEX.png" src="https://svenhuisman.com/wp-content/uploads/2012/08/CPU_Medium_RDPvsPCoIPvsAPEX.png" alt="CPU Medium RDPvsPCoIPvsAPEX" width="600" height="352" border="0" /> 

The CPU utilisation of the tests with APEX 2800 card are slightly below the tests without card. Conclusion: with the medium VSI workload, the APEX 2800 card does not show an improvement in offloading the CPU.

In the following test, I wanted to see if disabling the &#8220;[Build-To-Losless](https://blogs.vmware.com/performance/2011/09/vmware-view-pcoip-build-to-lossless-.html)&#8221; feature (BTL) shows any difference in user-density or CPU utilisation. I used the VSI Medium workload.

<img style="display: block; margin-left: auto; margin-right: auto;" title="Sessions_Medium_BTL.png" src="https://svenhuisman.com/wp-content/uploads/2012/08/Sessions_Medium_BTL.png" alt="Sessions Medium BTL" width="600" height="321" border="0" /> 

Very small differences, so from a performance perspective it doesn&#8217;t really matter if it&#8217;s enabled or disabled. The following graph also show that CPU utilisation is very close with each test (PCoIP with or without APEX card and BTL on or off).

<img style="display: block; margin-left: auto; margin-right: auto;" title="CPU_BTL_PCoIPvsAPEX.png" src="https://svenhuisman.com/wp-content/uploads/2012/08/CPU_BTL_PCoIPvsAPEX.png" alt="CPU BTL PCoIPvsAPEX" width="600" height="352" border="0" /> 

In the next tests, I&#8217;ve changed the workload to VSI-multimedia. This workload is almost the same as the medium workload, only it has a MP3 playing during the session and once every loop a 720P video (WMV) of 20 seconds is being played. The chart shows the differences in session when the CPU utilisation is at 80% and the difference in VSIMax:

<img style="display: block; margin-left: auto; margin-right: auto;" title="Sessions_Multimedia_PCoIPvsAPEX.png" src="https://svenhuisman.com/wp-content/uploads/2012/08/Sessions_Multimedia_PCoIPvsAPEX.png" alt="Sessions Multimedia PCoIPvsAPEX" width="600" height="318" border="0" /> 

And the response times are almost identical:

<img style="display: block; margin-left: auto; margin-right: auto;" title="Response_Multimedia_PCoIPvsAPEX.png" src="https://svenhuisman.com/wp-content/uploads/2012/08/Response_Multimedia_PCoIPvsAPEX2.png" alt="Response Multimedia PCoIPvsAPEX" width="600" height="318" border="0" /> 

The CPU utilisation graph shows that with the APEX 2800 card, the CPU is slightly offloaded:

<img style="display: block; margin-left: auto; margin-right: auto;" title="CPU_MM_PCoIPvsAPEX.png" src="https://svenhuisman.com/wp-content/uploads/2012/08/CPU_MM_PCoIPvsAPEX.png" alt="CPU MM PCoIPvsAPEX" width="600" height="359" border="0" /> 

Conclusion of the VSIMax tests: I can understand now why the whitepaper of Teradici states that LoginVSI is not a suitable tool to show the capabilities of the APEX 2800 card. Hardly any improvement can be found using this test.

**<span style="text-decoration: underline;">Steady-state tests</span>**

Let&#8217;s see if the steady-state tests show better results (for the APEX 2800 card). With steady-state tests, I use LoginVSI workloads but I only start a handful of sessions, so a bottleneck would not be reached. After all the users have started the test, I let it run for a while, to see the impact on CPU and network for example.  
First, take a look at the medium workload. Only 30 VMs have been started. The following chart shows the average CPU utilisation of a 25 minutes period after the last user has started a session:

<img style="display: block; margin-left: auto; margin-right: auto;" title="CPU_SS_Medium.png" src="https://svenhuisman.com/wp-content/uploads/2012/08/CPU_SS_Medium.png" alt="CPU SS Medium" width="600" height="184" border="0" /> 

A very small difference. The following graph shows the CPU utilisation during the test:

<img style="display: block; margin-left: auto; margin-right: auto;" title="CPU_SS_Medium_Graph.png" src="https://svenhuisman.com/wp-content/uploads/2012/08/CPU_SS_Medium_Graph.png" alt="CPU SS Medium Graph" width="600" height="317" border="0" /> 

According to the whitepaper I mentioned earlier, a &#8220;video-only&#8221; workload is best to show the capabilities of the APEX 2800 card. I&#8217;ve created the same workload as mentioned in the whitepaper (4 times a 20 second 720P movie played with Media Player). I only used 10 VMs, because this is quite a CPU intensive workload. The following chart shows the average CPU utilisation of a 25 minutes period after the last user has started a session:

<img style="display: block; margin-left: auto; margin-right: auto;" title="CPU_SS_Video.png" src="https://svenhuisman.com/wp-content/uploads/2012/08/CPU_SS_Video.png" alt="CPU SS Video" width="600" height="193" border="0" /> 

Now that&#8217;s more like it! Finally you can see what the APEX 2800 card is capable of. The following graph shows the CPU utilisation during the test:

<img style="display: block; margin-left: auto; margin-right: auto;" title="CPU_SS_Video_Graph.png" src="https://svenhuisman.com/wp-content/uploads/2012/08/CPU_SS_Video_Graph.png" alt="CPU SS Video Graph" width="600" height="316" border="0" /> 

A very flat line, but this can be explained because the workload only plays a video, over and over again. Maybe not a very realistic workload, but it&#8217;s good to see that the APEX 2800 card can be effective.

I was also interested in network usage. As you might know, With VMware View 5.0 and higher, the PCoIP software protocol has been improved a lot. Especially when it comes to network usage. I was wondering if using the APEX 2800 card has an impact on this. The first chart show the network usage during the steady-state test with the medium workload:

<img style="display: block; margin-left: auto; margin-right: auto;" title="Network_SS_Medium.png" src="https://svenhuisman.com/wp-content/uploads/2012/08/Network_SS_Medium.png" alt="Network SS Medium" width="600" height="290" border="0" /> 

More network packets and MBits when using the APEX 2800 card? Mmm, something to think about when considering being this card…  
The following graphs represents &#8220;total packets/sec&#8221; and &#8220;MBits/sec&#8221; during the test with medium workload:

**Medium workload &#8211; Total packets:**  
<img style="display: block; margin-left: auto; margin-right: auto;" title="TotalPackets_SS_Medium.png" src="https://svenhuisman.com/wp-content/uploads/2012/08/TotalPackets_SS_Medium1.png" alt="TotalPackets SS Medium" width="600" height="340" border="0" /> 

**Medium workload &#8211; Total MBits:**  
<img style="display: block; margin-left: auto; margin-right: auto;" title="TotalMBits_SS_Medium.png" src="https://svenhuisman.com/wp-content/uploads/2012/08/TotalMBits_SS_Medium.png" alt="TotalMBits SS Medium" width="600" height="317" border="0" /> 

Now see the same results, only with the video-only workload, and just 10 VMs.

<img style="display: block; margin-left: auto; margin-right: auto;" title="Network_SS_Video.png" src="https://svenhuisman.com/wp-content/uploads/2012/08/Network_SS_Video.png" alt="Network SS Video" width="600" height="296" border="0" /> 

And now we see the advantage for the APEX 2800 card.

The following graphs represents &#8220;total packets/sec&#8221; and &#8220;MBits/sec&#8221; during the test with video-only workload:

**Video-only workload &#8211; Total packets:**  
<img style="display: block; margin-left: auto; margin-right: auto;" title="TotalPackets_SS_Video.png" src="https://svenhuisman.com/wp-content/uploads/2012/08/TotalPackets_SS_Video.png" alt="TotalPackets SS Video" width="600" height="315" border="0" /> 

**Video-only workload &#8211; Total MBits:**  
<img style="display: block; margin-left: auto; margin-right: auto;" title="TotalMBits_SS_Video.png" src="https://svenhuisman.com/wp-content/uploads/2012/08/TotalMBits_SS_Video.png" alt="TotalMBits SS Video" width="600" height="317" border="0" /> 

**Conclusions**  
To be honest, I&#8217;m disappointed in the capabilities of the APEX 2800 card. I expected that the card would compensate the CPU overhead of PCoIP software compared to RDP, even with the medium workload. So with APEX 2800 card, I could host the same amount of sessions than when using RDP. This is not the case. As it turns out, the APEX 2800 card is only effective when there are a lot of pixel changes, watching video for example. Regular Office-like workloads or workloads with a small percentage of multimedia are not likely to benefit from this card. Especially when available network bandwidth is a concern, this card might not be the best solution for you.  
However, when your users need to watch a lot of (HD) video in the VMware View session, and adding a second vCPU to the VMs is not an option, the APEX 2800 card could be beneficial.

If you have any questions about the tests I performed, please leave a comment.

If you want to know more about my test-setup, you should read [Phase III of the Project VRC whitepapers](https://www.projectvrc.com/white-papers/doc_details/12-project-vrc-phase-iii). In that whitepaper the infrastructure I used for these tests is described, including the optimisations I added to the Windows 7 VM. In addition to this whitepaper, I used ESX 5.0 U1, VMware View 5.1, View Composer 3.0, View Client 5.1 and View agent 5.1.

The Teradici driver I used: Teradici APEX 2800 Server Offload Card software release 1.1.1 (build 15038) for ESXi 5.0.0 Update 1.