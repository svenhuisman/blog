---
id: 3030
title: Fusion ioVDI hands-on experience
date: 2014-05-14T23:26:06+02:00
author: Sven Huisman
layout: post
guid: http://virtualfuture.info/?p=3030
permalink: /2014/05/fusion-iovdi-hands-on-experience/
categories:
  - Virtual Desktop
tags:
  - Fusion-io
  - Horizon
  - ioVDI
  - non-persistent
  - persistent
  - stateful
  - stateless
  - View
  - VMware
---
I recently got some hands-on experience with <a title="Fusion-io ioVDI" href="http://www.fusionio.com/products/iovdi" target="_blank" rel="noopener noreferrer">Fusion ioVDI </a>which I would like to share. Fusion ioVDI software is a desktop-aware solution for VDI. ioVDI uses shared storage to store the virtual desktops and Fusion-io ioDrives or ioScale cards to offload IO traffic. ioVDI has the following features:  
**&#8211; Write Vectoring**

  * Accelerates desktop performance by intelligently vectoring non-persistent writes to local server flash
  * Offloads up to 77% of SAN/NAS write workload
  * Limits shared storage interaction to the small number of writes that persist between login sessions, while preserving the use of VMware value-added features such as vMotion, HA, DRS, and SRM

**&#8211; Transparent File Sharing** speeds boot times by allowing all virtual desktops to share common files  
**&#8211; Storage-agnostic Architecture** preserves storage and data protection investment on any SAN or NAS storage  
**&#8211; Storage Snapshots** transparently supported with any VAAI shared storage management solution

You can also read about Fusion ioVDI and the architecture in <a title="ESG - Fusion ioVDI report" href="http://www.esg-global.com/lab-reports/fusion-iovdi-and-vmware-horizon-view/" target="_blank" rel="noopener noreferrer">this labreport</a>.  
<!--more-->

  
**Requirements**  
ioVDI 1.0.0 has the following requirements:

  * VMware vCenter Versions: All VMware supported versions of vCenter 5.0, 5.1, 5.5
  * VMware ESXi Host Versions: ESXi 5.0, 5.0 U1, 5.0 U2, 5.0 U3, 5.1, 5.1 U1, 5.5
  * VMware Horizon View Versions: VMware Horizon View 5.0, 5.1, 5.2, 5.3
  * Microsoft Operating System Versions: All 64-bit versions of Windows 7

The ioVDI management server is a virtual appliance you install on a host in the backend-cluster, not on a host on which you run desktops which you want to offload using ioVDI.

**Global installation steps**  
The following steps are involved installing the ioVDI solution:  
1. Deploy the ioVDI Management Server virtual appliance (OVA)  
2. Install the ioVDI license  
3. Install the ioVDI Host Package (on each host)  
4. Configure the Fusion-io ioMemory Cache devices for ioVDI  
5. Prepare the Windows 7 golden image for ioVDI  
6. Clone the pool of ioVDI VMs  
7. Enable the pool of ioVDI VMs

The instructions are well described in the administrator guide, but I will describe in short my experience with each step.

* * *

Go mobile with cloud hosted VDIs and virtual machines stored on the SSAE 16 certified datacenters with automatic backups and 99.9% uptime guarantee using <a href=https://www.clouddesktoponline.com/ target=”_blank”>CloudDesktopOnline</a>. Learn more about Desktop as a Service (DaaS) or virtualization software by visiting <a href=http://www.apps4rent.com/ target=”_blank”>Apps4Rent.com</a>.

* * *

**1. Deploy OVA**  
[<img src="https://svenhuisman.com/wp-content/uploads/2014/05/1.png" alt="1" width="385" height="182" />](https://svenhuisman.com/wp-content/uploads/2014/05/1.png)  
Straight forward installation of the appliance. You can assign a fixed ip if you want, but you can also use DHCP.

&#8211; Login to the ioVDI appliance (console)  
After the installation is finished, you can open the console and login using root and the password which is documented in the admin guide.

&#8211; Register the appliance with vCenter  
The first thing to do is to register the vCenter server, which manages the VDI-hosts. Use this command:  
iovdi vcenter &#8211;register –va <vCenter FQDN or IPAddr> -vu &#8220;domain\username&#8221;

2. Install license  
I skipped this step because the appliance comes with a trial license that remains effective until June 30, 2014. But when you get a license, you get a license-iso file. You mount the file to the virtual appliance, and then apply the following command:  
iovdi ms &#8211;installlicense

3. Install the ioVDI Host Package  
Make sure you enable the HTTP client firewall rule on the ESXi host(s), or else you get an error. Then, login to the vCenter. By default, inactive login sessions timeout and close automatically after 30 minutes. After a timeout, you must login again before you van issue an ioVDI command. Use the following command to login:  
iovdi vcenter &#8211;login –va <vCenter FQDN or IPAddr> -vu &#8220;domain\username&#8221;

Then, put the host in maintenance mode and use the following command to install the host package:  
iovdi host &#8211;install –vh <ioVDI host FQDN or IPAddr>  
[<img src="https://svenhuisman.com/wp-content/uploads/2014/05/install2.png" alt="install2" width="722" height="134" />](https://svenhuisman.com/wp-content/uploads/2014/05/install2.png)

Verify that the host package was installed:  
Iovdi host &#8211;listpackage –vh <ioVDI host FQDN or IPAddr>  
[<img src="https://svenhuisman.com/wp-content/uploads/2014/05/install3.png" alt="install3" width="570" height="72" />](https://svenhuisman.com/wp-content/uploads/2014/05/install3.png)

4. Configure the Fusion-io ioMemory Cache devices for ioVDI  
ioVDI uses a Fusion-io ioMemory Cache device to cache system I/O on a host. There can be only one ioMemory Cache device configured for ioVDI on each host. Use the following command to lost the available devices:  
iovdi host &#8211;listluns –vh <ioVDI host FQDN or IPAddr>  
[<img src="https://svenhuisman.com/wp-content/uploads/2014/05/install4.png" alt="install4" width="558" height="156" />](https://svenhuisman.com/wp-content/uploads/2014/05/install4.png)

In my case, I have a Fusion-IO duo2 card installed, but I can use only 1 lun.  
Use the following command to configure the device:  
iovdi host &#8211;confighost –vh <host FQDN or IP Address> -sd <cache device canonical name>  
[<img src="https://svenhuisman.com/wp-content/uploads/2014/05/install5.png" alt="install5" width="727" height="135" />](https://svenhuisman.com/wp-content/uploads/2014/05/install5.png)

Now verify that the configuration is successful using the following command:  
iovdi host &#8211;stats –vh <ioVDI host FQDN or IP>  
[<img src="https://svenhuisman.com/wp-content/uploads/2014/05/install6.png" alt="install6" width="524" height="295" />](https://svenhuisman.com/wp-content/uploads/2014/05/install6.png)

5. Prepare the Windows 7 golden image for ioVDI  
Now that the host is prepared, you can prepare the golden image for ioVDI. The golden image needs to be Windows 7 x64.  
&#8211; Shut down the golden image.  
&#8211; Add a disposable disk for Write Vectoring by using the following command:  
iovdi guest &#8211;enablevm –np <GMI in vCenter> &#8211;adddisk –-editvmx  
[<img src="https://svenhuisman.com/wp-content/uploads/2014/05/Guest1.png" alt="Guest1" width="732" height="83" />](https://svenhuisman.com/wp-content/uploads/2014/05/Guest1.png)  
Verify that the installation is successful, by viewing the properties of the VM. There should be an extra virtual disk (Independent, non-persistent) of 5 GB added.  
&#8211; Verify that the golden image is configured for ioVDI by using the following command:  
iovdi guest &#8211;gueststatus –np <GMI VM name pattern>  
[<img src="https://svenhuisman.com/wp-content/uploads/2014/05/Guest2.png" alt="Guest2" width="429" height="76" />](https://svenhuisman.com/wp-content/uploads/2014/05/Guest2.png)

&#8211; Now start the golden image and wait for it to power up to Windows.  
&#8211; Install the ioVDI guest package using the following command on the ioVDI appliance:  
iovdi guest &#8211;install –np <GMI in VC> -gu <GMI Administrator> -gp <password>  
[<img src="https://svenhuisman.com/wp-content/uploads/2014/05/Guest3.png" alt="Guest3" width="731" height="139" />](https://svenhuisman.com/wp-content/uploads/2014/05/Guest3.png)

&#8211; Verify that the installation was successful by using the following command:  
iovdi guest &#8211;version -np <GMI VM name pattern> -gu Administrator  
[<img src="https://svenhuisman.com/wp-content/uploads/2014/05/Guest4.png" alt="Guest4" width="561" height="71" />](https://svenhuisman.com/wp-content/uploads/2014/05/Guest4.png)  
&#8211; Verify that all temp files are being redirected to the disposable disk by using the following command:  
iovdi guest &#8211;doctor -np <guest name pattern> -gu Administrator  
[<img src="https://svenhuisman.com/wp-content/uploads/2014/05/Guest5.png" alt="Guest5" width="545" height="132" />](https://svenhuisman.com/wp-content/uploads/2014/05/Guest5.png)  
The Golden image can now be used to create a pool of desktops.

6. Clone the pool of ioVDI VMs  
You can now use VMware Horizon View to create a pool of VMs from the golden image for use with ioVDI. When creating and naming your VMs, it is recommended that you use a generalized prefix (for example, ioVDI-VM) for easier identification of the ioVDI VMs by ioVDI and in the vCenter Server. Keep in mind the following:  
&#8211; Do not use VMware’s Disposable File Redirection with ioVDI.  
&#8211; Do not use VMware’s View Storage Accelerator (VSA) with ioVDI.

7. Enable the pool of ioVDI VMs  
The pool you just created can not be used just yet. You first need to enable the disposable disk on all the replicated VMs in the pool. This can be done by taking the following steps:  
&#8211; Open the vSphere Console and connect to the vCenter Server.  
&#8211; Use VMware Horizon View to disable and then power off all of the VMs in the pool.  
&#8211; Use SSH to connect to the ioVDI Management Appliance or open the console of the ioVDI appliance.  
&#8211; Enable the disposable disks on all of the replicated VMs using the following command:  
iovdi guest &#8211;enablevm –np <Prefix of named VMs + *> &#8211;adddisk –editvmx  
[<img src="https://svenhuisman.com/wp-content/uploads/2014/05/Guest6.png" alt="Guest6" width="741" height="269" />](https://svenhuisman.com/wp-content/uploads/2014/05/Guest6.png)

As you can see, I had only 3 desktops in the pool.  
&#8211; Verify that the VMs have been enabled using the following command:  
iovdi guest &#8211;gueststatus –np <Prefix of namedVMs + *>  
[<img src="https://svenhuisman.com/wp-content/uploads/2014/05/Guest7.png" alt="Guest7" width="452" height="269" />](https://svenhuisman.com/wp-content/uploads/2014/05/Guest7.png)  
&#8211; Power on the VMs from the pool and enable the pool in Horizon View.

The installation and configuration of ioVDI is now completed.  
As you noticed, I had to enable caching on the VMs after I deployed the pool using Horizon View. You might ask yourself, what happens when the desktops are refreshed? Exactly, you have to re-enable caching! There is a script documented which you can schedule that re-enables VMs for ioVDI. Unfortunately, if you set your pool to refresh desktops after the user logs off, scheduling this script doesn&#8217;t make sense.  
For now, I would recommend to use ioVDI with persistent desktops. If you would like to use non-persistent desktop, I would not refresh the desktops after logoff, but schedule a refresh of the pool every night. After the refresh is completed, schedule the ioVDI re-enable script.

**Performance**  
I haven&#8217;t performed any performance tests using ioVDI, so I can&#8217;t comment on that. There is a <a title="ioVDI" href="http://www.fusionio.com/white-papers/iovdi-simple-cost-effective-vdi/" target="_blank" rel="noopener noreferrer">whitepaper from Fusion-io</a> and it looks promising (of course, the whitepaper is marketing but it should work as described in the whitepaper).

**The good, the bad and the ugly**

The good:  
I&#8217;ve done a lot of Horizon View implementations using local Fusion-io storage. An architecture like that can&#8217;t be used for persistent desktops. Also, putting a host in maintenance is not easy because desktops can&#8217;t be migrated to other hosts. ioVDI solves these issues. I can use shared storage for VDI-desktops (so I can vMotion desktops and use persistent desktops) and I can use Fusion-io cards to give my desktops a really good experience and to offload my central storage.

The bad:  
Commandline interface only. I can live with it, but I can imagine most Horizon View administrators would like to use a GUI, or at least have a webinterface to check the status.  
Only Windows 7 x64 supported, no Windows 8.1 yet.  
Driver installation required within golden master desktop. I would rather see that the desktop VMs won&#8217;t have to be edited at all, no disk added, no driver installed. Keep it clean.

The ugly:  
Non-persistent desktops needs to be re-enabled after a refresh of the desktop. I&#8217;m not sure this is something I would rely on.

Overall, I like ioVDI and the potential it has. For a 1.0.0 version, it&#8217;s not bad but it lacks certain features and I don&#8217;t like the fact the golden image has to be altered. For customers using persistent desktops who wants to offload their SAN using Fusion-IO cards, this could be a good start to look at!