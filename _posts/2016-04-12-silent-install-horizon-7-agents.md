---
id: 13324
title: Silent install Horizon 7 agents
date: 2016-04-12T13:45:50+02:00
author: Sven Huisman
layout: post
guid: http://SvenHuisman.com/?p=13324
permalink: /2016/04/silent-install-horizon-7-agents/
categories:
  - Virtual Desktop
  - Virtual Infrastructure
tags:
  - Horizon
  - View
  - VMware
---
Yesterday I noticed that the silent parameters I normally used for the Horizon View agent (version 6.x) didn&#8217;t work anymore with the new Horizon 7 agent. Checking the logfile, I found out that the silent parameter &#8220;HtmlAccess&#8221; was unknown. After I opened the MSI with <a href="https://msdn.microsoft.com/nl-nl/library/aa370557(v=vs.85).aspx" target="_blank">ORCA</a>, I noticed HtmlAccess was not a feature anymore:

<img class="aligncenter size-medium wp-image-13326" src="https://svenhuisman.com/wp-content/uploads/2016/04/ViewAgent7-features-337x350.png" alt="ViewAgent7-features" width="337" height="350" srcset="https://svenhuisman.com/wp-content/uploads/2016/04/ViewAgent7-features-337x350.png 337w, https://svenhuisman.com/wp-content/uploads/2016/04/ViewAgent7-features-650x675.png 650w, https://svenhuisman.com/wp-content/uploads/2016/04/ViewAgent7-features.png 741w" sizes="(max-width: 337px) 100vw, 337px" /> 

I assume it is replaced by the feature &#8220;BlastProtocol&#8221;, which includes the Blast Extreme feature. When you read the <a href="http://pubs.vmware.com/horizon-7-view/topic/com.vmware.horizon-view.desktops.doc/GUID-3096DA8B-034B-435B-877E-5D2B18672A95.html" target="_blank">documentation for Horizon 7</a>, you will notice that the feature table is not updated, it still mentions the &#8220;HtmlAccess&#8221; feature:

<img class="aligncenter size-medium wp-image-13327" src="https://svenhuisman.com/wp-content/uploads/2016/04/Screen-Shot-2016-04-12-at-13.21.50-350x151.png" alt="Silent parameters" width="350" height="151" srcset="https://svenhuisman.com/wp-content/uploads/2016/04/Screen-Shot-2016-04-12-at-13.21.50-350x151.png 350w, https://svenhuisman.com/wp-content/uploads/2016/04/Screen-Shot-2016-04-12-at-13.21.50-768x332.png 768w, https://svenhuisman.com/wp-content/uploads/2016/04/Screen-Shot-2016-04-12-at-13.21.50-1024x442.png 1024w, https://svenhuisman.com/wp-content/uploads/2016/04/Screen-Shot-2016-04-12-at-13.21.50-650x281.png 650w, https://svenhuisman.com/wp-content/uploads/2016/04/Screen-Shot-2016-04-12-at-13.21.50.png 1376w" sizes="(max-width: 350px) 100vw, 350px" /> 

If you replace HtmlAccess with BlastProtocol, you should be fine (I&#8217;m not sure if it installs by default if you don&#8217;t specify). The silent installation command for the Horizon 7 Agent now looks like this (parameters are case-sensitive!):

&#8220;VMware-viewagent-x86\_64-7.0.0-3634043.exe&#8221; /s /v&#8221;/qn VDM\_VC\_MANAGED\_AGENT=1 ADDLOCAL=Core,SVIAgent,ThinPrint,USB,PCoIP,BlastProtocol,RTAV,ClientDriveRedirection,VmVideo,VmwVaudio,TSMMR,UnityTouch&#8221;

UPDATE: The documentation is now updated on the VMware documentation site. Important to note is that if you use ADDLOCAL to specify features individually, that is, you do not specify ADD<span id="GUID-3096DA8B-034B-435B-877E-5D2B18672A95__option_D19E9FD0A2C443668A848485CBF02C2A" class="option">LOCAL=ALL</span>, you must specify the following features explicitly. You must always specify Co<span id="GUID-3096DA8B-034B-435B-877E-5D2B18672A95__option_913CD1341E534E628685B082DEFD7864" class="option">re</span>.

<div class="tablenoborder">
  <a name="GUID-3096DA8B-034B-435B-877E-5D2B18672A95__table_99C9A913484B48B8952CF5E3B2CB2BA1" shape="rect"></a></p> 
  
  <table id="GUID-3096DA8B-034B-435B-877E-5D2B18672A95__table_99C9A913484B48B8952CF5E3B2CB2BA1" class="Multicolumn" border="0" cellspacing="0" cellpadding="0">
    <tr id="GUID-3096DA8B-034B-435B-877E-5D2B18672A95__row_A688AE5BBCFC4D8AAFEE8C6C793EDFF3" class="TableHead">
      <th colspan="1" rowspan="1">
        <div id="d44528e731" class="TableHead">
          <p id="GUID-3096DA8B-034B-435B-877E-5D2B18672A95__d58t688" class="Para">
            <a name="GUID-3096DA8B-034B-435B-877E-5D2B18672A95__d58t688" shape="rect"></a>Silent Installation Feature
          </p>
        </div>
      </th>
      
      <th colspan="1" rowspan="1">
        <div id="d44528e735" class="TableHead">
          <p id="GUID-3096DA8B-034B-435B-877E-5D2B18672A95__d58t691" class="Para">
            <a name="GUID-3096DA8B-034B-435B-877E-5D2B18672A95__d58t691" shape="rect"></a>Description
          </p>
        </div>
      </th>
    </tr>
    
    <tr id="GUID-3096DA8B-034B-435B-877E-5D2B18672A95__row_4411E2455A63488FAAAE3DA6FB0ABBD4">
      <td colspan="1" rowspan="1" headers="d44528e731">
        <p id="GUID-3096DA8B-034B-435B-877E-5D2B18672A95__d58t700" class="Para">
          <a name="GUID-3096DA8B-034B-435B-877E-5D2B18672A95__d58t700" shape="rect"></a>Core
        </p>
      </td>
      
      <td colspan="1" rowspan="1" headers="d44528e735">
        <p id="GUID-3096DA8B-034B-435B-877E-5D2B18672A95__d58t703" class="Para">
          <a name="GUID-3096DA8B-034B-435B-877E-5D2B18672A95__d58t703" shape="rect"></a>The core <span id="GUID-3096DA8B-034B-435B-877E-5D2B18672A95__productname_149B58E4911B45E28FDE0C138D106256"><a name="GUID-3096DA8B-034B-435B-877E-5D2B18672A95__productname_149B58E4911B45E28FDE0C138D106256" shape="rect"></a>Horizon Agent</span> functions.
        </p>
      </td>
    </tr>
    
    <tr id="GUID-3096DA8B-034B-435B-877E-5D2B18672A95__row_82BA1ABDF84E46C99BA6758DA767D395">
      <td colspan="1" rowspan="1" headers="d44528e731">
        <p id="GUID-3096DA8B-034B-435B-877E-5D2B18672A95__d58t712" class="Para">
          <a name="GUID-3096DA8B-034B-435B-877E-5D2B18672A95__d58t712" shape="rect"></a>BlastProtocol
        </p>
      </td>
      
      <td colspan="1" rowspan="1" headers="d44528e735">
        <p id="GUID-3096DA8B-034B-435B-877E-5D2B18672A95__d58t715" class="Para">
          <a name="GUID-3096DA8B-034B-435B-877E-5D2B18672A95__d58t715" shape="rect"></a>VMware Blast
        </p>
      </td>
    </tr>
    
    <tr id="GUID-3096DA8B-034B-435B-877E-5D2B18672A95__row_DAA33485DDEF479B87D2C5D0FF2C7A4A">
      <td colspan="1" rowspan="1" headers="d44528e731">
        <p id="GUID-3096DA8B-034B-435B-877E-5D2B18672A95__d58t721" class="Para">
          <a name="GUID-3096DA8B-034B-435B-877E-5D2B18672A95__d58t721" shape="rect"></a>PCoIP
        </p>
      </td>
      
      <td colspan="1" rowspan="1" headers="d44528e735">
        <p id="GUID-3096DA8B-034B-435B-877E-5D2B18672A95__d58t724" class="Para">
          <a name="GUID-3096DA8B-034B-435B-877E-5D2B18672A95__d58t724" shape="rect"></a>PCoIP Protocol Agent
        </p>
      </td>
    </tr>
    
    <tr id="GUID-3096DA8B-034B-435B-877E-5D2B18672A95__row_0F815C1321294703BFFE5F051182ACE7">
      <td colspan="1" rowspan="1" headers="d44528e731">
        <p id="GUID-3096DA8B-034B-435B-877E-5D2B18672A95__d58t730" class="Para">
          <a name="GUID-3096DA8B-034B-435B-877E-5D2B18672A95__d58t730" shape="rect"></a>VmVideo
        </p>
      </td>
      
      <td colspan="1" rowspan="1" headers="d44528e735">
        <p id="GUID-3096DA8B-034B-435B-877E-5D2B18672A95__d58t733" class="Para">
          <a name="GUID-3096DA8B-034B-435B-877E-5D2B18672A95__d58t733" shape="rect"></a>Virtual video driver
        </p>
      </td>
    </tr>
    
    <tr id="GUID-3096DA8B-034B-435B-877E-5D2B18672A95__row_EE4742D1E3B3447FA748DA111B979A64">
      <td colspan="1" rowspan="1" headers="d44528e731">
        <p id="GUID-3096DA8B-034B-435B-877E-5D2B18672A95__d58t739" class="Para">
          <a name="GUID-3096DA8B-034B-435B-877E-5D2B18672A95__d58t739" shape="rect"></a>UnityTouch
        </p>
      </td>
      
      <td colspan="1" rowspan="1" headers="d44528e735">
        <p id="GUID-3096DA8B-034B-435B-877E-5D2B18672A95__d58t742" class="Para">
          <a name="GUID-3096DA8B-034B-435B-877E-5D2B18672A95__d58t742" shape="rect"></a>Unity Touch
        </p>
      </td>
    </tr>
    
    <tr id="GUID-3096DA8B-034B-435B-877E-5D2B18672A95__row_FA465FFEDF044F2EB06D386B3CBE1700">
      <td colspan="1" rowspan="1" headers="d44528e731">
        <p id="GUID-3096DA8B-034B-435B-877E-5D2B18672A95__d58t749" class="Para">
          <a name="GUID-3096DA8B-034B-435B-877E-5D2B18672A95__d58t749" shape="rect"></a>PSG
        </p>
      </td>
      
      <td colspan="1" rowspan="1" headers="d44528e735">
        <p id="GUID-3096DA8B-034B-435B-877E-5D2B18672A95__d58t752" class="Para">
          <a name="GUID-3096DA8B-034B-435B-877E-5D2B18672A95__d58t752" shape="rect"></a>This features sets a registry entry that tells Connection Server whether <span id="GUID-3096DA8B-034B-435B-877E-5D2B18672A95__productname_149B58E4911B45E28FDE0C138D106256"><a name="GUID-3096DA8B-034B-435B-877E-5D2B18672A95__productname_149B58E4911B45E28FDE0C138D106256" shape="rect"></a>Horizon Agent</span> is using IPv4 or IPv6.
        </p>
      </td>
    </tr>
  </table>
  
  <p>
    &nbsp;
  </p>
  
  <p>
    While I&#8217;m at it, here are the silent installation command for installing VMware User Environment Manager agent and the App Volumes agent:
  </p>
</div>

**VMware User Environment Manager agent**

The silent installation command for the VMware User Environment Manager agent is:

<div class="page" title="Page 22">
  <div class="section">
    <div class="layoutArea">
      <div class="column">
        <div class="page" title="Page 22">
          <div class="section">
            <div class="layoutArea">
              <div class="column">
                <p>
                  msiexec.exe /i &#8220;VMware User Environment Manager 9.0 x64.msi&#8221; /qn
                </p>
              </div>
            </div>
          </div>
        </div>
        
        <p>
          INSTALLDIR=&#8221;D:\Apps\VMware UEM&#8221; ADDLOCAL=&#8221;FlexProfilesSelfSupport&#8221; LICENSEFILE=&#8221;\\filesrv1\share\VMware UEM.lic&#8221; /l* InstallUEM.log
        </p>
        
        <p>
          When you don&#8217;t specifiy the Installation directory, it will install in the default directory &#8220;%ProgramFiles%\Immidio\Flex Profiles&#8221;. The following values are supported for the property ADDLOCAL:
        </p>
        
        <ul>
          <li>
            ALL
          </li>
          <li>
            FlexEngine
          </li>
          <li>
            FlexMigrate (automatically installs FlexEngine as well)
          </li>
          <li>
            FlexProfilesSelfSupport (automatically installs FlexEngine as well)
          </li>
          <li>
            FlexManagementConsole
          </li>
        </ul>
      </div>
    </div>
  </div>
</div>

And when you install the VMware User Environment Manager Agent on a machine where the Horizon agent is installed, you don&#8217;t need a license file. So make sure you install the User Environment Manager Agent AFTER the Horizon Agent. Then the silent installation command is a bit simpler:

msiexec.exe /i &#8220;VMware User Environment Manager 9.0 x64.msi&#8221; /qn ADDLOCAL=&#8221;FlexProfilesSelfSupport&#8221;

**App Volumes Agent (2.x)**

It is not in the documentation, but you can also silently install the App Volumes Agent:

msiexec.exe /i &#8220;App Volumes Agent.msi&#8221; /qn MANAGER\_ADDR=appvolumes.svenhuisman.com MANAGER\_PORT=443

The parameter &#8220;MANAGER_ADDR&#8221; can be the FQDN or IP-address of a single App Volumes Manager, the load balanced address of the App Volumes managers or a comma-seperated list of App Volumes Manager servers.