---
id: 2477
title: 'Testing Teradici APEX 2800 with Login VSI &#8211; part 3'
date: 2012-12-10T14:52:38+02:00
author: Sven Huisman
layout: post
guid: https://svenhuisman.com/?p=2477
permalink: /2012/12/testing-teradici-apex-2800-with-login-vsi-part-3/
categories:
  - Virtual Desktop
tags:
  - APEX 2800
  - LoginVSI
  - ProjectVRC
  - Teradici
  - View
  - VMware View
  - VRC
---
Before you continue to read this article, make sure you first read part 1 and 2. In part 1 I explain what the Teradici APEX 2800 card is and what the use-case is for the card. I also explain about <a title="Login VSI" href="https://www.loginvsi.com" target="_blank">LoginVSI</a>, a VDI-benchmarking tool which I also use with <a title="Project VRC" href="https://www.projectVRC.com" target="_blank">Project VRC</a>. In part 2 I shared the results of the tests I performed. In this part, I will share the results of extra tests I performed with the APEX 2800 card, but now with a new software release (2.0.0).

**Disclaimer**: As explained before, I performed the tests with LoginVSI. According to Teradici&#8217;s whitepaper, this is nog a good way to show the capabilities of the APEX 2800 card. I explained the reasons in part 1. LoginVSI is THE VDI benchmarking tool used by large companies like Citrix, HP and Cisco, to validate their reference architectures. In my opinion, LoginVSI is a very good tool to show the impact of using the Teradici APEX 2800 card compared to a situation where you don&#8217;t use the APEX 2800 card, if you want to see the impact on user-density. These tests do not say anything about user experience!

I&#8217;ve performed 2 types of tests:

&#8211; VSIMax tests:  
105 VMs (Windows 7 SP1, 1GB RAM, Office 2007SP2) are pre-booted. Every 30 seconds a user logs in and starts a LoginVSI test. During the entire test, response times are measured. Once an average response has reached the dynamic maximum, the VSIMax has been reached, which can be seen as the maximum number of users. After the last users has started a session, the sessions starts to log off.

&#8211; Steady-state tests:  
10 or 30 VMs are pre-booted (depending on the workload). Every 30 seconds a user logs in and starts a LoginVSI test. After the last user has started a session, the users will continue the LoginVSI test. A timer has been set between 30 and 60 minutes. And the end of the timer, the users starts to log off.

All tests have been performed multiple times to see if there were big differences between the tests. Where possible, averages were taken and presented in the graphs. The colour-coding for the graphs and charts:  
Black = RDP  
Orange = PCoIP software (no APEX 2800 card)  
Blue = PCoIP with APEX 2800 card with software release 1.1.1 (build 15038)  
Dark blue = PCoIP with APEX 2800 card with software release 2.0.0

<!--more-->

**VSIMax tests**

First I wanted to see the impact of using PCoIP compared to RDP. I knew that using PCoIP had an impact on the CPU compared to using RDP. It&#8217;s interesting to see if the APEX 2800 card can compensate the CPU overhead of PCoIP. The following chart shows the number of active sessions at a CPU utilisation of 80% and the maximum number of users on the host (VSIMax). Higher is better.

<p style="text-align: center;">
  <a href="https://svenhuisman.com/wp-content/uploads/2012/12/Sessions_Medium_RDPvsPCoIPvsAPEX-2.0.png"><img class="size-medium wp-image-2482 aligncenter" title="Sessions_Medium_RDPvsPCoIPvsAPEX-2.0" src="https://svenhuisman.com/wp-content/uploads/2012/12/Sessions_Medium_RDPvsPCoIPvsAPEX-2.0-350x228.png" alt="" width="350" height="228" srcset="https://svenhuisman.com/wp-content/uploads/2012/12/Sessions_Medium_RDPvsPCoIPvsAPEX-2.0-350x228.png 350w, https://svenhuisman.com/wp-content/uploads/2012/12/Sessions_Medium_RDPvsPCoIPvsAPEX-2.0.png 713w" sizes="(max-width: 350px) 100vw, 350px" /></a>
</p>

As you can see, with the Medium workload, the APEX 2800 card does not improve the user-density. Even with the 2.0.0 software package, I can not see any improvement in user density.

In the next tests, I&#8217;ve changed the workload to VSI-multimedia. This workload is almost the same as the medium workload, only it has a MP3 playing during the session and once every loop a 720P video (WMV) of 20 seconds is being played. The chart shows the differences in session when the CPU utilisation is at 80% and the difference in VSIMax:

<p style="text-align: center;">
  <a href="https://svenhuisman.com/wp-content/uploads/2012/12/Sessions_Multimedia_PCoIPvsAPEX-2.0.png"><img class="size-medium wp-image-2479 aligncenter" title="Sessions_Multimedia_PCoIPvsAPEX-2.0" src="https://svenhuisman.com/wp-content/uploads/2012/12/Sessions_Multimedia_PCoIPvsAPEX-2.0-350x225.png" alt="" width="350" height="225" srcset="https://svenhuisman.com/wp-content/uploads/2012/12/Sessions_Multimedia_PCoIPvsAPEX-2.0-350x225.png 350w, https://svenhuisman.com/wp-content/uploads/2012/12/Sessions_Multimedia_PCoIPvsAPEX-2.0.png 714w" sizes="(max-width: 350px) 100vw, 350px" /></a>
</p>

Again, no difference between the 1.1.1 software package and the 2.0.0 software package on the APEX 2800 card.

**Steady-state tests**

Let&#8217;s see if the steady-state tests show better improvement for the APEX 2800 card with 2.0.0 software package. With steady-state tests, I use LoginVSI workloads but I only start a handful of sessions and I logoff the users after 40 minutes.

According to the whitepaper I mentioned earlier, a &#8220;video-only&#8221; workload is best to show the capabilities of the APEX 2800 card. I&#8217;ve created the same workload as mentioned in the whitepaper (4 times a 20 second 720P movie played with Media Player). I only used 10 VMs, because this is quite a CPU intensive workload. The following chart shows the average CPU utilization of a 45 minutes period after I start the test. After minutes, the last user logged on.

<p style="text-align: center;">
  <a href="https://svenhuisman.com/wp-content/uploads/2012/12/CPU_SS_Video-2.0.png"><img class="size-medium wp-image-2483 aligncenter" title="CPU_SS_Video-2.0" src="https://svenhuisman.com/wp-content/uploads/2012/12/CPU_SS_Video-2.0-350x225.png" alt="" width="350" height="225" srcset="https://svenhuisman.com/wp-content/uploads/2012/12/CPU_SS_Video-2.0-350x225.png 350w, https://svenhuisman.com/wp-content/uploads/2012/12/CPU_SS_Video-2.0.png 806w" sizes="(max-width: 350px) 100vw, 350px" /></a>
</p>

You can see a 30% improvement with the APEX 2800 card with 1.1.1 software package and an extra improvement of 3-5% on CPU utilization with the 2.0.0 software package.

Conclusion: I.M.H.O. you don&#8217;t buy the APEX 2800 card to get more users on a server. You buy the APEX 2800 card if your users watch a lot of video within the VDI-session and you want to give the users a consistent user experience.