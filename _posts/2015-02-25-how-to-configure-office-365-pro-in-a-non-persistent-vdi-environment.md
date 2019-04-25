---
id: 3593
title: How-to configure Office 365 Pro in a non-persistent VDI environment
date: 2015-02-25T16:00:32+02:00
author: Sven Huisman
layout: post
guid: http://virtualfuture.info/?p=3593
permalink: /2015/02/how-to-configure-office-365-pro-in-a-non-persistent-vdi-environment/
categories:
  - Virtual Desktop
tags:
  - Horizon
  - Office365
  - VDI
  - View
  - VMware
---
I’m currently implementing a VMware Horizon View environment with Windows 8.1 non-persistent desktops. The customer has Office 365 licenses for the users and has no right to use a KMS license activation server for Office 2013. Activation of Office 365 Pro is done by the user:

  1. The Office 365 administrator assigns an Office 365 license to the user.
  2. User installs Office 365 Pro or logs on to a computer where Office 365 Pro is installed.
  3. User starts an Office 365 Pro application, Word or Outlook for example.
  4. User needs to activate Office. [<img class="  wp-image-3594 aligncenter" src="https://svenhuisman.com/wp-content/uploads/2015/02/Activate.png" alt="Activate" width="252" height="307" srcset="https://svenhuisman.com/wp-content/uploads/2015/02/Activate.png 479w, https://svenhuisman.com/wp-content/uploads/2015/02/Activate-287x350.png 287w" sizes="(max-width: 252px) 100vw, 252px" />](https://svenhuisman.com/wp-content/uploads/2015/02/Activate.png)
  5. User enters the Office 365 credentials to login to Office 365.
  6. A license token is assigned to the user on that computer. The user can use the Office applications on that computer. The license is checked once a month, so an internet connection is required for that computer.
  7. **The user can activate Office on maximum 5 computers.**

With non-persistent virtual desktops, that’s a different story. The user will need to activate Office each time the user logs on to a virtual desktop, because each time it will be a different (and refreshed) desktop. The user would use their 5 devices activations very fast. Fortunately, Microsoft has a solution for this problem. You can enable “shared computer activation” during the installation of Office. When a user activates Office on a shared computer, the license doesn’t count for the maximum of 5 machines. This is the &#8220;official&#8221; Microsoft statement (<a title="Technet Article Office 365" href="https://technet.microsoft.com/en-us/library/dn782860(v=office.15).aspx" target="_blank">Technet article</a>):

> _Activation limits Normally, users can install and activate Office 365 ProPlus only on up to five computers. Using Office 365 ProPlus with shared computer activation enabled doesn’t count against the five computer limit. Microsoft allows a single user to activate Office 365 ProPlus on a <span style="text-decoration: underline;">reasonable number of shared computers</span> in a given time period. The user gets an error message in the unlikely event the limit is exceeded._

**How to install Office 365 Pro in shared computer mode**

To enable shared computer activation when you deploy Office 365 ProPlus, you need the following:

  * The current version of the Office Deployment Tool, which is available from the Microsoft Download Center.
  * At least version 15.0.4631.1002 of Office 365 ProPlus, which was released in July 2014.

Once you have downloaded the Office Deployment Tool, you need to edit the configuration file to enable shared computer licensing. The configuration file could then look like this:

> <pre>&lt;Configuration&gt; 
 &lt;Add SourcePath="\\server\Office15" OfficeClientEdition="32"&gt; 
 &lt;Product ID="O365ProPlusRetail" &gt; 
 &lt;Language ID="en-us" /&gt; 
 &lt;/Product&gt; 
 &lt;/Add&gt;
<strong>&lt;Display Level="None" AcceptEULA="True" /&gt; </strong>
<strong>&lt;Property Name="SharedComputerLicensing" Value="1" /&gt;</strong>
&lt;/Configuration&gt;</pre>

More information about the configuration file can be found <a title="configuration.xml" href="https://technet.microsoft.com/en-us/library/jj219426.aspx" target="_blank">here</a>.

Next is to download Office 365 Pro to the network-share. This is done by using the &#8220;/Download&#8221; parameter:

> \\server\Office15\setup.exe /download \\server\Office15\configuration.xml

After the download is complete, use the &#8220;/configure&#8221; parameter to install Office 365 Pro in the golden image:

> \\server\Office15\setup.exe /configure \\server\Office15\configuration.xml

After Office 365 Pro is installed you can finalize the golden image to create your desktop-pool.

**Office 365 Pro on a shared computer**

Here’s what happens after Office 365 ProPlus is installed on a computer that has shared computer activation enabled.

  1. A user logs on to a virtual desktop with his/her domain credentials.
  2. The user starts an Office 365 ProPlus application, such as Word.
  3. Office 365 ProPlus contacts the Office Licensing Service on the Internet to obtain a licensing token for the user. The user needs to enter their Office 365 credentials to activate. If the user is licensed for Office 365 ProPlus, a licensing token is stored on the computer in the user&#8217;s profile folder, and Office 365 ProPlus is activated. The user can now use Office 365 ProPlus.
  4. These steps are repeated for each user who logs on to the shared computer. Each user gets a unique licensing token. Just because one user activates Office 365 ProPlus on the computer doesn’t mean Office 365 ProPlus is activated for all other users who log on to the computer. If a user goes to another computer that also is enabled for shared computer activation, the same steps occur. There is a different licensing token for each computer that the user logs on to.

So far so good. One challenge is that the user needs to enter their Office 365 account credentials to activate Office and the user needs to do that each time he logs on to a virtual desktop, because it will be a new virtual desktop each time. You can solve this by implement ADFS and enabling SSO for Office 365. I will not go deep-dive on this, but these are the steps you need to take:

  1. Sync active directory with Office 365.
  2. Make sure the user UPN in Active Directory is the external address (i.e. when AD domain is company.local, make sure the UPN is user@<span style="text-decoration: underline;">company.com</span>)
  3. Implement ADFS so users can use single sign on to Office 365 with their logged on credentials.
  4. Configure GPO so users will automatically authenticate with federated credentials:[<img class="aligncenter  wp-image-3595" src="https://svenhuisman.com/wp-content/uploads/2015/02/activateGPO.png" alt="activateGPO" width="537" height="383" srcset="https://svenhuisman.com/wp-content/uploads/2015/02/activateGPO.png 800w, https://svenhuisman.com/wp-content/uploads/2015/02/activateGPO-350x250.png 350w, https://svenhuisman.com/wp-content/uploads/2015/02/activateGPO-650x464.png 650w" sizes="(max-width: 537px) 100vw, 537px" />](https://svenhuisman.com/wp-content/uploads/2015/02/activateGPO.png)
  5. Add ADFS proxy address to local sites in IE and edit the policy so users will log on with logged on credentials (can also be done with group policy):[<img class="aligncenter size-full wp-image-3596" src="https://svenhuisman.com/wp-content/uploads/2015/02/localintranet.png" alt="localintranet" width="395" height="351" srcset="https://svenhuisman.com/wp-content/uploads/2015/02/localintranet.png 395w, https://svenhuisman.com/wp-content/uploads/2015/02/localintranet-350x311.png 350w" sizes="(max-width: 395px) 100vw, 395px" />](https://svenhuisman.com/wp-content/uploads/2015/02/localintranet.png)[<img class="aligncenter size-full wp-image-3597" src="https://svenhuisman.com/wp-content/uploads/2015/02/logon.png" alt="logon" width="419" height="471" srcset="https://svenhuisman.com/wp-content/uploads/2015/02/logon.png 419w, https://svenhuisman.com/wp-content/uploads/2015/02/logon-311x350.png 311w" sizes="(max-width: 419px) 100vw, 419px" />](https://svenhuisman.com/wp-content/uploads/2015/02/logon.png)
  6. One other issue I had was that the EULA message keeps appearing for the user. To get around this issue, add the following regkey to the user:

> _[HKEY\_CURRENT\_USER\Software\Policies\Microsoft\Office\15.0\Registration]_  
> _&#8220;AcceptAllEulas&#8221;=dword:00000001_

For more information about Office 365 shared computer licensing go to this <a title="Office 365 shared computer licensing" href="https://technet.microsoft.com/en-us/library/dn782860(v=office.15).aspx" target="_blank">link</a>.