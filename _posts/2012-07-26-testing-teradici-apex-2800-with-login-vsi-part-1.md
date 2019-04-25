---
id: 2379
title: 'Testing Teradici APEX 2800 with Login VSI &#8211; part 1'
date: 2012-07-26T16:59:18+02:00
author: Sven Huisman
layout: post
guid: http://virtualfuture.info/?p=2379
permalink: /2012/07/testing-teradici-apex-2800-with-login-vsi-part-1/
categories:
  - Virtual Desktop
tags:
  - APEX 2800
  - LoginVSI
  - PCoIP
  - Project VRC
  - Teradici
  - VMware View
---
**Introduction**  
I&#8217;m given the opportunity to test the <a title="APEX 2800" href="http://www.teradici.com/pcoip/pcoip-products/teradici-apex-2800.php" target="_blank">Teradici APEX 2800 card</a>. My plan is to evaluate this card using Login VSI, the VDI benchmarking tool I use in Project VRC. I want to see the improvement in user density using this card compared to the software version of PCoIP used in VMware View. Before I start with my tests, I have read this whitepaper: [Quantifying Teradici APEX 2800 with Login VSI](http://www.arrowecs.co.uk/ArrowECS/media/Main-Library/Virtualisation/Teradici/APEX_EvaluationGuide_LoginVSI.pdf). In this first part of my blogposts of testing the APEX 2800 card, I review and comment on this whitepaper. I also explain what kind of tests I will run with this card. In the second part, I will show you my results and share my final thoughts and considerations.

**APEX 2800**  
The Teradici APEX 2800 card is used in VMware View infrastructures to offload the PCoIP image encoding tasks. Without this card, the CPU will take care of this at the cost of higher CPU usage (which means less users on the host). According to the whitepaper:

> _The teradici APEX 2800 server offload card is a performance enhancement to VMware View deployments. the APEX 2800 offloads the PCoIP image encoding tasks, previously performed in software, thus reducing the server’s CPU usage. this results in several benefits, including a better and more consistent user experience as well as a higher VDI consolidation ratio._<!--more-->

**Login VSI**  
If you don&#8217;t know the Login VSI tool, I suggest you read about <a title="Project VRC" href="http://www.projectvrc.com/" target="_blank">Project VRC</a> and <a title="Login VSI" href="http://www.loginvsi.com/" target="_blank">Login VSI</a>. You could also read the Teradici whitepaper mentioned above to get a better understanding. Basically, Login VSI logs a user in on a system (in this case a View desktop) and the user will simulate a user by opening documents, typing text, opening and reading mail, editing Excel documents, browse the internet, watch a flash movie and taking brakes. Every 30 seconds a user will be logged in and will simulate a user. At a certain point in time, the response times of the applications will go up because of a bottleneck (CPU, RAM, Disk-IO) has been reached. Login VSI will then calculate the maximum number of users the system can handle. When one component or setting is changed to the infrastructure (add the APEX 2800 card for example) and you start Login VSI again, you could get a different number of maximum users and then you can see what the impact is of that change.  
Login VSI can be configured with different kind of workloads. The ones I will use in my tests are:  
&#8211; **Medium**  
12-14 minute loops of office applications like outlook, Word, excel, Acrobat Reader, Mind Map, Internet Explorer and a 21 second Flash video.  
&#8211; **Heavy**  
Nearly identical to the medium workload except with slightly faster typing and slightly shorter idle periods.  
&#8211; **Multimedia**  
The same as the medium workload with the addition of an MP3 audio file being played in the background as well as the addition of another 20 second video.  
&#8211; **Custom**  
I will create a &#8220;video-only&#8221; workload as described in the Teridici whitepaper.

If you read the whitepaper from Teradici, basically what they are saying is that Login VSI is not the right tool to show the capabilities of the APEX 2800 card. A couple of reasons are given:  
First of all, Login VSI uses a dynamic threshold. Basically, Login VSI takes the average of the first 15 measurements (response times) to create the baseline. This baseline will be multiplied by 1.25 and 3000ms will be added to get the threshold (maximum average response time). Teradici suggests that with the APEX 2800 card, the initial baseline response time is lower than without the card. Therefor the threshold is lower and the VSIMax (maximum users) could be lower. I will keep this in mind and will show the baselines in my test results.

Secondly, every 30 seconds a user is logged on during the Login VSI test. This means that during the test, considerable resources are being consumed by users logging in and not just the workload. The whitepaper also mentions VMs booting up consuming resources, but in my tests all the VMs will be pre-booted. Teradici suggests to run steady-state tests where a number of sessions are run for 30 minutes or one hour and there are still enough resources available (CPU, RAM, Disk-IO). During this time, no new sessions are logged on or VMs are booted or logged of. I will also perform steady-state tests.

The third problem they have with Login VSI is that the workloads are not good to show the capabilities of the APEX 2800 card. The medium and heavy workload have just one flash video of 21 seconds and the Multimedia workload adds a 720P Windows Media player video of 20 seconds and MP3 audio that plays during the test. Playing the MP3 file takes a huge hit on the CPU, but will not cause pixel changes. The APEX 2800 card will not offload this kind of CPU usage. The other issue is the fact that the video is too short and Windows Media Player is not very efficient at decoding video, and will consume a lot of CPU itself, which can&#8217;t be offloaded by the APEX card.

The conclusion from what I read in the whitepaper, the APEX 2800 card is only effective when the workload consist of a lot of pixel changes, preferably a lot of video&#8217;s. Then you will notice a decrease of CPU usage of the host and therefore a more consistent user experience for the user. The APEX 2800 card will not make a big difference if the workload consist of office applications and applications where there is not a lot of changing pixels.

**My tests**

Last year I used Login VSI to see the impact of using PCoIP compared to RDP as display protocol. With the Login VSI Medium workload, I noticed a 20% decrease of users when using PCoIP as display protocol (caused by the CPU consumption of PCoIP image encoding). My assumption is that this overhead on CPU will be offloaded if you use an APEX 2800 card. I will perform the following tests:  
Login-VSI, medium workload, RDP  
Login-VSI, medium workload, PCoIP (software)  
Login-VSI, medium workload, PCoIP (APEX 2800)

With all tests I will pre-boot 105 VMs with 1GB RAM, Windows 7 and Office 2007. I use VMware View 5.1 as the broker.

I also want to see the impact on user density when enabling or disabling the built-to-lossless feature with the medium workload. I will test with and without the APEX 2800 card.

The other tests I&#8217;m going to perform is the Login VSI multimedia workload and the heavy workload, with and without the APEX 2800 card.

With all tests I will take a look at VSIMax (maximum users), number of sessions when CPU utilization is at 80% and baseline response times.

I will also perform steady-state tests, where I will start 10, 20, 30 or 40 VMs (depending on the workload) and let the test run for 30 or 60 minutes. I will use the multimedia workload and a custom workload where only a 720P video is run continuously.

In my next blogpost, I will share my test results.