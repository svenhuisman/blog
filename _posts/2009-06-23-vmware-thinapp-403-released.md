---
id: 1258
title: VMware ThinApp 4.0.3 released
date: 2009-06-23T21:57:36+02:00
author: Sven Huisman
layout: post
guid: https://svenhuisman.com/?p=1258
permalink: /2009/06/vmware-thinapp-403-released/
categories:
  - Virtual Applications
tags:
  - Application Virtualization
  - Thinapp
  - VMware
---
Last week, VMware released a minor update for <a title="VMware ThinApp 4.0.3" href="http://www.vmware.com/support/thinapp4/doc/releasenotes_thinapp403.html" target="_blank">VMware ThinApp: 4.0.3</a>. Here are the release notes:

## _What&#8217;s New_

_The 4.0.3 release adds the <tt>ObjectTypes</tt> parameter to the <tt>Package.ini</tt> file. You can use this parameter to specify a list of virtual COM objects that are visible to other applications in the physical environment._

_The 4.0.3 release changed the name of the VMware ThinApp User&#8217;s Manual to ThinApp User&#8217;s Guide._ 

_ThinApp 4.0.3 is also a maintenance bug fix release._

## <a name="resolvedissues"></a>_Resolved Issues_

_ThinApp 4.0.3 addresses issues that affect the following applications:_

  * _Telecordia_ 
  * _Arthemis_ 
  * _Adobe Reader 9 <!--more-->_

  * _Adobe Reader 8 Update component on Windows Vista_ 
  * _Smartplant License Manager_ 
  * _Microsoft Office Groove_ 
  * _Windows Live Messenger_ 
  * _AutoCAD 2000_ 
  * _eVIT by LUURENS_ 
  * _VMware vSphere Client_ 
  * _Internet Explorer 7_ 
  * _Lotus Notes_ 
  * _SigmaPlot 11.0_ 
  * _QuickTime Control Panel_ 

_This release resolves these issues:_

<!--388891--></p> 

  * _COM object creation fails between primary desktop and non-interactive virtual services that affect the Windows Installer service. <!--408132-->_

  * _The <tt>tlink.exe</tt> build utility of ThinApp crashes when multiple language icons exist in an executable file. <!--406368-->_

  * _The <tt>%SYSTEMSYTEM%\SPOOL</tt> folder causes the capture of printer spool files. 
    
    This might cause printing errors in a Microsoft Office package. <!--405476--></em></li> 
    
      * _Thinapp prevents a captured Lotus Notes package from starting captured Microsoft Office applications to open attachments. <!--403563-->_
    
      * _A captured Internet Explorer 7 package cannot detect external Active Directory policies. <!--329775-->_
    
      * _Acrobat Reader 9 causes 100 percent utilization. <!--399315-->_
    
      * _ThinApp is unable to pass captured batch file shortcut targets that require command-line arguments. <!--340206-->_
    
      * _Log Monitor generates errors when a sandbox on the network is locked by another computer._ </ul> 
    
    <p align="right">
      <a href="https://svenhuisman.com/wp-admin/#topofpage"><span style="color: #3366cc;"><em>Top of Page</em></span></a>
    </p>
    
    ## <a name="knownissues"></a>_Known Issues_
    
    <!--For any known issue that has a Knowledge Base article link, use this path to access the article:
http://kb.vmware.com/<knowledge_base_number>

-->
    
    _The following known issues affect this release:_
    
      * _ThinApp installation errors might occur with system login names that contain Japanese characters. <!--http://bugzilla.eng.vmware.com/show_bug.cgi?id=391650-->_
    
      * _Adobe Acrobat 8 Professional cannot create a PDF file from a Word or Excel document. <!--http://bugzilla.eng.vmware.com/show_bug.cgi?id=366641-->_
    
      * _The Application Sync utility fails when the <tt>AppSyncURL</tt> parameter in the <tt>Package.ini</tt> file contains Japanese characters. 
        
        You can only use ASCII characters. <!--http://bugzilla.eng.vmware.com/show_bug.cgi?id=386723--></em></li> 
        
          * _Microsoft Word 2003 hangs for 10 seconds when you open and close the Microsoft Equation Editor. 
            
            The Equation Editor feature creates a COM object. When you close the Equation Editor, the <tt>Winword.exe</tt> utility tries to free the object after 10 seconds if the object is not reopened. When the object is free, the Equation Editor crashes.
            
            To address this issue, deselect the Equation Editor as an option during the Microsoft Office 2003 installation. <!--http://bugzilla.eng.vmware.com/show_bug.cgi?id=386775--></em></li> 
            
              * _Internet Explorer 6 and Internet Explorer 7 do not work on Vista._ 
              * _Windows and Google Search do not work with ThinApp-captured Outlook._ 
              * _Using Microsoft Office 2003 Excel files in Office 2007 compatibility mode causes an error._ 
              * _For backward compatibility reasons, <tt>Thinstall</tt> appears in the user profile and as the folder in which the sandbox is created._ 
              * _Log Monitor might generate multiple trace files for an application._ 
              * _Packaging an application on hard drives with a very small amount of free space can cause issues during the packaging process._</ul>