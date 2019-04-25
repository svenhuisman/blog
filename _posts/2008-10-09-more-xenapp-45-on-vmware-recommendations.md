---
id: 482
title: More XenApp 4.5 on VMware recommendations
date: 2008-10-09T12:38:29+02:00
author: Sven Huisman
layout: post
guid: https://svenhuisman.com/?p=482
permalink: /2008/10/more-xenapp-45-on-vmware-recommendations/
categories:
  - Virtual Applications
  - VMworld 2008 Vegas
tags:
  - Citrix
  - VI3
  - VMware
  - XenApp
---
Now that the sessions from <a title="vmworld" href="http://www.vmworld.com" target="_blank">VMWorld</a> 2008 are available online (for registered attendees), I thought I could share some of the good stuff with you. Here are some recommendations for implementing XenApp 4.5 on VMware. I&#8217;ve posted <a title="citrixonvi3" href="https://svenhuisman.com/2008/07/citrix-on-vi3x-recommendations/" target="_blank">recommendations</a> before, so there could be some overlap. Of course, not all recommendations may apply to your situation, but I find some of them very useful. These come from session _VD2591: Lessons Learned While Deploying Citrix Presentation Server (XenApp) 4.5 in a Virtual Datacenter._  <!--more-->

**Citrix Server Configuration  
** Host Population\VM Setup

  * The overall recommendation is 1.5 Citrix VMs per CPU Core.
  * 2-Dual Core (4 cores) server = limit 6 VMs for that host.
  * Always set up your Citrix VMs with 1 vCPU
  * Due to the scheduling done by VMware at the hypervisor layer you will degrade performance if you use 2 vCPUs
  * It is usually recommended to have 2GB of RAM per vCPU, depends on applications To limit the “dead space” of your VMs, designate just enough hard drive space for Windows \ Citrix \ Applications \ Profiles
  * Do not allow you users to save data on the Citrix server!
  * Use Microsoft DelProf to delete profiles off of servers, recommend daily.
  * Set PageFile size (max and min) to 2.5 times your RAM

Turn Off Unneeded Services

  * <div>
      Disconnect Cdrom and Floppy drives connect to the VM
    </div>

  * <div>
      Windows checks the CDrom every few minutes, this increases the resources needed on<br /> the host
    </div>

  * <div>
      DHCP Client if you are using static IPs
    </div>

  * <div>
      “Help and Support”
    </div>

  * <div>
      “HTTP SSL”
    </div>

  * <div>
      “IPSEC Services”
    </div>

  * <div>
      “IMAPI CD-Burning COM Service”
    </div>

  * <div>
      “Indexing Service”
    </div>

  * <div>
      “Intersite Messaging”
    </div>

  * <div>
      “Messenger”
    </div>

  * <div>
      “Remote Access Auto Connection Manager”
    </div>

  * <div>
      “Remote Access Connection Manager”
    </div>

  * <div>
      “Remote Desktop Help Session Manager”
    </div>

  * <div>
      “W32Time” If using VMtools Sync with host
    </div>

Setting up DRS for Citrix Servers

  * <div>
      Utilize DRS to load balance your Citrix servers in a cluster.
    </div>

  * <div>
      Set up a cluster specifically for your Citrix servers
    </div>

  * <div>
      Configure the rules so that redundant servers are not on the same host<br /> at the same time
    </div>
    
      * <div>
          Web Interface servers
        </div>
    
      * <div>
          Data Collectors
        </div>
    
      * <div>
          Servers in silos (doesn’t work if you have more VMs than Hosts in your silos,<br /> works well if you have a silo with 2-3 servers in it)
        </div>
    
      * <div>
          Redundant Citrix Data Store servers (if using SQL replication)
        </div>

  * <div>
      Set Automation Level
    </div>
    
      * <div>
          Fully Automated
        </div>
    
      * <div>
          Set Migration Threshold to “Apply Recommendations with four or more<br /> stars”. This will allow to load balance when needed, not just to make it even. If you have the Migration Threshold set too Aggressive then you will be VMotioning your servers too much and it will degrade performance
        </div>

**Citrix Server Templates\Cloning**  
Steps to perform before cloning\creating template

  * Creating multiple templates for easy deployment
  * Create one base template with only Windows installed 
      * This will allow you to deploy servers more rapidly for something like Web Interface.
  * Create one base template with only Citrix installed. This will be your Citrix Gold Template 
      * This should not contain any management tools for Citrix.
      * This allows you to rapidly deploy a new Citrix silo.
      * Use your Gold Template to create your data collectors as well.
      * Use your Gold Template to create your management servers for your farm.
  * A little hint, publish the VMware Virtual Infrastructure Client in Citrix.
  * Create an intermediate Silver Template for each silo you have within Citrix. 
      * If you are using Published Desktops with all applications on all servers then you will  
        only need one Silver Template
      * If you install your applications in silos, as we do, then you would create a Template  
        for each separate silo
      * This allows you to deploy a new server in your different silos within minutes. If you only use your Gold Template then you will still need to install your applications after deploying.
  * When you have multiple images (Gold, Silver1, Silver2, etc.) you will need a plan to deploy your templates efficiently.
  * Keep your templates up-to-date with MS updates each month.
  * Use VMware Update Manager.
  * If you have an application update or addition to a silo then update that silo’s template and deploy the template out. This keeps all your Citrix servers identical and then you don’t need to install and test the update\addition on all servers. Saves on regression testing.

**Citrix Server Templates\Cloning**  
Prepping Your Server

  * Quick Steps to prepare your server to clone: 
      * Install the first server in the farm
      * Install any additional software you would like on your template such as MS Office, AV, etc.
      * Reboot Server
      * Delete the wfcname.ini file, if it exists, from the root of C:
      * Stop the IMA server and set to Manual start up
      * If Presentation Server is Enterprise Edition you need to remove the local host cache located at  “%ProgramFiles%\Citrix\Citrix Resource Manager\LocalDB”
      * Shut down your server
      * Clone server to template
      * Complete instructions for cloning a Citrix server can be found at <http://support.citrix.com/article/CTX107406>
  * Caution: Do not attempt to image a server with an SSL certificate installed because SSL certificates are unique to the hardware.
  * Caution: Do not attempt to use drive image software to restore an image of a Presentation Server with remapped drives.
  * Remapped drives will partially revert to the original configuration on the deployed server rendering the server unusable. Servers with remapped drives may be duplicated using a hardware solution such as Compaq Smart Array controllers with RAID1 drive mirroring.