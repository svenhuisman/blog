---
id: 1405
title: 'VMworld 2009: Understanding “Host” and “Guest” Memory Usage'
date: 2009-09-11T20:18:27+02:00
author: Sven Huisman
layout: post
guid: https://svenhuisman.com/?p=1405
permalink: '/2009/09/vmworld-2009-understanding-%e2%80%9chost%e2%80%9d-and-%e2%80%9cguest%e2%80%9d-memory-usage/'
categories:
  - Virtual Infrastructure
  - VMworld 2009 SF
tags:
  - ESX
  - memory management
  - VMware
  - vSphere
---
_Edit: I started this blogpost more than a week ago, but I never finished it. Just as I wanted to complete the blogpost, I found out VMware released a new whitepaper about_ <a title="VMware vSphere Memory Management" href="http://www.vmware.com/files/pdf/perf-vsphere-memory_management.pdf" target="_blank"><em>VMware vSphere Memory management</em></a>_. I&#8217;ve added the best practices on the bottom of this blogpost._

This hour and a half session about &#8220;Host&#8221; and &#8220;Guest&#8221; memory usage was very interesting. The topics in this session were:

  * Define host and guest memory usage and ask some questions
  * Memory management concepts
  * Answer our questions
  * Best practices
  * Future Directions

It covered way more than I can put in this blogpost, but I want to highlight some of the things that were discussed during this presentation. The most important part to remember is:

The ESX hypervisor doesn&#8217;t have a clue which memory pages are active or free within a guest-OS. The hypervisor only knows how much memory is allocated to a VM.

<!--more-->

If you take a look the summary-tab of a VM in vCenter you can see resource usage. For the memory you have 2:  
Host memory usage and Guest memory usage. Now why are these numbers not the same?

<p style="text-align: center;">
  <a href="https://svenhuisman.com/wp-content/uploads/2009/09/hostmem1.jpg"><img class="size-full wp-image-1406 aligncenter" title="hostmem1" src="https://svenhuisman.com/wp-content/uploads/2009/09/hostmem1.jpg" alt="hostmem1" width="315" height="85" /></a>
</p>

Host memory usage: The amount of physical host memory in megabytes allocated to a guest. Includes virtualization overhead (e.g. hypervisor data)

Guest memory usage: The amount of memory in megabytes actively used by a guest operating system and it’s applications

Over time, a Guest OS in a VM allocates and frees memory. But the VM can only allocate memory. The hypervisor can&#8217;t reclaim freed memory pages, because it doesn&#8217;t know which memory pages are free, only the guest-OS is aware of that. If you don&#8217;t overcommit on memory, that&#8217;s no problem. You will see that the Host memory usage of a VM will grow and grow until the maximum configured memory for that VM is reached (plus a little bit extra for overhead). But if you do overcommit memory, that&#8217;s going to be a problem. The guest OS is only actively using a portion of the memory it has allocated over time while the VM still uses the free memory pages in physical RAM. That is where ballooning kicks in.

&#8220;Ballooning&#8221; is a driver installed with the VMware-tools. The hypervisor tells the &#8220;balloon&#8221;-driver to allocate memory in the guest-OS. The hypervisor can then free up those memory pages used on physical RAM. Ballooning preferentially selects free or idle VM memory rather than active memory. BUT… if asked to reclaim too much, ballooning will eventually start reclaiming active memory! And that will slow down your applications.

You should definately read the whitepaper, but here are some best practices for memory management:

  * Do not disable page sharing or the balloon driver.
  * Carefully specify the memory limit and memory reservation. The virtual machine memory allocation target is subject to the limit and reservation. If these two parameters are misconfigured, users may observe ballooning or swapping even when the host has plenty of free memory.
  * Host memory size should be larger than guest memory usage. Although it is difficult to tell whether the host memory is large enough to hold all of the virtual machine’s working sets, the bottom line is that the host memory should not be excessively overcommitted making the guests have to continuously page out guest physical memory.
  * Use shares to adjust relative priorities when memory is overcommitted.
  * Set appropriate Virtual Machine memory size. The virtual machine memory size should be slightly larger than the average guest memory usage