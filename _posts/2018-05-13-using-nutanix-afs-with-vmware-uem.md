---
id: 30183
title: Using Nutanix AFS with VMware UEM
date: 2018-05-13T23:52:33+02:00
author: Sven Huisman
layout: post
guid: https://SvenHuisman.com/?p=30183
permalink: /2018/05/using-nutanix-afs-with-vmware-uem/
categories:
  - Nutanix
  - Storage
  - Virtual Desktop
  - Workspace Management
tags:
  - AFS
  - File Services
  - Nutanix
  - UEM
  - User Environment Manager
  - VMware
---
<a href="https://www.nutanix.com/products/acropolis/file-services/" target="_blank" rel="noopener">Nutanix Acropolis File Services (AFS)</a>, a web-scale native scale out file serving solution, is available for two years now. But since I&#8217;ve not had the opportunity to use AFS together with VMware User Environment Manager (UEM) yet, I thought I&#8217;d give it a go and while I&#8217;m at it, blog about how to set it up. If you don&#8217;t know about VMware User Environment Manager, watch the short video below.



In short, VMware UEM is used to manage the user&#8217;s Windows desktop and application settings (GPO-settings, drive-mappings, printer mappings, application shortcuts, etc) and is also a replacement for the Windows (roaming) profile. VMware UEM uses an agent installed on the Windows (virtual) desktop or RDSH-server and needs two file shares: one for the configuration and one for the user settings. There is no other infrastructure requirement, like a database.

<img class="aligncenter size-large wp-image-30184" src="https://svenhuisman.com/wp-content/uploads/2018/05/UEM-arch-1024x576.jpg" alt="" width="650" height="366" srcset="https://svenhuisman.com/wp-content/uploads/2018/05/UEM-arch-1024x576.jpg 1024w, https://svenhuisman.com/wp-content/uploads/2018/05/UEM-arch-350x197.jpg 350w, https://svenhuisman.com/wp-content/uploads/2018/05/UEM-arch-768x432.jpg 768w, https://svenhuisman.com/wp-content/uploads/2018/05/UEM-arch-650x366.jpg 650w, https://svenhuisman.com/wp-content/uploads/2018/05/UEM-arch.jpg 1280w" sizes="(max-width: 650px) 100vw, 650px" /> 

In a &#8220;traditional&#8221; infrastructure I would need a NAS solution to host the file shares, or I would need to setup a Windows fileserver, maybe with DFS-replication or Windows Fileserver cluster and arrange for backup, depending on the requirements. And then there is scaling up or out and maintaining the Windows operating system, which doesn&#8217;t make a sysadmin&#8217;s life easier.

And here&#8217;s where Nutanix AFS comes in to play. AFS is very easy to install file services, easy to configure, easy to maintain, easy to scale-out (or up) and easy to backup and recover. (Did I already mention it was easy?) 🙂

Let&#8217;s take a look how easy it is to install and configure Nutanix AFS for VMware User Environment Manager (or for any comparable user environment management solution).

# Nutanix AFS

The architecture of Nutanix AFS contains of at least 3 file services VMs which communicates with the Nutanix CVMs:

<img class="aligncenter size-full wp-image-30185" src="https://svenhuisman.com/wp-content/uploads/2018/05/NutanixAFS.png" alt="" width="717" height="316" srcset="https://svenhuisman.com/wp-content/uploads/2018/05/NutanixAFS.png 717w, https://svenhuisman.com/wp-content/uploads/2018/05/NutanixAFS-350x154.png 350w, https://svenhuisman.com/wp-content/uploads/2018/05/NutanixAFS-650x286.png 650w" sizes="(max-width: 717px) 100vw, 717px" /> 

### AFS requirements

Make sure to read the <a href="https://portal.nutanix.com/#/page/docs/details?targetId=Acropolis-File-Services-v30:afs-file-server-prerequisite-r.html" target="_blank" rel="noopener">technical requirements</a> for Nutanix AFS before installing.

### AFS Licensing

Nutanix Acropolis Operating System is available in three versions:

<li style="list-style-type: none;">
  <ul>
    <li style="list-style-type: none;">
      <ul type="disc">
        <li>
          Starter
        </li>
        <li>
          Pro
        </li>
        <li>
          Ultimate
        </li>
      </ul>
    </li>
  </ul>
</li>

AFS is included with Ultimate and can be licensed as standalone product (per node in the cluster) with the other two type of licenses.

### Deployment

Installing AFS is straight forward. From the PRISM management console, select the Home-button and then select &#8220;File Server&#8221;:

<img class="aligncenter size-large wp-image-30195" src="https://svenhuisman.com/wp-content/uploads/2018/05/AFS-install-1-1024x612.png" alt="" width="650" height="388" srcset="https://svenhuisman.com/wp-content/uploads/2018/05/AFS-install-1-1024x612.png 1024w, https://svenhuisman.com/wp-content/uploads/2018/05/AFS-install-1-350x209.png 350w, https://svenhuisman.com/wp-content/uploads/2018/05/AFS-install-1-768x459.png 768w, https://svenhuisman.com/wp-content/uploads/2018/05/AFS-install-1-650x389.png 650w" sizes="(max-width: 650px) 100vw, 650px" /> 

In the next screen, press the &#8220;+ File Server&#8221; button on the upper right corner:

<img class="aligncenter wp-image-30196" src="https://svenhuisman.com/wp-content/uploads/2018/05/AFS-install-2.png" alt="" width="329" height="270" srcset="https://svenhuisman.com/wp-content/uploads/2018/05/AFS-install-2.png 624w, https://svenhuisman.com/wp-content/uploads/2018/05/AFS-install-2-350x287.png 350w" sizes="(max-width: 329px) 100vw, 329px" /> 

The installation wizard starts with the pre-checks:

<img class="aligncenter wp-image-30197" src="https://svenhuisman.com/wp-content/uploads/2018/05/AFS-install-3-1024x785.png" alt="" width="410" height="314" srcset="https://svenhuisman.com/wp-content/uploads/2018/05/AFS-install-3-1024x785.png 1024w, https://svenhuisman.com/wp-content/uploads/2018/05/AFS-install-3-350x268.png 350w, https://svenhuisman.com/wp-content/uploads/2018/05/AFS-install-3-768x589.png 768w, https://svenhuisman.com/wp-content/uploads/2018/05/AFS-install-3-650x498.png 650w, https://svenhuisman.com/wp-content/uploads/2018/05/AFS-install-3.png 1088w" sizes="(max-width: 410px) 100vw, 410px" /> 

The File server virtual machines uses the Data services IP to communicate with the Nutanix CVMs. I did not have a Data Services IP configured yet, so after configuring the Data services IP, I ran the Pre-Check again:

<img class="aligncenter wp-image-30198" src="https://svenhuisman.com/wp-content/uploads/2018/05/AFS-install-4-1024x788.png" alt="" width="406" height="312" srcset="https://svenhuisman.com/wp-content/uploads/2018/05/AFS-install-4-1024x788.png 1024w, https://svenhuisman.com/wp-content/uploads/2018/05/AFS-install-4-350x269.png 350w, https://svenhuisman.com/wp-content/uploads/2018/05/AFS-install-4-768x591.png 768w, https://svenhuisman.com/wp-content/uploads/2018/05/AFS-install-4-650x500.png 650w, https://svenhuisman.com/wp-content/uploads/2018/05/AFS-install-4.png 1084w" sizes="(max-width: 406px) 100vw, 406px" /> 

The next step is to enter some basic information, like name, domain and file server storage size. You also configure the initial default File Server configuration here. The minimum is 3 file server VMs. This can be increased afterwards:

<img class="aligncenter wp-image-30199" src="https://svenhuisman.com/wp-content/uploads/2018/05/AFS-install-5-953x1024.png" alt="" width="394" height="423" srcset="https://svenhuisman.com/wp-content/uploads/2018/05/AFS-install-5-953x1024.png 953w, https://svenhuisman.com/wp-content/uploads/2018/05/AFS-install-5-326x350.png 326w, https://svenhuisman.com/wp-content/uploads/2018/05/AFS-install-5-768x825.png 768w, https://svenhuisman.com/wp-content/uploads/2018/05/AFS-install-5-650x698.png 650w, https://svenhuisman.com/wp-content/uploads/2018/05/AFS-install-5.png 1024w" sizes="(max-width: 394px) 100vw, 394px" /> 

The file server VMs uses two networks: one for communication with the clients (as well as DNS and AD) and one for communicating with the CVMs, the Nutanix controller VMs which are responsible for providing storage. In this environment I use a flat network where clients and storage-network are on the same network. You can enter 3 separate IP addresses or a range of 3 addresses:

<img class="aligncenter wp-image-30200" src="https://svenhuisman.com/wp-content/uploads/2018/05/AFS-install-6-796x1024.png" alt="" width="373" height="480" srcset="https://svenhuisman.com/wp-content/uploads/2018/05/AFS-install-6-796x1024.png 796w, https://svenhuisman.com/wp-content/uploads/2018/05/AFS-install-6-272x350.png 272w, https://svenhuisman.com/wp-content/uploads/2018/05/AFS-install-6-768x987.png 768w, https://svenhuisman.com/wp-content/uploads/2018/05/AFS-install-6-650x836.png 650w, https://svenhuisman.com/wp-content/uploads/2018/05/AFS-install-6.png 1050w" sizes="(max-width: 373px) 100vw, 373px" /> 

The storage network needs one ip-address extra, in my case 4:

<img class="aligncenter wp-image-30201" src="https://svenhuisman.com/wp-content/uploads/2018/05/AFS-install-7-806x1024.png" alt="" width="365" height="463" srcset="https://svenhuisman.com/wp-content/uploads/2018/05/AFS-install-7-806x1024.png 806w, https://svenhuisman.com/wp-content/uploads/2018/05/AFS-install-7-275x350.png 275w, https://svenhuisman.com/wp-content/uploads/2018/05/AFS-install-7-768x976.png 768w, https://svenhuisman.com/wp-content/uploads/2018/05/AFS-install-7-650x826.png 650w, https://svenhuisman.com/wp-content/uploads/2018/05/AFS-install-7.png 1026w" sizes="(max-width: 365px) 100vw, 365px" /> 

The next step I need to select the protocols I want to use with this File services. I select the SMB protocol, which is used for Windows file shares. Enter a user name which is capable of joining the file server VMs to the domain. It&#8217;s best practice to use a service account for this:

<img class="aligncenter wp-image-30202" src="https://svenhuisman.com/wp-content/uploads/2018/05/AFS-install-8-909x1024.png" alt="" width="382" height="430" srcset="https://svenhuisman.com/wp-content/uploads/2018/05/AFS-install-8-909x1024.png 909w, https://svenhuisman.com/wp-content/uploads/2018/05/AFS-install-8-311x350.png 311w, https://svenhuisman.com/wp-content/uploads/2018/05/AFS-install-8-768x866.png 768w, https://svenhuisman.com/wp-content/uploads/2018/05/AFS-install-8-650x733.png 650w, https://svenhuisman.com/wp-content/uploads/2018/05/AFS-install-8.png 1024w" sizes="(max-width: 382px) 100vw, 382px" /> 

The final step is the summary and then grab a coffee and watch the magic:

<img class="aligncenter wp-image-30203" src="https://svenhuisman.com/wp-content/uploads/2018/05/AFS-install-9-1024x528.png" alt="" width="578" height="298" srcset="https://svenhuisman.com/wp-content/uploads/2018/05/AFS-install-9-1024x528.png 1024w, https://svenhuisman.com/wp-content/uploads/2018/05/AFS-install-9-350x181.png 350w, https://svenhuisman.com/wp-content/uploads/2018/05/AFS-install-9-768x396.png 768w, https://svenhuisman.com/wp-content/uploads/2018/05/AFS-install-9-650x335.png 650w, https://svenhuisman.com/wp-content/uploads/2018/05/AFS-install-9.png 1590w" sizes="(max-width: 578px) 100vw, 578px" /> 

And after the deployment, you should see something like this:

<img class="aligncenter wp-image-30239 " src="https://svenhuisman.com/wp-content/uploads/2018/05/AFS-Install-10b-1024x603.png" alt="" width="563" height="332" srcset="https://svenhuisman.com/wp-content/uploads/2018/05/AFS-Install-10b-1024x603.png 1024w, https://svenhuisman.com/wp-content/uploads/2018/05/AFS-Install-10b-350x206.png 350w, https://svenhuisman.com/wp-content/uploads/2018/05/AFS-Install-10b-768x452.png 768w, https://svenhuisman.com/wp-content/uploads/2018/05/AFS-Install-10b-650x383.png 650w" sizes="(max-width: 563px) 100vw, 563px" /> 

Now I can create the file shares for the UEM configuration and the share to store the user settings. The UEM config share is a General Purpose Share:

<img class="aligncenter wp-image-30204" src="https://svenhuisman.com/wp-content/uploads/2018/05/AFS-Create-UEM-Share-840x1024.png" alt="" width="310" height="378" srcset="https://svenhuisman.com/wp-content/uploads/2018/05/AFS-Create-UEM-Share-840x1024.png 840w, https://svenhuisman.com/wp-content/uploads/2018/05/AFS-Create-UEM-Share-287x350.png 287w, https://svenhuisman.com/wp-content/uploads/2018/05/AFS-Create-UEM-Share-768x936.png 768w, https://svenhuisman.com/wp-content/uploads/2018/05/AFS-Create-UEM-Share-650x792.png 650w, https://svenhuisman.com/wp-content/uploads/2018/05/AFS-Create-UEM-Share.png 1004w" sizes="(max-width: 310px) 100vw, 310px" /> 

The share to store the user-settings is comparable to a share for home directories or user profiles. Within this share each user will have their own directory to store files. This is one of the options, and an important use-case for Nutanix AFS, that you can select when creating the file share:[  
](https://svenhuisman.com/wp-content/uploads/2018/05/AFS-File-Shares.png) [  
](https://svenhuisman.com/wp-content/uploads/2018/05/AFS-Install-10.png)<img class="aligncenter wp-image-30207" src="https://svenhuisman.com/wp-content/uploads/2018/05/Create-Share-UEM-Users-840x1024.png" alt="" width="314" height="383" srcset="https://svenhuisman.com/wp-content/uploads/2018/05/Create-Share-UEM-Users-840x1024.png 840w, https://svenhuisman.com/wp-content/uploads/2018/05/Create-Share-UEM-Users-287x350.png 287w, https://svenhuisman.com/wp-content/uploads/2018/05/Create-Share-UEM-Users-768x937.png 768w, https://svenhuisman.com/wp-content/uploads/2018/05/Create-Share-UEM-Users-650x793.png 650w, https://svenhuisman.com/wp-content/uploads/2018/05/Create-Share-UEM-Users.png 1002w" sizes="(max-width: 314px) 100vw, 314px" /> 

Providing the Max size for the share is optional:

<img class="aligncenter wp-image-30208" src="https://svenhuisman.com/wp-content/uploads/2018/05/Create-Share-UEM-Users-2.png" alt="" width="309" height="235" srcset="https://svenhuisman.com/wp-content/uploads/2018/05/Create-Share-UEM-Users-2.png 1006w, https://svenhuisman.com/wp-content/uploads/2018/05/Create-Share-UEM-Users-2-350x267.png 350w, https://svenhuisman.com/wp-content/uploads/2018/05/Create-Share-UEM-Users-2-768x585.png 768w, https://svenhuisman.com/wp-content/uploads/2018/05/Create-Share-UEM-Users-2-650x495.png 650w" sizes="(max-width: 309px) 100vw, 309px" /> 

In the next screen you are able to enable &#8220;Access Based Enumeration&#8221;. This means the user can only see the folders on which he has permissions:

<img class="aligncenter wp-image-30209" src="https://svenhuisman.com/wp-content/uploads/2018/05/Create-Share-UEM-Users-3.png" alt="" width="324" height="169" srcset="https://svenhuisman.com/wp-content/uploads/2018/05/Create-Share-UEM-Users-3.png 1004w, https://svenhuisman.com/wp-content/uploads/2018/05/Create-Share-UEM-Users-3-350x183.png 350w, https://svenhuisman.com/wp-content/uploads/2018/05/Create-Share-UEM-Users-3-768x401.png 768w, https://svenhuisman.com/wp-content/uploads/2018/05/Create-Share-UEM-Users-3-650x339.png 650w" sizes="(max-width: 324px) 100vw, 324px" /> 

After creating both shares, they are visible in the PRISM management console:

<img class="aligncenter wp-image-30205" src="https://svenhuisman.com/wp-content/uploads/2018/05/AFS-File-Shares.png" alt="" width="363" height="153" srcset="https://svenhuisman.com/wp-content/uploads/2018/05/AFS-File-Shares.png 888w, https://svenhuisman.com/wp-content/uploads/2018/05/AFS-File-Shares-350x147.png 350w, https://svenhuisman.com/wp-content/uploads/2018/05/AFS-File-Shares-768x323.png 768w, https://svenhuisman.com/wp-content/uploads/2018/05/AFS-File-Shares-650x274.png 650w" sizes="(max-width: 363px) 100vw, 363px" /> 

Now that both shares are created, the NTFS permissions needs to be adjusted to work with VMware UEM:

<img class="aligncenter wp-image-30232" src="https://svenhuisman.com/wp-content/uploads/2018/05/Windows-File-Shares-1024x402.png" alt="" width="446" height="175" srcset="https://svenhuisman.com/wp-content/uploads/2018/05/Windows-File-Shares-1024x402.png 1024w, https://svenhuisman.com/wp-content/uploads/2018/05/Windows-File-Shares-350x138.png 350w, https://svenhuisman.com/wp-content/uploads/2018/05/Windows-File-Shares-768x302.png 768w, https://svenhuisman.com/wp-content/uploads/2018/05/Windows-File-Shares-650x255.png 650w, https://svenhuisman.com/wp-content/uploads/2018/05/Windows-File-Shares.png 1028w" sizes="(max-width: 446px) 100vw, 446px" /> 

On the UEM-CONFIG share, the default NTFS permissions are &#8220;full control&#8221; for the administrator group and the Users group:

<img class="aligncenter wp-image-30216" src="https://svenhuisman.com/wp-content/uploads/2018/05/UEM-Config-Share-default-rights-725x1024.png" alt="" width="239" height="337" srcset="https://svenhuisman.com/wp-content/uploads/2018/05/UEM-Config-Share-default-rights-725x1024.png 725w, https://svenhuisman.com/wp-content/uploads/2018/05/UEM-Config-Share-default-rights-248x350.png 248w, https://svenhuisman.com/wp-content/uploads/2018/05/UEM-Config-Share-default-rights-650x918.png 650w, https://svenhuisman.com/wp-content/uploads/2018/05/UEM-Config-Share-default-rights.png 758w" sizes="(max-width: 239px) 100vw, 239px" /> 

As we don&#8217;t want this &#8220;Users&#8221; group to be able to edit or remove files, this group is removed and replaced by the &#8220;Domain users&#8221; group with read permissions:

<img class="aligncenter wp-image-30217" src="https://svenhuisman.com/wp-content/uploads/2018/05/UEM-Config-Share-new-rights.png" alt="" width="297" height="359" srcset="https://svenhuisman.com/wp-content/uploads/2018/05/UEM-Config-Share-new-rights.png 760w, https://svenhuisman.com/wp-content/uploads/2018/05/UEM-Config-Share-new-rights-290x350.png 290w, https://svenhuisman.com/wp-content/uploads/2018/05/UEM-Config-Share-new-rights-650x785.png 650w" sizes="(max-width: 297px) 100vw, 297px" /> 

I&#8217;ve also added the domain group &#8220;UEM-Admins&#8221; with Full Control, so users of this group can change the UEM-configuration.

The NTFS-permissions for the &#8220;UEM-USERS&#8221; share also need to be changed because with the default permissions the folders for the users will not be created. From a Windows desktop, browse to the file-server. Right-click the UEM-USERS share and select &#8220;Security&#8221;. Then click &#8220;Advanced&#8221;:

<img class="aligncenter wp-image-30228" src="https://svenhuisman.com/wp-content/uploads/2018/05/UEM-Settings-Share-rights-new-1024x494.png" alt="" width="375" height="181" srcset="https://svenhuisman.com/wp-content/uploads/2018/05/UEM-Settings-Share-rights-new-1024x494.png 1024w, https://svenhuisman.com/wp-content/uploads/2018/05/UEM-Settings-Share-rights-new-350x169.png 350w, https://svenhuisman.com/wp-content/uploads/2018/05/UEM-Settings-Share-rights-new-768x370.png 768w, https://svenhuisman.com/wp-content/uploads/2018/05/UEM-Settings-Share-rights-new-650x313.png 650w, https://svenhuisman.com/wp-content/uploads/2018/05/UEM-Settings-Share-rights-new.png 1564w" sizes="(max-width: 375px) 100vw, 375px" /> 

I&#8217;ve added a domain group called &#8220;UEM-Helpdesk-users&#8221; with full control. This way it is now possible for the Helpdesk to help the user to fix user and application settings with the UEM Helpdesk tool. The account &#8220;CREATOR OWNER&#8221; should have &#8220;Full Control&#8221; on &#8220;Subfolders and files only&#8221;. I&#8217;ve also added the domain users group and gave special permissions &#8220;Create Folder/Append data&#8221; on &#8220;This folder only&#8221;.

<img class="aligncenter wp-image-30229" src="https://svenhuisman.com/wp-content/uploads/2018/05/UEM-Settings-Share-rights-old-1024x613.png" alt="" width="344" height="206" srcset="https://svenhuisman.com/wp-content/uploads/2018/05/UEM-Settings-Share-rights-old-1024x613.png 1024w, https://svenhuisman.com/wp-content/uploads/2018/05/UEM-Settings-Share-rights-old-350x210.png 350w, https://svenhuisman.com/wp-content/uploads/2018/05/UEM-Settings-Share-rights-old-768x460.png 768w, https://svenhuisman.com/wp-content/uploads/2018/05/UEM-Settings-Share-rights-old-650x389.png 650w, https://svenhuisman.com/wp-content/uploads/2018/05/UEM-Settings-Share-rights-old.png 1332w" sizes="(max-width: 344px) 100vw, 344px" /> 

# Setup VMware UEM

### Management console

To setup VMware UEM we need to install the Management Console. I used the following command line to install the management console:

<img class="aligncenter wp-image-30211 size-large" src="https://svenhuisman.com/wp-content/uploads/2018/05/Install-UEM-ManagementConsole-e1526240876632-1024x79.png" alt="" width="650" height="50" srcset="https://svenhuisman.com/wp-content/uploads/2018/05/Install-UEM-ManagementConsole-e1526240876632-1024x79.png 1024w, https://svenhuisman.com/wp-content/uploads/2018/05/Install-UEM-ManagementConsole-e1526240876632-350x27.png 350w, https://svenhuisman.com/wp-content/uploads/2018/05/Install-UEM-ManagementConsole-e1526240876632-768x59.png 768w, https://svenhuisman.com/wp-content/uploads/2018/05/Install-UEM-ManagementConsole-e1526240876632-650x50.png 650w" sizes="(max-width: 650px) 100vw, 650px" /> 

After the installation, start the management console:

<img class="aligncenter wp-image-30227" src="https://svenhuisman.com/wp-content/uploads/2018/05/UEM-ManagementConsole.png" alt="" width="100" height="95" /> 

When starting the Management Console for the first time, you need to provide the location of the configuration share:

<img class="aligncenter wp-image-30213" src="https://svenhuisman.com/wp-content/uploads/2018/05/UEM-Admin-Setup.png" alt="" width="376" height="268" srcset="https://svenhuisman.com/wp-content/uploads/2018/05/UEM-Admin-Setup.png 972w, https://svenhuisman.com/wp-content/uploads/2018/05/UEM-Admin-Setup-350x249.png 350w, https://svenhuisman.com/wp-content/uploads/2018/05/UEM-Admin-Setup-768x547.png 768w, https://svenhuisman.com/wp-content/uploads/2018/05/UEM-Admin-Setup-650x463.png 650w" sizes="(max-width: 376px) 100vw, 376px" /> 

The next step is to personalize the Management console (which features are you going to use?):

<img class="aligncenter wp-image-30214" src="https://svenhuisman.com/wp-content/uploads/2018/05/UEM-Admin-Setup-2.png" alt="" width="306" height="330" srcset="https://svenhuisman.com/wp-content/uploads/2018/05/UEM-Admin-Setup-2.png 940w, https://svenhuisman.com/wp-content/uploads/2018/05/UEM-Admin-Setup-2-324x350.png 324w, https://svenhuisman.com/wp-content/uploads/2018/05/UEM-Admin-Setup-2-768x828.png 768w, https://svenhuisman.com/wp-content/uploads/2018/05/UEM-Admin-Setup-2-650x701.png 650w" sizes="(max-width: 306px) 100vw, 306px" /> 

Press the &#8220;Easy Start&#8221; button to create a default configuration:[  
](https://svenhuisman.com/wp-content/uploads/2018/05/UEM-Config-Share-default-rights.png) [  
](https://svenhuisman.com/wp-content/uploads/2018/05/UEM-Config-Share-new-rights.png)<img class="aligncenter wp-image-30218" src="https://svenhuisman.com/wp-content/uploads/2018/05/UEM-Easy-Start-1.png" alt="" width="83" height="79" /> 

Select the Office version you want to use:

<img class="aligncenter wp-image-30219" src="https://svenhuisman.com/wp-content/uploads/2018/05/UEM-Easy-Start-2-1024x455.png" alt="" width="380" height="169" srcset="https://svenhuisman.com/wp-content/uploads/2018/05/UEM-Easy-Start-2-1024x455.png 1024w, https://svenhuisman.com/wp-content/uploads/2018/05/UEM-Easy-Start-2-350x156.png 350w, https://svenhuisman.com/wp-content/uploads/2018/05/UEM-Easy-Start-2-768x342.png 768w, https://svenhuisman.com/wp-content/uploads/2018/05/UEM-Easy-Start-2-650x289.png 650w, https://svenhuisman.com/wp-content/uploads/2018/05/UEM-Easy-Start-2.png 1322w" sizes="(max-width: 380px) 100vw, 380px" /> 

The default configuration will now be created. After this step is completed, click OK:

<img class="aligncenter wp-image-30220" src="https://svenhuisman.com/wp-content/uploads/2018/05/UEM-Easy-Start-3-1024x202.png" alt="" width="432" height="85" srcset="https://svenhuisman.com/wp-content/uploads/2018/05/UEM-Easy-Start-3-1024x202.png 1024w, https://svenhuisman.com/wp-content/uploads/2018/05/UEM-Easy-Start-3-350x69.png 350w, https://svenhuisman.com/wp-content/uploads/2018/05/UEM-Easy-Start-3-768x152.png 768w, https://svenhuisman.com/wp-content/uploads/2018/05/UEM-Easy-Start-3-650x128.png 650w, https://svenhuisman.com/wp-content/uploads/2018/05/UEM-Easy-Start-3.png 1316w" sizes="(max-width: 432px) 100vw, 432px" /> 

You will see a default configuration which you can edit to your likes. The tab &#8220;Personalization&#8221; presents the application settings and Windows settings for the user, the tab &#8220;User Environment&#8221; represents the workspace for the user, like GPOs, drive mappings, printers, registry settings, etc:

<img class="aligncenter wp-image-30221" src="https://svenhuisman.com/wp-content/uploads/2018/05/UEM-Easy-Start-4-1024x789.png" alt="" width="426" height="328" srcset="https://svenhuisman.com/wp-content/uploads/2018/05/UEM-Easy-Start-4-1024x789.png 1024w, https://svenhuisman.com/wp-content/uploads/2018/05/UEM-Easy-Start-4-350x270.png 350w, https://svenhuisman.com/wp-content/uploads/2018/05/UEM-Easy-Start-4-768x592.png 768w, https://svenhuisman.com/wp-content/uploads/2018/05/UEM-Easy-Start-4-650x501.png 650w, https://svenhuisman.com/wp-content/uploads/2018/05/UEM-Easy-Start-4.png 1318w" sizes="(max-width: 426px) 100vw, 426px" /> 

In the share &#8220;UEM-CONFIG&#8221; you will see this configuration represented in XML-files:

<img class="aligncenter wp-image-30222" src="https://svenhuisman.com/wp-content/uploads/2018/05/UEM-Easy-Start-5.png" alt="" width="419" height="156" srcset="https://svenhuisman.com/wp-content/uploads/2018/05/UEM-Easy-Start-5.png 660w, https://svenhuisman.com/wp-content/uploads/2018/05/UEM-Easy-Start-5-350x130.png 350w, https://svenhuisman.com/wp-content/uploads/2018/05/UEM-Easy-Start-5-650x242.png 650w" sizes="(max-width: 419px) 100vw, 419px" /> 

### Setup VMware UEM for the user

To setup VMware UEM for the user you will need two things:

  * The VMware UEM agent installed on the user&#8217;s desktop
  * A GPO setting to enable VMware UEM and to set the path to the configuration and the User settings

I installed the VMware UEM agent in a master image for a VDI-pool using a command line:

<img class="aligncenter size-large wp-image-30212" src="https://svenhuisman.com/wp-content/uploads/2018/05/Install-VMware-UEM-Agent-1024x154.png" alt="" width="650" height="98" srcset="https://svenhuisman.com/wp-content/uploads/2018/05/Install-VMware-UEM-Agent-1024x154.png 1024w, https://svenhuisman.com/wp-content/uploads/2018/05/Install-VMware-UEM-Agent-350x53.png 350w, https://svenhuisman.com/wp-content/uploads/2018/05/Install-VMware-UEM-Agent-768x115.png 768w, https://svenhuisman.com/wp-content/uploads/2018/05/Install-VMware-UEM-Agent-650x98.png 650w" sizes="(max-width: 650px) 100vw, 650px" /> 

The configuration of the group policy is well <a href="https://docs.vmware.com/en/VMware-User-Environment-Manager/9.3/com.vmware.user.environment.manager-install-config/GUID-7D5642ED-736A-48BE-8B80-BACDA81E2929.html" target="_blank" rel="noopener">documented</a>. The most important settings are the location of the Config share and the Profile archives share. The config share in my case: &#8220;\\CONTAFS.contoso.local\UEM-CONFIG\General&#8221;:

<img class="aligncenter wp-image-30223" src="https://svenhuisman.com/wp-content/uploads/2018/05/UEM-GPO-1.png" alt="" width="336" height="280" srcset="https://svenhuisman.com/wp-content/uploads/2018/05/UEM-GPO-1.png 842w, https://svenhuisman.com/wp-content/uploads/2018/05/UEM-GPO-1-350x292.png 350w, https://svenhuisman.com/wp-content/uploads/2018/05/UEM-GPO-1-768x640.png 768w, https://svenhuisman.com/wp-content/uploads/2018/05/UEM-GPO-1-650x542.png 650w" sizes="(max-width: 336px) 100vw, 336px" /> 

The location of the Profile Archives is in my case: &#8220;\\CONTAFS.contoso.local\UEM-USERS\%username%\Archives&#8221;:

<img class="aligncenter wp-image-30224" src="https://svenhuisman.com/wp-content/uploads/2018/05/UEM-GPO-2.png" alt="" width="292" height="387" srcset="https://svenhuisman.com/wp-content/uploads/2018/05/UEM-GPO-2.png 634w, https://svenhuisman.com/wp-content/uploads/2018/05/UEM-GPO-2-264x350.png 264w" sizes="(max-width: 292px) 100vw, 292px" /> 

Don&#8217;t forget to create a logoff script, otherwise the user&#8217;s settings will not be saved at logoff:

<img class="aligncenter wp-image-30226" src="https://svenhuisman.com/wp-content/uploads/2018/05/UEM-GPO-4.png" alt="" width="328" height="218" srcset="https://svenhuisman.com/wp-content/uploads/2018/05/UEM-GPO-4.png 876w, https://svenhuisman.com/wp-content/uploads/2018/05/UEM-GPO-4-350x233.png 350w, https://svenhuisman.com/wp-content/uploads/2018/05/UEM-GPO-4-768x510.png 768w, https://svenhuisman.com/wp-content/uploads/2018/05/UEM-GPO-4-650x432.png 650w" sizes="(max-width: 328px) 100vw, 328px" /> 

Now that I&#8217;ve setup Nutanix AFS and VMware UEM, I can login to the desktop. After logging in, I can see that a new folder is created for my user account:

#<img class="aligncenter wp-image-30230" src="https://svenhuisman.com/wp-content/uploads/2018/05/UEM-share-after-login.png" alt="" width="422" height="154" srcset="https://svenhuisman.com/wp-content/uploads/2018/05/UEM-share-after-login.png 680w, https://svenhuisman.com/wp-content/uploads/2018/05/UEM-share-after-login-350x128.png 350w, https://svenhuisman.com/wp-content/uploads/2018/05/UEM-share-after-login-650x237.png 650w" sizes="(max-width: 422px) 100vw, 422px" /> 

As you can see, Nutanix AFS is very easy to install and configure. And it&#8217;s not only easy to setup, making changes to AFS (like scaling up or down) is just as easy. Just select the File server, select &#8220;Update&#8221; and the next screen will be presented:

<img class="aligncenter wp-image-30235" src="https://svenhuisman.com/wp-content/uploads/2018/05/AFS-scale.png" alt="" width="376" height="339" srcset="https://svenhuisman.com/wp-content/uploads/2018/05/AFS-scale.png 998w, https://svenhuisman.com/wp-content/uploads/2018/05/AFS-scale-350x316.png 350w, https://svenhuisman.com/wp-content/uploads/2018/05/AFS-scale-768x693.png 768w, https://svenhuisman.com/wp-content/uploads/2018/05/AFS-scale-650x586.png 650w" sizes="(max-width: 376px) 100vw, 376px" /> 

In conclusion, I&#8217;m very impressed how easy it is to setup Nutanix AFS. This is a very valuable add-on for especially VDI and RDSH environments, where file shares are required to store user (profile) settings.

###### (Just a reminder, I work for Nutanix now. So, yes I&#8217;m biased, but I&#8217;ve only written this blog to show you how to setup Nutanix AFS with VMware UEM.)