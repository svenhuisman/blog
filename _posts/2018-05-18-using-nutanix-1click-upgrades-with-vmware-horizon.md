---
id: 30247
title: Using Nutanix 1-click upgrades with VMware Horizon
date: 2018-05-18T13:11:40+02:00
author: Sven Huisman
layout: post
guid: https://SvenHuisman.com/?p=30247
permalink: /2018/05/using-nutanix-1click-upgrades-with-vmware-horizon/
categories:
  - Nutanix
  - Virtual Desktop
tags:
  - 1-click
  - 1-click upgrade
  - Horizon
  - Instant clones
  - Linked Clones
  - Nutanix
  - one-click upgrade
  - VMware
---
# Introduction

In an environment with <a href="https://www.vmware.com/nl/products/horizon.html" target="_blank" rel="noopener">VMware Horizon</a>, you use VMware vSphere as the hypervisor. This hypervisor needs to be patched and updated every now and then. Using VMware Update Manager (VUM) to install updates and patches is a very common practice. With the use of instant clones that doesn&#8217;t always work as it should, see <a href="https://kb.vmware.com/s/article/2144808" target="_blank" rel="noopener">VMware KB2144808</a>. This article describes an issue which is fixed in Horizon 7.1, but when using VUM the manual steps are still required.

When running VMware vSphere on <a href="https://www.nutanix.com/solutions/vdi/vmware/" target="_blank" rel="noopener">Nutanix</a> you update ESXi in a different way. In this article, I describe how you can use Nutanix 1-click upgrade to install updates and patches when using VMware Horizon, and what the key considerations are.

# VMware Update Manager

When you are running VMware vSphere you are probably using VMware Update Manager to install patches and keep the vSphere infrastructure up to date. VUM will put a host in maintenance, vMotion all the powered-on VMs to other hosts in the cluster, install the patches, reboot the host and exit Maintenance mode. VUM will then continue with installing patches on the next host. You can even enable parallel remediation of hosts in a cluster if there are enough resources available to host the powered-on VMs.

<img class="aligncenter size-full wp-image-30252" src="https://svenhuisman.com/wp-content/uploads/2018/05/VUM-parallel.png" alt="" width="542" height="81" srcset="https://svenhuisman.com/wp-content/uploads/2018/05/VUM-parallel.png 542w, https://svenhuisman.com/wp-content/uploads/2018/05/VUM-parallel-350x52.png 350w" sizes="(max-width: 542px) 100vw, 542px" /> 

When you run VMware vSphere on **Nutanix** you can use VUM to install patches, but it requires manual intervention for each host. On each host in a Nutanix cluster, there is a controller VM (CVM) running. When you need to reboot a host in a Nutanix cluster, you need to vMotion all the running VMs to other hosts and then l<span class="ph cmd">og on to the Controller VM with SSH and shut down the Controller VM with the following command:</span>

nutanix@cvm$ **cvm_shutdown -P now  
** 

And you can only have one powered off CVM in a cluster, so parallel remediation is definitely a no-go!

So when you are finished installing the patches and have rebooted the host, the first thing you do after taking it out of maintenance mode is power on the CVM. You then have to wait until all the services are started (SSH into another CVM and run command &#8220;**cluster status**&#8220;), before putting the next host in maintenance. This means a lot of manual intervention when you use VUM to update your vSphere hosts on a Nutanix cluster.

# Nutanix feature: 1-click upgrades

Luckily Nutanix has a feature called 1-click upgrade. This feature will take care of putting a host in maintenance mode, shutting down the CVM the right way, installing the patches and after the reboot, power on the CVM and wait for it to be available again, before proceeding to the next host. This feature is, of course, dependent on DRS to migrate the powered-on VMs, but it definitely simplifies the process of installing patches, without the requirement of manual intervention.

## ESXi patches

Nutanix qualifies specific VMware ESXi hypervisor updates and provides a related JSON metadata upgrade file on the Nutanix Support Portal for 1-click upgrade through the Prism web console Software Upgrade feature. Installing patches from the VMware site is supported, but these may not have been qualified. From the <a href="https://www.nutanix.com/support-services/product-support/faqs/" target="_blank" rel="noopener">support FAQ</a>:

>   * <p class="p2">
>       <em>Nutanix supports the ability to patch upgrade hosts with versions that are greater than or released after the Nutanix qualified version, but Nutanix may not have qualified those releases at that time.</em>
>     </p>
> 
>   * <p class="p2">
>       <em>For updates that are made available by the hypervisor vendor that </em>do<em> not have a Nutanix-provided JSON metadata upgrade file (ie. not officially qualified), obtain the offline bundle and md5sum checksum available from the hypervisor vendor, then use the Prism web console Software Upgrade feature to upgrade.</em>
>     </p>

Using the 1-click upgrade to install ESXi patches or updates is well <a href="https://portal.nutanix.com/#/page/docs/details?targetId=Web_Console_Guide-Acr_v4_6:wc_cluster_hypervisor_upgrade_esx_wc_t.html#ntask_xbp_wcv_fp" target="_blank" rel="noopener">documented</a>. In short, these are the steps you need to take:

<ol class="ol steps props_otherprops_slide ">
  <li class="li step stepexpand">
    <span class="ph cmd">From the VMware website, download the offline bundle and copy the associated MD5 checksum (obtained from the VMware web site)</span>
  </li>
  <li class="li step stepexpand">
    <span class="ph cmd">Save the files to your local machine or media</span>
  </li>
  <li class="li step stepexpand">
    <span class="ph cmd">In the Prism web console, open <span class="ph uicontrol">Upgrade Software</span> from the gear icon and click <span class="ph uicontrol">Hypervisor</span>.</span>
  </li>
  <li class="li step stepexpand">
    <span class="ph cmd">Click the <span class="ph uicontrol">upload a Hypervisor binary</span> link.</span>
  </li>
  <li class="li step stepexpand">
    <span class="ph cmd">Copy the MD5 checksum into the <span class="ph uicontrol">Hypervisor MD5 Checksum</span> field.</span>
  </li>
  <li class="li step stepexpand">
    <span class="ph cmd">Scroll down and click <span class="ph uicontrol">Choose File</span> for the binary file, browse to the offline bundle file location, select the file, and click <span class="ph uicontrol">Upload Now</span>.</span>
  </li>
</ol>

<img class="aligncenter wp-image-30272 " src="https://svenhuisman.com/wp-content/uploads/2018/05/Upload-patch.png" alt="" width="349" height="396" srcset="https://svenhuisman.com/wp-content/uploads/2018/05/Upload-patch.png 549w, https://svenhuisman.com/wp-content/uploads/2018/05/Upload-patch-308x350.png 308w" sizes="(max-width: 349px) 100vw, 349px" /> 

When the file upload is completed, click <span class="ph menucascade"><span class="ph uicontrol">Upgrade</span> > <span class="ph uicontrol">Upgrade Now</span></span>, then click <span class="ph uicontrol">Yes</span> to confirm.

<img class="aligncenter size-medium wp-image-30259" src="https://svenhuisman.com/wp-content/uploads/2018/05/Host-Preupgrade-350x261.png" alt="" width="350" height="261" srcset="https://svenhuisman.com/wp-content/uploads/2018/05/Host-Preupgrade-350x261.png 350w, https://svenhuisman.com/wp-content/uploads/2018/05/Host-Preupgrade-768x572.png 768w, https://svenhuisman.com/wp-content/uploads/2018/05/Host-Preupgrade-1024x762.png 1024w, https://svenhuisman.com/wp-content/uploads/2018/05/Host-Preupgrade-650x484.png 650w, https://svenhuisman.com/wp-content/uploads/2018/05/Host-Preupgrade.png 1104w" sizes="(max-width: 350px) 100vw, 350px" /> 

After the Host pre-upgrade check is finished, it will start patching the hosts one by one:

<img class="aligncenter wp-image-30260 " src="https://svenhuisman.com/wp-content/uploads/2018/05/UpgradingHypervisors.png" alt="" width="607" height="167" srcset="https://svenhuisman.com/wp-content/uploads/2018/05/UpgradingHypervisors.png 1740w, https://svenhuisman.com/wp-content/uploads/2018/05/UpgradingHypervisors-350x96.png 350w, https://svenhuisman.com/wp-content/uploads/2018/05/UpgradingHypervisors-768x211.png 768w, https://svenhuisman.com/wp-content/uploads/2018/05/UpgradingHypervisors-1024x281.png 1024w, https://svenhuisman.com/wp-content/uploads/2018/05/UpgradingHypervisors-650x179.png 650w" sizes="(max-width: 607px) 100vw, 607px" /> 

Nutanix will put the vSphere hosts in maintenance mode, one at a time. DRS will vMotion the powered-on VMs to another host in the cluster. One thing to note, and this is important for linked clones and instant clones, **<span style="text-decoration: underline;">the powered-off VMs will not be migrated to another host</span>** when a host is put into maintenance mode.

After all powered-on (user) VMs are migrated, the 1-click upgrade process will power-down the CVM. Next, the host will go into maintenance mode, patch(es) will be installed, the host is rebooted and then it will be taken out of maintenance. Then the CVM will be powered on again and the 1-click upgrade process will wait until the CVM is up and running again. 1-click upgrade will then proceed with the next host.

<img class="aligncenter wp-image-30273" src="https://svenhuisman.com/wp-content/uploads/2018/05/Upgrade-finished.png" alt="" width="607" height="116" srcset="https://svenhuisman.com/wp-content/uploads/2018/05/Upgrade-finished.png 1063w, https://svenhuisman.com/wp-content/uploads/2018/05/Upgrade-finished-350x67.png 350w, https://svenhuisman.com/wp-content/uploads/2018/05/Upgrade-finished-768x147.png 768w, https://svenhuisman.com/wp-content/uploads/2018/05/Upgrade-finished-1024x196.png 1024w, https://svenhuisman.com/wp-content/uploads/2018/05/Upgrade-finished-650x124.png 650w" sizes="(max-width: 607px) 100vw, 607px" /> 

# Impact on VMware Horizon environments

Within a VMware Horizon environment, we are dealing with Virtual desktops or RDSH VMs which are remotely used by users. You can definitely vMotion desktop and RDSH VMs from one host to another, but this can impact the user experience. So you want to perform maintenance on the hosts preferably when there is not a peak usage of the VDI or RDSH environment. Besides that, you can use the 1-click upgrade feature to install patches and upgrades on hosts running VDI or RDSH VMs. Whether you can really call it a 1-click upgrade depends on the VM deployment option you are using. There are a couple of different VM deployment options with VMware Horizon:

  * Full clones
  * Linked clones
  * Instant clones

And then you also could have NVIDIA vGPU-enabled VMs which require extra attention.

Let&#8217;s take a look at each type of deployment, see what the key considerations are and what you need to do to smoothen the installation of patches or upgrades.

## Full clones

Using Nutanix 1-click upgrade with full clones is easy. Full clones do not have a dependency on a replica disk so the can easily be vMotioned by DRS. No extra steps required.

## Linked clones

When you create a linked clone desktop pool you first create a Master VM. This Master VM is the VM where you install the operating system with the most used applications (or all applications, depending on the application delivery method). You then power off this Master VM and create a snapshot. VMware Horizon admin console is then used to create the linked clone pool. You will then see that a Replica VM is created, which is a thin-provisioned full clone of the Master VM. The disk of this Replica will serve as the common read disk for all of the linked clones in the pool. The linked clone VMs will use a Delta disk to write the changes during the lifetime of the linked clone.

<img class="aligncenter wp-image-30269" src="https://svenhuisman.com/wp-content/uploads/2018/05/linked-clones-350x317.png" alt="" width="296" height="268" srcset="https://svenhuisman.com/wp-content/uploads/2018/05/linked-clones-350x317.png 350w, https://svenhuisman.com/wp-content/uploads/2018/05/linked-clones.png 429w" sizes="(max-width: 296px) 100vw, 296px" /> 

Linked clone VMs can be vMotioned to other hosts. The linked clones are dependent of the availability of the disk of the Replica VM, but this is always available on the storage, even when the host where the Replica VM is registered to is down. So there is no problem there during the 1-click upgrade process. However, Linked clone VMs do need extra attention. First of all, there are two options for logoff behavior:

  * Refresh after logoff
  * Delete after logoff

With refresh after logoff, the desktop will revert to a snapshot of the delta-disk and the VM will be available as a fresh desktop for a new user. Even new desktops can be created as long as the Replica VM is registered to a host which is not in maintenance mode or rebooting.

When the option &#8220;Delete after logoff&#8221; is selected, the desktop VM is deleted and will be recreated using the Replica VM. When this Replica VM is not available (this is the case when the Replica VM is registered to a host which is in maintenance mode or rebooting), the linked clone pool will go into error:

<img class="aligncenter wp-image-30270 size-full" src="https://svenhuisman.com/wp-content/uploads/2018/05/Composer-error.png" alt="" width="474" height="55" srcset="https://svenhuisman.com/wp-content/uploads/2018/05/Composer-error.png 474w, https://svenhuisman.com/wp-content/uploads/2018/05/Composer-error-350x41.png 350w" sizes="(max-width: 474px) 100vw, 474px" /> 

This is caused by the fact that powered-off VMs, like the Replica VM, is not migrated to another host during maintenance. When this is the case <span style="text-decoration: underline;">and</span> a new VM needs to be created, the pool will go into provisioning error.

My advice is to make sure there are enough linked clone VMs available during maintenance, temporary change &#8220;Delete after logoff&#8221; to &#8220;Refresh after logoff&#8221; and disable provisioning on the pool:

<img class="aligncenter wp-image-30271 " src="https://svenhuisman.com/wp-content/uploads/2018/05/Disable-prov-comp.png" alt="" width="558" height="161" srcset="https://svenhuisman.com/wp-content/uploads/2018/05/Disable-prov-comp.png 620w, https://svenhuisman.com/wp-content/uploads/2018/05/Disable-prov-comp-350x101.png 350w" sizes="(max-width: 558px) 100vw, 558px" /> 

## Instant clones

I don&#8217;t want to explain what an <a href="https://blogs.vmware.com/euc/2016/02/horizon-7-view-instant-clone-technology-linked-clone-just-in-time-desktop.html" target="_blank" rel="noopener">instant clone</a> is, but it is important to know how it is created. In the picture represents the creation of instant clone VMs:

<img class="aligncenter size-full wp-image-30254" src="https://svenhuisman.com/wp-content/uploads/2018/05/instant-clones.jpg" alt="" width="504" height="332" srcset="https://svenhuisman.com/wp-content/uploads/2018/05/instant-clones.jpg 504w, https://svenhuisman.com/wp-content/uploads/2018/05/instant-clones-350x231.jpg 350w" sizes="(max-width: 504px) 100vw, 504px" /> 

The Master VM is the same as with linked clones (operating system with most used applications, with a snapshot). VMware Horizon admin console is then used to create the instant clone pool. The first action that is performed on vSphere is a Template (in vSphere represented as &#8220;cp-template-&#8221; followed by a unique identifier) that is created. This is a linked-clone to the Master VM.

The next step is the creation of the Replica, which is a thin-provisioned full clone of the template VM. This Replica is the same as with linked clones, it will serve as the common read disk for all of the instant clones in the pool.

The next step is the creation of the so-called &#8220;Parent VM&#8221;. This Parent is a powered-on VM, linked to the Replica and is present on every host. The instant clone desktops are forked from this Parent VM **but are linked to the Replica after creation, not to the Parent**. And this is important to remember because it means that the Parent VMs are only needed to create the instant clones. After that, they can be deleted without affecting the instant clones.

And this is also what happens when you put a host in maintenance mode when there are instant clones on it. The instant clones will be vMotioned to other hosts in the cluster and the Parent VMs will be deleted.

<img class="aligncenter wp-image-30261 " src="https://svenhuisman.com/wp-content/uploads/2018/05/Parent-delete.png" alt="" width="599" height="83" srcset="https://svenhuisman.com/wp-content/uploads/2018/05/Parent-delete.png 978w, https://svenhuisman.com/wp-content/uploads/2018/05/Parent-delete-350x49.png 350w, https://svenhuisman.com/wp-content/uploads/2018/05/Parent-delete-768x107.png 768w, https://svenhuisman.com/wp-content/uploads/2018/05/Parent-delete-650x90.png 650w" sizes="(max-width: 599px) 100vw, 599px" /> 

Once the host is back online and a creation of a new instant clone is triggered, a new Parent VM will be created. When the Parent VM is created, new instant clone VMs can be forked on that host.

So it seems there is no problem using the Nutanix 1-click upgrade feature with instant clones. However, there is one major consideration. Because 1-click upgrade puts vSphere hosts in maintenance mode <span style="text-decoration: underline;">without</span> moving powered-off VMs, it sometimes happens that the creation of a new instant clone will fail and put the desktop pool in error. To be able to create new instant clones a Parent VM needs to be present on the host. If it&#8217;s not there (because the host has been in maintenance mode before) it needs access to the Replica VM. If the Replica VM is hosted on a host which is not available (in maintenance mode or rebooting), the Parent VM cannot be created and new instant clones can also not be created on that host:

<img class="aligncenter wp-image-30262 " src="https://svenhuisman.com/wp-content/uploads/2018/05/Cannot-create-parents.png" alt="" width="606" height="47" srcset="https://svenhuisman.com/wp-content/uploads/2018/05/Cannot-create-parents.png 1154w, https://svenhuisman.com/wp-content/uploads/2018/05/Cannot-create-parents-350x27.png 350w, https://svenhuisman.com/wp-content/uploads/2018/05/Cannot-create-parents-768x60.png 768w, https://svenhuisman.com/wp-content/uploads/2018/05/Cannot-create-parents-1024x80.png 1024w, https://svenhuisman.com/wp-content/uploads/2018/05/Cannot-create-parents-650x51.png 650w" sizes="(max-width: 606px) 100vw, 606px" /> 

You can prevent this from happening by disabling provisioning the instant clone pool(s). At least until the host with the Replica VM is patched and back online:

<img class="aligncenter wp-image-30263 size-full" src="https://svenhuisman.com/wp-content/uploads/2018/05/Disableprovisioning.png" alt="" width="608" height="187" srcset="https://svenhuisman.com/wp-content/uploads/2018/05/Disableprovisioning.png 608w, https://svenhuisman.com/wp-content/uploads/2018/05/Disableprovisioning-350x108.png 350w" sizes="(max-width: 608px) 100vw, 608px" /> 

If you have multiple instant clone pools, <span style="text-decoration: underline;">don&#8217;t be tempted to disable provisioning on the vCenter</span>, because then the parent VMs will not be deleted and the host will not go into maintenance mode:

<img class="aligncenter wp-image-30258 " src="https://svenhuisman.com/wp-content/uploads/2018/05/vCenter-disableprov.png" alt="" width="623" height="204" srcset="https://svenhuisman.com/wp-content/uploads/2018/05/vCenter-disableprov.png 1116w, https://svenhuisman.com/wp-content/uploads/2018/05/vCenter-disableprov-350x115.png 350w, https://svenhuisman.com/wp-content/uploads/2018/05/vCenter-disableprov-768x252.png 768w, https://svenhuisman.com/wp-content/uploads/2018/05/vCenter-disableprov-1024x336.png 1024w, https://svenhuisman.com/wp-content/uploads/2018/05/vCenter-disableprov-650x213.png 650w" sizes="(max-width: 623px) 100vw, 623px" /> 

Just make sure that during the maintenance window there are enough instant clone VMs available, because when a user logs off, the VM will be deleted, but not recreated when the provisioning is disabled.

## vGPU-enabled VMs

At this moment, vGPU-enabled VMs cannot be vMotioned on VMware vSphere. You can use the 1-click upgrade feature, but it will not be unattended. A couple of manual steps must be taken when patching a vSphere cluster. First, disable the vGPU-enabled pool(s) in Horizon. And second, when a host is entering maintenance mode, it will wait until all the powered on VMs are powered off. Manually (or create a script) to shut down the vGPU VMs. When all the VMs are down (except the CVM), l<span class="ph cmd">og on to the Controller VM with SSH and shut down the Controller VM with the following command:</span>

nutanix@cvm$ **cvm_shutdown -P now**

Live migration (initially it will be &#8220;suspend and resume&#8221; on vSphere) of vGPU-enabled VMs is coming, and that will make patching and upgrading even easier. Here is a video of what it will look like on vSphere:



&nbsp;

&nbsp;