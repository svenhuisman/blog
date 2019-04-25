---
id: 28
title: VMware Thinapp RC review
date: 2008-06-10T14:21:30+02:00
author: Sven Huisman
layout: post
guid: https://svenhuisman.com/?p=28
permalink: /2008/06/vmware-thinapp-rc-review/
comment_count:
  - "3"
trackback_count:
  - "3"
categories:
  - Virtual Applications
tags:
  - Application Virtualization
  - Installfree
  - Project Northstar
  - review
  - Thinapp
  - thinstall
  - VMware
---
After having seen the <a title="InstallFree" href="https://www.installfree.com" target="_blank">Installfree</a> demo <a title="CDG TUE5" href="https://svenhuisman.com/?p=10" target="_blank">last week</a>, I decided to take a look at VMware&#8217;s <a title="Thinapp beta" href="https://communities.vmware.com/community/beta/northstar" target="_blank">Thinapp Release Candidate</a>, a.k.a Project Northstar. Features in the latest release are:

  * **Application Link**: allows administrators to dynamically link ThinApp packages to one another, making it possible to create separate packages for interdependent components (such as Java or .NET) and use them across multiple ThinApp packages.
  * **Application Sync**: allows customers to execute updates to virtual applications through a secure Internet connection, increasing application portability while reducing security and patch risks to offline and out-of-network machines.

<a title="Release notes" href="https://www.vmware.com/products/beta/northstar/releasenotes_northstar.html" target="_blank">Release notes</a>  
<a title="User manual" href="https://pubs.vmware.com/thinapp/help/wwhelp/wwhimpl/js/html/wwhelp.htm?&accessible=true" target="_blank">Manual</a>

After registering for the release candidate, <!--more-->I downloaded the installer. While downloading the installer (only 7 MB) I had plenty of time reading the manual ;-). Before you begin using this product, you might want to ask, what is Thinapp?

> _VMware ThinApp enables you to package, run, and manage your software applications. ThinApp captures the installation of an application into a single executable file and enables you to install your captured application with no dependencies on the host personal computer (PC)._

OK, you put an application into a single executable file and distribute this to your clients and the client PC&#8217;s stay clean. So no application conflicts and easy distributing because it&#8217;s just a single file. Now let&#8217;s get started.

This review is devided in the following sections:

  1. Installation
  2. Capturing an application
  3. Stream the application
  4. Other options
  5. Conclusion

**1. Installation**

 The installation was easy. It really was a &#8220;next-next-finish&#8221; installation. The installer installs the **_Setup Capture_**. With this tool you capture the installation sequence of an application and create the executable which also contains the Thinapp client. You don&#8217;t need to install a Thinapp server, from which the applications are distributed, this can be done from any type of network share.

**2. Capturing an application**

It is recommended to use a clean PC to capture applications. VMware obviously suggests to use a virtual machine for this. When you start **_Setup Capture_**, make sure to start it from a network share. This way, no changes made by the Thinapp tool itself are captured.

&#8211; Start Setup Capture from a network share. The Welcome screen will appear.  
[<img class="alignnone size-medium wp-image-33" title="thinappcapt1" src="https://svenhuisman.com/wp-content/uploads/2008/06/thinappcapt1-300x251.jpg" alt="" width="300" height="251" srcset="https://svenhuisman.com/wp-content/uploads/2008/06/thinappcapt1-300x251.jpg 300w, https://svenhuisman.com/wp-content/uploads/2008/06/thinappcapt1.jpg 486w" sizes="(max-width: 300px) 100vw, 300px" />](https://svenhuisman.com/wp-content/uploads/2008/06/thinappcapt1.jpg)

&#8211; After clicking Next, the following screen is shown:  
[<img class="alignnone size-medium wp-image-39" title="thinappcapt2" src="https://svenhuisman.com/wp-content/uploads/2008/06/thinappcapt2-300x251.jpg" alt="" width="300" height="251" srcset="https://svenhuisman.com/wp-content/uploads/2008/06/thinappcapt2-300x251.jpg 300w, https://svenhuisman.com/wp-content/uploads/2008/06/thinappcapt2.jpg 486w" sizes="(max-width: 300px) 100vw, 300px" />](https://svenhuisman.com/wp-content/uploads/2008/06/thinappcapt2.jpg)

&#8211; Select to Enable advanced scan configuration and click Next. Then the following scan options are presented:  
[<img class="alignnone size-medium wp-image-40" title="thinappcapt3" src="https://svenhuisman.com/wp-content/uploads/2008/06/thinappcapt3-300x251.jpg" alt="" width="300" height="251" srcset="https://svenhuisman.com/wp-content/uploads/2008/06/thinappcapt3-300x251.jpg 300w, https://svenhuisman.com/wp-content/uploads/2008/06/thinappcapt3.jpg 486w" sizes="(max-width: 300px) 100vw, 300px" />](https://svenhuisman.com/wp-content/uploads/2008/06/thinappcapt3.jpg)

 &#8211; These settings are OK to me. Click on Next. The Pre-scan will start:  
[<img class="alignnone size-medium wp-image-41" title="thinappcapt4" src="https://svenhuisman.com/wp-content/uploads/2008/06/thinappcapt4-300x251.jpg" alt="" width="300" height="251" srcset="https://svenhuisman.com/wp-content/uploads/2008/06/thinappcapt4-300x251.jpg 300w, https://svenhuisman.com/wp-content/uploads/2008/06/thinappcapt4.jpg 486w" sizes="(max-width: 300px) 100vw, 300px" />](https://svenhuisman.com/wp-content/uploads/2008/06/thinappcapt4.jpg)

&#8211; After the Pre-scan is finished, you can install your application:  
[<img class="alignnone size-medium wp-image-42" title="thinappcapt5" src="https://svenhuisman.com/wp-content/uploads/2008/06/thinappcapt5-300x251.jpg" alt="" width="300" height="251" srcset="https://svenhuisman.com/wp-content/uploads/2008/06/thinappcapt5-300x251.jpg 300w, https://svenhuisman.com/wp-content/uploads/2008/06/thinappcapt5.jpg 486w" sizes="(max-width: 300px) 100vw, 300px" />](https://svenhuisman.com/wp-content/uploads/2008/06/thinappcapt5.jpg)

&#8211; In this example, I installed Firefox 2.0.0.14. After the installation was finished, I clicked on Next and the Post-scan began:  
[<img class="alignnone size-medium wp-image-43" title="thinappcapt6" src="https://svenhuisman.com/wp-content/uploads/2008/06/thinappcapt6-300x251.jpg" alt="" width="300" height="251" srcset="https://svenhuisman.com/wp-content/uploads/2008/06/thinappcapt6-300x251.jpg 300w, https://svenhuisman.com/wp-content/uploads/2008/06/thinappcapt6.jpg 486w" sizes="(max-width: 300px) 100vw, 300px" />](https://svenhuisman.com/wp-content/uploads/2008/06/thinappcapt6.jpg)

&#8211; When the scan finished, I was presented a screen with a list of executables. I deselected Mozilla Firefox (Safe mode) so that only the Mozilla Firefox.exe was selected:  
[<img class="alignnone size-medium wp-image-44" title="thinappcapt7" src="https://svenhuisman.com/wp-content/uploads/2008/06/thinappcapt7-300x251.jpg" alt="" width="300" height="251" srcset="https://svenhuisman.com/wp-content/uploads/2008/06/thinappcapt7-300x251.jpg 300w, https://svenhuisman.com/wp-content/uploads/2008/06/thinappcapt7.jpg 486w" sizes="(max-width: 300px) 100vw, 300px" />](https://svenhuisman.com/wp-content/uploads/2008/06/thinappcapt7.jpg)

&#8211; Next, you can add Active Directory group names to set permissions on the application. At build time ThinApp converts the Active Directory group names into SID values. This means that you have to be connected to the domain (or use cached credentials). And when you delete a group and recreate it, you&#8217;ll have to rebuild the package. You can also set the sandbox location. The sandbox holds runtime modifications that applications make as they are running. Normally, this will be in the user&#8217;s profile, but you can also select USB (when the application is run from USB, the executable and the modifications are stored in the same location) or network drive (this personal drive on the network will have to be available to the user, for example by login-script).  
[<img class="alignnone size-medium wp-image-45" title="thinappcapt8" src="https://svenhuisman.com/wp-content/uploads/2008/06/thinappcapt8-300x251.jpg" alt="" width="300" height="251" srcset="https://svenhuisman.com/wp-content/uploads/2008/06/thinappcapt8-300x251.jpg 300w, https://svenhuisman.com/wp-content/uploads/2008/06/thinappcapt8.jpg 486w" sizes="(max-width: 300px) 100vw, 300px" />](https://svenhuisman.com/wp-content/uploads/2008/06/thinappcapt8.jpg)

&#8211; After clicking Next, you can set the project location. You can also choose to build a MSI package and if you want to use compression. ThinApp supports two compression models: None and Fast.  
**None**—None is the default when capturing a package. This option is useful for building your application quickly for testing purposes. No compression also improves application startup time on older PCs, or when the application is launched multiple times. On subsequent executions of the same application, the Windows disk cache can provide data faster without compression enabled.  
**Fast**—This option is recommend for most packages. Fast compression has a very fast rate of decompression, so it has very little impact on application startup time; it also has very little impact on memory consumption at runtime. Fast compression achieves similar compression ratios as the ZIP algorithm.  
[](https://svenhuisman.com/wp-content/uploads/2008/06/thinappcapt9.jpg)[<img class="alignnone size-medium wp-image-50" title="thinappcapt9a" src="https://svenhuisman.com/wp-content/uploads/2008/06/thinappcapt9a-300x251.jpg" alt="" width="300" height="251" srcset="https://svenhuisman.com/wp-content/uploads/2008/06/thinappcapt9a-300x251.jpg 300w, https://svenhuisman.com/wp-content/uploads/2008/06/thinappcapt9a.jpg 486w" sizes="(max-width: 300px) 100vw, 300px" />](https://svenhuisman.com/wp-content/uploads/2008/06/thinappcapt9a.jpg)

-Next you will have to choose the isolation mode. The screen is pretty self-explanatory, and for more information, you should read the manual 🙂  
[<img class="alignnone size-medium wp-image-34" title="thinappcapt10" src="https://svenhuisman.com/wp-content/uploads/2008/06/thinappcapt10-300x251.jpg" alt="" width="300" height="251" srcset="https://svenhuisman.com/wp-content/uploads/2008/06/thinappcapt10-300x251.jpg 300w, https://svenhuisman.com/wp-content/uploads/2008/06/thinappcapt10.jpg 486w" sizes="(max-width: 300px) 100vw, 300px" />](https://svenhuisman.com/wp-content/uploads/2008/06/thinappcapt10.jpg)

&#8211; After this, the capture is saved in the project directory.  
[<img class="alignnone size-medium wp-image-35" title="thinappcapt11" src="https://svenhuisman.com/wp-content/uploads/2008/06/thinappcapt11-300x251.jpg" alt="" width="300" height="251" srcset="https://svenhuisman.com/wp-content/uploads/2008/06/thinappcapt11-300x251.jpg 300w, https://svenhuisman.com/wp-content/uploads/2008/06/thinappcapt11.jpg 486w" sizes="(max-width: 300px) 100vw, 300px" />](https://svenhuisman.com/wp-content/uploads/2008/06/thinappcapt11.jpg)

&#8211; When the capture is saved, you get 2 options:  
Browse Project (this will open explorer to the project directory)  
Build Now (this will build the application)  
[<img class="alignnone size-medium wp-image-37" title="thinappcapt13" src="https://svenhuisman.com/wp-content/uploads/2008/06/thinappcapt13-300x251.jpg" alt="" width="300" height="251" srcset="https://svenhuisman.com/wp-content/uploads/2008/06/thinappcapt13-300x251.jpg 300w, https://svenhuisman.com/wp-content/uploads/2008/06/thinappcapt13.jpg 486w" sizes="(max-width: 300px) 100vw, 300px" />](https://svenhuisman.com/wp-content/uploads/2008/06/thinappcapt13.jpg)

FINISHED!  
[<img class="alignnone size-medium wp-image-38" title="thinappcapt14" src="https://svenhuisman.com/wp-content/uploads/2008/06/thinappcapt14-300x251.jpg" alt="" width="300" height="251" srcset="https://svenhuisman.com/wp-content/uploads/2008/06/thinappcapt14-300x251.jpg 300w, https://svenhuisman.com/wp-content/uploads/2008/06/thinappcapt14.jpg 486w" sizes="(max-width: 300px) 100vw, 300px" />](https://svenhuisman.com/wp-content/uploads/2008/06/thinappcapt14.jpg)

**3. Stream the application**

 Now that we have build a Thinapp application, we are ready to stream it to our clients. Any network storage device can serve as a streaming server for hundreds or thousands of client PCs. To use ThinApp packages in a streaming fashion, place your ThinApp package in a location that is accessible to client PCs, and send a link to end users to run the application directly.  
Block-Based Streaming shows how block-based streaming is used to communicate over a network share.  
_Block-Based Streaming_

[<img class="alignnone size-medium wp-image-51" title="deploy_7_2_11" src="https://svenhuisman.com/wp-content/uploads/2008/06/deploy_7_2_11-300x202.jpg" alt="" width="300" height="202" srcset="https://svenhuisman.com/wp-content/uploads/2008/06/deploy_7_2_11-300x202.jpg 300w, https://svenhuisman.com/wp-content/uploads/2008/06/deploy_7_2_11.jpg 423w" sizes="(max-width: 300px) 100vw, 300px" />](https://svenhuisman.com/wp-content/uploads/2008/06/deploy_7_2_11.jpg)

On the end user’s desktop, you can also create shortcuts that point to the centrally hosted executable package(s). When the user clicks on the shortcut, the application automatically begins streaming to the client PC. During the initial streaming startup process, the ThinApp status bar informs the user of the progress.  
After enough of the application is streamed that the application can begin running, the status bar slides down and the user can begin using the application. As more parts of the application are required by the application, they are pulled from the streaming server.

This icon will popup when you start a Thinapp application:  
[<img class="alignnone size-medium wp-image-31" title="thinaaplaunch1" src="https://svenhuisman.com/wp-content/uploads/2008/06/thinaaplaunch1.jpg" alt="" width="245" height="61" />](https://svenhuisman.com/wp-content/uploads/2008/06/thinaaplaunch1.jpg)

**4. Other options**

So far for the GUI. All the other settings or adjustments you want to make, you will have to do in configuration files. The most important file is _package.ini_. These options are set in this file:

• General Options  
• Access Control  
• Application-Specific  
• Application Link  
• Application Sync  
• Isolation and Virtualization Granularity  
• MSI Generation  
• Sandbox Control

I will explain the 2 new features: Application Link and Application Sync:

**Application Link**

You can use the Application Link feature in the package.ini file to configure relationships between applications you have packaged with ThinApp. Following are several examples:  
• You can link runtime components to the applications that use them. For example, you can link a package containing the Java runtime environment (JRE) or ODBC drivers to a package containing a browser application.

• You can link add-ons and plug-ins to applications. For example, Microsoft Office add-ons can be linked to applications or Adobe PhotoShop plug-ins can be linked to a package containing PhotoShop.

• You can link packaged applications to service packs. By using Application Link, you can upgrade or roll back your service packs by changing the service pack that you capture and link to its parent application.

**Application Sync**

Application Sync enables you to automatically keep deployed virtual applications up to date. When an application starts up, Application Sync can query a Web server to see if an updated version of the package is available. If an update is available, the differences between the existing package and the new package will be downloaded and used to construct an updated version of the package. The updated package will be used for future deployments.  
Application Sync can be used to do the following:  
• Distribute runtime components separately from the applications that use them. For example, the Java Runtime Environment (JRE) or ODBC drivers.

• Link add-ons and plug-ins to applications. For example, Microsoft Office add-ons or Adobe Photoshop plug-ins can be linked using Application Sync.

• Apply layered service packs to your applications. Application Sync enables you to distribute service packs and roll back to previous versions, if necessary.

 There is a tool that can help you edit package.ini and attributes.ini with a GUI. It&#8217;s called <a title="Thinstallhelper" href="https://thinstallhelper.cis-group.nl/" target="_blank">Thinstallhelper</a> and it&#8217;s from <a title="Cis-group" href="https://www.cis-group.nl/" target="_blank">CIS-group</a>. It should still work with Thinapp. Download it <a title="Download link for Thinstall helper" href="https://thinstallhelper.cis-group.nl/download.php?AppName=ThinstallHelper" target="_blank">here</a>.

**5. Conclusion**

To conclude this mini-(p)review of VMware Thinapp, here are my (pre-)final thoughts:

Pro:

  * Easy installation
  * Easy capturing applications
  * Agentless
  * Application Link
  * Application Sync

Con:

  * You need a clean PC to capture applications
  * Important settings needs to be done by editing files
  * Distribtion of application is too basic. There is no management interface to manage who get&#8217;s what applications.
  * There is no auditing for application use.