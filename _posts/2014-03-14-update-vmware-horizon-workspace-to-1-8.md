---
id: 2562
title: Update VMware Horizon Workspace to 1.8
date: 2014-03-14T16:36:01+02:00
author: Sven Huisman
layout: post
guid: http://virtualfuture.info/?p=2562
permalink: /2014/03/update-vmware-horizon-workspace-to-1-8/
categories:
  - Workspace Management
---
<p lang="nl">
  Today I updated a Horizon Workspace environment to the latest version: 1.8. A couple of new features in this release, like:
</p>

  * <div lang="nl">
      Added Citrix Application support
    </div>

  * <div lang="nl">
      Enhanced VMware ThinApp support
    </div>

  * <div lang="nl">
      Enhanced VMware ThinApp package delivery to Windows desktops
    </div>

  * <div lang="nl">
      Horizon Workspace User Portal and App Center
    </div>

  * <div lang="nl">
      Web application links
    </div>

  * <div lang="nl">
      Support for enterprise branding of Horizon Workspace
    </div>

<p lang="nl">
  Read more about these new features <a title="Horizon Workspace 1.8 new features" href="http://blogs.vmware.com/horizontech/2014/03/vmware-horizon-workspace-1-8-whats-new.html" target="_blank">here</a> and in the <a title="Horizon Workspace release notes" href="Horizon Workspace 1.8 release notes: https://www.vmware.com/support/horizon_workspace/doc/hw_release_notes_18.html" target="_blank">Horizon Workspace 1.8 release notes</a>.
</p>

<p lang="nl">
  In this post, I describe the steps I took to upgrade my environment.<!--more-->The environment I updated was version Horizon Workspace 1.5. You need to know that upgrading from Horizon Workspace 1.0 to Horizon Workspace 1.8 is not supported. You must upgrade from Horizon Workspace 1.0 to Horizon Workspace 1.5 to Horizon Workspace 1.8. Read the 
  
  <a title="Horizon Workspace upgrade guide" href="http://pubs.vmware.com/horizon-workspace-18/topic/com.vmware.hw-upgrade.doc_18/GUID-5C897277-D16B-48D3-BAEB-6483BCDB7240.html" target="_blank">upgrade guide</a> for more information on the upgrade process.
</p>

<p lang="nl">
  Here are the steps I took to upgrade Horizon Workspace:
</p>

<p lang="nl">
  <strong>Upgrade Horizon Workspace</strong>
</p>

  * <div lang="nl">
      Login to the console of the configurator-va
    </div>

  * <div lang="nl">
      To check for an update run the following command: <strong>/usr/local/horizon/lib/menu/ updatemgr.hzn check</strong>
    </div>

  * <div lang="nl">
      <strong></strong><span style="line-height: 1.5em;">To install the update run the following command: </span><strong style="line-height: 1.5em;">/usr/local/horizon/lib/menu/ updatemgr.hzn update</strong>
    </div>

  * <div lang="nl">
      <strong></strong>Now take a cup of coffee (or 2 or 3), because this can take a while (it took 1,5 hour in my environment). Also take into consideration that the Horizon Workspace environment will not be available to the users during the upgrade.
    </div>

  * <div lang="nl">
      When the upgrade is finished, shutdown the vApp.
    </div>

  * <div lang="nl">
      The documentation now tells me to create the <strong>vami</strong> properties in the vApp. When I checked the properties, I noticed all the required vami properties where already created:
    </div>

<p style="text-align: center;">
  <a href="https://svenhuisman.com/wp-content/uploads/2014/03/4.png"><img class="aligncenter size-medium wp-image-2568" alt="VAMI properties" src="https://svenhuisman.com/wp-content/uploads/2014/03/4-350x240.png" width="350" height="240" srcset="https://svenhuisman.com/wp-content/uploads/2014/03/4-350x240.png 350w, https://svenhuisman.com/wp-content/uploads/2014/03/4.png 659w" sizes="(max-width: 350px) 100vw, 350px" /></a>
</p>

  * <div lang="nl">
      The required vm.ip and vm.vmname properties on each virtual machine where also already configured:
    </div>

[<img class="size-medium wp-image-2569 aligncenter" alt="5" src="https://svenhuisman.com/wp-content/uploads/2014/03/5-350x108.png" width="350" height="108" srcset="https://svenhuisman.com/wp-content/uploads/2014/03/5-350x108.png 350w, https://svenhuisman.com/wp-content/uploads/2014/03/5.png 465w" sizes="(max-width: 350px) 100vw, 350px" />](https://svenhuisman.com/wp-content/uploads/2014/03/5.png)

  * 
  * <div lang="nl">
      When the upgrade is finished, run the libreoffice-installer.sh script on each data-va virtual machine in your deployment to upgrade from LibreOffice 3.5.6 to LibreOffice 4.0.2. From the console of the data-va, run this command: /opt/zimbra/libexec/libreoffice-installer.sh
    </div>

[<img class="aligncenter size-medium wp-image-2566" alt="2b" src="https://svenhuisman.com/wp-content/uploads/2014/03/2b-350x38.png" width="350" height="38" srcset="https://svenhuisman.com/wp-content/uploads/2014/03/2b-350x38.png 350w, https://svenhuisman.com/wp-content/uploads/2014/03/2b.png 727w" sizes="(max-width: 350px) 100vw, 350px" />](https://svenhuisman.com/wp-content/uploads/2014/03/2b.png)

<p lang="nl">
  If necessary, you can add a buffer disk, update VMware Tools, and migrate LDAP user entitlements from the data-va Virtual Machine to the service-va Virtual Machine.
</p>

<p lang="nl">
  <strong>Migrate LDAP user entitlements for the data-va to the service-va</strong>
</p>

<p lang="nl">
  For Horizon Workspace 1.8, LDAP user entitlements move from the data-va virtual machine to the service-va virtual machine. Horizon Workspace 1.8 requires that you migrate LDAP user entitlements to the service-va virtual machine to successfully complete the upgrade.
</p>

  * <div lang="nl">
      Take a snapshot of the vApp to back it up.
    </div>

<li lang="nl">
  Turn on maintenance mode for all the data-va virtual machines. Go to https://<configurator-va>/cfg/system
</li>

<li lang="nl">
  Turn on maintenance mode for all service-va virtual machines <strong>except</strong> the main service-va virtual machine. In my case, I only have one service-va, so I did not put that one in maintenance.
</li>

<p lang="nl">
  After you turn maintenance mode on, you must wait at least two minutes for the changes to occur on the gateway-va virtual machines.
</p>

<ul type="disc">
  <li lang="nl">
    Go to https://<connector-va:8443/
  </li>
  <li lang="nl">
    Enter the admin password
  </li>
  <li lang="nl">
    Go to: Directory Sync. Change the scheduling frequency to Manual.
  </li>
</ul>

<p lang="nl" style="text-align: center;">
  <a href="https://svenhuisman.com/wp-content/uploads/2014/03/7.png"><img class="size-medium wp-image-2571 aligncenter" alt="7" src="https://svenhuisman.com/wp-content/uploads/2014/03/7-350x234.png" width="350" height="234" srcset="https://svenhuisman.com/wp-content/uploads/2014/03/7-350x234.png 350w, https://svenhuisman.com/wp-content/uploads/2014/03/7.png 753w" sizes="(max-width: 350px) 100vw, 350px" /></a>
</p>

<ul type="disc">
  <li lang="nl">
    Use ssh to connect to the (master) data-va virtual machine running OpenLDAP.
  </li>
  <li lang="nl">
    Change to the Zimbra user: <strong>su &#8211; zimbra</strong>
  </li>
  <li lang="nl">
    Run the LDAP migration script: <strong>alwayson-ldap-migration</strong>
  </li>
  <li lang="nl">
    The documentation tells me to turn maintenance mode off for the service-va virtual machines and data-va virtual machines, but the maintenance mode was already off after the migration.
  </li>
</ul>

<p lang="nl">
  The next step is to add or resize a disk to the gateway-va for buffering files. The gateway-va virtual machine buffers client requests before sending them to the data-va virtual machine. Large files that are waiting to upload are temporarily stored on this disk. Depending on the upload size limit set for your environment, the space on the buffer disk can easily exceed the maximum limit. In my environment, I choose not to adjust the disk-size.
</p>

<p lang="nl">
  <strong>Update connector configurator settings</strong>
</p>

<p lang="nl">
  Horizon Workspace creates a default user store for you during the upgrade process. Each user store has a sync client that you select for syncing users and groups to Horizon Workspace. After an upgrade, you must update the sync client and verify the user authentication identity provider.
</p>

  * <div lang="nl">
      Log in to the Administrator Web interface.
    </div>

  * <div lang="nl">
      Select Settings > User Stores.
    </div>

  * <div lang="nl">
      Click Edit for the user store you want to configure.
    </div>

  * <div lang="nl">
      Edit the user store settings.
    </div>

[<img class="aligncenter size-medium wp-image-2574" alt="10" src="https://svenhuisman.com/wp-content/uploads/2014/03/10-350x202.png" width="350" height="202" srcset="https://svenhuisman.com/wp-content/uploads/2014/03/10-350x202.png 350w, https://svenhuisman.com/wp-content/uploads/2014/03/10.png 795w" sizes="(max-width: 350px) 100vw, 350px" />](https://svenhuisman.com/wp-content/uploads/2014/03/10.png)

<p lang="nl">
  During the upgrade, the user authentication identity provider is selected. Verify that the correct identity provider was selected. If you want to use a different identity provider, you can select a different one.
</p>

<p lang="nl">
  <strong>Configure SSO for Desktop Clients</strong>
</p>

<p lang="nl">
  To configure Horizon Workspace to use single sign-on by default from the Desktop clients, you must add a new parameter to the runtime-config.properties file on the service-va virtual machine. Otherwise, end users must log in to access the user portal first.
</p>

  * <div lang="nl">
      Log in to the service-va virtual machine as administrator.
    </div>

  * <div lang="nl">
      Open the runtime-config.properties file: <strong>viconfig.properties</strong>
    </div>

<img class="aligncenter size-medium wp-image-2576" alt="12" src="https://svenhuisman.com/wp-content/uploads/2014/03/12-350x15.png" width="350" height="15" srcset="https://svenhuisman.com/wp-content/uploads/2014/03/12-350x15.png 350w, https://svenhuisman.com/wp-content/uploads/2014/03/12.png 605w" sizes="(max-width: 350px) 100vw, 350px" /> 

  * <div lang="nl">
      Add the apply.login.ota=true parameter to the runtime-config.properties file.
    </div>

[<img class="aligncenter size-medium wp-image-2577" alt="13" src="https://svenhuisman.com/wp-content/uploads/2014/03/13-350x71.png" width="350" height="71" srcset="https://svenhuisman.com/wp-content/uploads/2014/03/13-350x71.png 350w, https://svenhuisman.com/wp-content/uploads/2014/03/13.png 737w" sizes="(max-width: 350px) 100vw, 350px" />](https://svenhuisman.com/wp-content/uploads/2014/03/13.png)

  * <div lang="nl">
      Run the restart command to restart the service-va virtual machine: /<strong>etc/init.d/horizon-frontend restart</strong>
    </div>

[<img class="aligncenter size-medium wp-image-2578" alt="14" src="https://svenhuisman.com/wp-content/uploads/2014/03/14-350x161.png" width="350" height="161" srcset="https://svenhuisman.com/wp-content/uploads/2014/03/14-350x161.png 350w, https://svenhuisman.com/wp-content/uploads/2014/03/14.png 751w" sizes="(max-width: 350px) 100vw, 350px" />](https://svenhuisman.com/wp-content/uploads/2014/03/14.png)

<p lang="nl">
  End users can now use single sign-on to log in to Horizon Workspace.
</p>

<p lang="nl">
  <strong>Add Desktop Client Installer Files to data-va Virtual Machines</strong>
</p>

<p lang="nl">
  When new versions of the Desktop clients are released, you copy and install a zip file that includes the Desktop client files for Windows and Mac computers from the VMware Downloads page to each data-va virtual machine that is configured. You run the check-client-updates command on each data-va virtual machine to deploy the installer files and restart the data-va virtual machines.
</p>

<p lang="nl">
  Note: Schedule adding these installer files to the data-va servers to run during a maintenance window since the data-va virtual machine is restarted and this might interrupt user access.
</p>

<ul type="disc">
  <li lang="nl">
    Download the Horizon Workspace Desktop client zip file from the VMware Web site <a href="https://my.vmware.com/web/vmware/downloads">https://my.vmware.com/web/vmware/downloads</a>
  </li>
  <li lang="nl">
    Enable SSH login access for root: <strong><a href="https://blogs.vmware.com/horizontech/2013/03/how-to-enable-ssh-in-horizon-workspace-virtual-appliances.html">https://blogs.vmware.com/horizontech/2013/03/how-to-enable-ssh-in-horizon-workspace-virtual-appliances.html</a></strong>
  </li>
  <li lang="nl">
    Copy the zip file to a temporary location on the data-va virtual machine: scp clients-n.n.n-nnnnnnn.zip root@yourDataServer.com:/tmp/
  </li>
  <li lang="nl">
    Log in to the data-va machine as the root user.
  </li>
  <li lang="nl">
    Unzip and install the new clients to the Downloads directory: /opt/vmware-hdva-installer/bin/check-client-updates.pl &#8211;install &#8211;clientfile /tmp/clients.X.X.X-XXXXX.zip
  </li>
</ul>

&nbsp;

<p lang="nl">
  <img class="aligncenter size-medium wp-image-2582" alt="18" src="https://svenhuisman.com/wp-content/uploads/2014/03/18-350x114.png" width="350" height="114" srcset="https://svenhuisman.com/wp-content/uploads/2014/03/18-350x114.png 350w, https://svenhuisman.com/wp-content/uploads/2014/03/18.png 763w" sizes="(max-width: 350px) 100vw, 350px" />
</p>

<p lang="nl">
  This script automatically unzips the file and copies the Desktop clients installer files for Windows and for Mac computers to the /opt/zimbra/jetty/webapps/zimbra/downloads directory, automatic updates to the /opt/zimbra/jetty/webapps/zimbra//public/cds directory, updates the URL parameter value for the downloads link, and restarts the data-va virtual machine.
</p>

  * <div lang="nl">
      Repeat these steps on each data-va virtual machine in your environment.
    </div>

<p lang="nl">
  The Horizon Workspace agent will automatically be updated on the clients (users require administrator rights to update):
</p>

<p lang="nl">
  <img class="aligncenter size-full wp-image-2583" alt="update" src="https://svenhuisman.com/wp-content/uploads/2014/03/update.png" width="318" height="160" />
</p>

<p lang="nl">
  When users now login to the Horizon Workspace portal, they will be prompted to start a tour of the new features:
</p>

<p lang="nl" style="text-align: center;">
  <a href="https://svenhuisman.com/wp-content/uploads/2014/03/16.png"><img class="aligncenter  wp-image-2580" style="width: 351px; height: 240px;" alt="16" src="https://svenhuisman.com/wp-content/uploads/2014/03/16-350x232.png" width="350" height="232" srcset="https://svenhuisman.com/wp-content/uploads/2014/03/16-350x232.png 350w, https://svenhuisman.com/wp-content/uploads/2014/03/16.png 970w" sizes="(max-width: 350px) 100vw, 350px" /></a>
</p>

<p lang="nl">
  When logged in, the users will notice a different look of the Horizon Workspace portal. Applications and desktops are now on one page, and users can move the icons around. The Horizon data is accessible with the Horizon Files app:
</p>

<p lang="nl">
  <a href="https://svenhuisman.com/wp-content/uploads/2014/03/17.png"><img class="aligncenter size-medium wp-image-2581" alt="17" src="https://svenhuisman.com/wp-content/uploads/2014/03/17-350x195.png" width="350" height="195" srcset="https://svenhuisman.com/wp-content/uploads/2014/03/17-350x195.png 350w, https://svenhuisman.com/wp-content/uploads/2014/03/17.png 972w" sizes="(max-width: 350px) 100vw, 350px" /></a>
</p>

<p lang="nl">
  So far my update experience.
</p>