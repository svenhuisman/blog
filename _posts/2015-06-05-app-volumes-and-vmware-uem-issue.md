---
id: 4228
title: App Volumes and VMware UEM issue
date: 2015-06-05T10:59:56+02:00
author: Sven Huisman
layout: post
guid: https://SvenHuisman.com/?p=4228
permalink: /2015/06/app-volumes-and-vmware-uem-issue/
categories:
  - Virtual Desktop
tags:
  - App Volumes
  - VMware UEM
---
If you want to use or test VMware App Volumes and VMware UEM you will run into a minor issue. The Applications that are installed in the Appstack(s) will not be visible in the desktop until you refresh the shortcuts with VMware UEM. This will only occur if you check if the application is available with a VMware UEM condition:

<img class="aligncenter  wp-image-4229" src="https://svenhuisman.com/wp-content/uploads/2015/06/Screen-Shot-2015-06-05-at-10.41.02.png" alt="Check executable VMware UEM" width="557" height="170" srcset="https://svenhuisman.com/wp-content/uploads/2015/06/Screen-Shot-2015-06-05-at-10.41.02.png 950w, https://svenhuisman.com/wp-content/uploads/2015/06/Screen-Shot-2015-06-05-at-10.41.02-350x107.png 350w, https://svenhuisman.com/wp-content/uploads/2015/06/Screen-Shot-2015-06-05-at-10.41.02-650x198.png 650w" sizes="(max-width: 557px) 100vw, 557px" /> 

It seems that the applications that are installed in an Appstack are not yet available when the user logs in. You will also run into this issue when an Appstack is mounted when the user is already logged in.

I discussed this issue with my colleague Rob Beekmans and he already <a title="Rob Beekmans - App Volumes" href="https://vthoughtsofit.blogspot.nl/2015/06/vmware-app-volumes-and-uem-battling.html" target="_blank">blogged about it</a>.

<div>
  I found a workaround for this. App Volumes has a feature to run scripts at various times during the mounting process of Appstacks:
</div>

<div>
  <div title="Page 41">
    <ul class="Apple-dash-list">
      <li>
        prestartup.bat : Runs as SYSTEM (if the volume is attached from boot, this will run when svservice starts)
      </li>
      <li>
        startup.bat : Runs as SYSTEM (if the volume is attached from boot, this will run when svservice starts)
      </li>
      <li>
        shellstart.bat: Runs as user (if the volume is attached before the user logs in, this is called just before the Windows shell launches)
      </li>
      <li>
        startup_postsvc.bat: Runs as SYSTEM (but only if there are services/drivers on the volume) logon_postsvc.bat: Runs as user (but only if there are services/drivers on the volume)
      </li>
      <li>
        allvolattached.bat: Runs as user (if multiple volumes are all attached at the same time such as during logon, this is called only once)
      </li>
    </ul>
    
    <div>
      In my opinion, the best option is the create an allvolattached.bat and put this in the AppStack that will be assigned to all users. If you don’t have a single Appstack for all users, you can also put it in all the Appstacks, this script will still only run once.
    </div>
    
    <div>
    </div>
    
    <p>
      &nbsp;
    </p>
    
    <div>
      <strong>How to add the script to an Appstack?</strong>
    </div>
    
    <ul>
      <li>
        Mount the Appstack to a VM that has no App Volumes agent installed.
      </li>
    </ul>
    
    <p>
      From the vSphere console or web client, edit settings on the VM, add existing disk, browse to the App Volumes datastore where the Appstack is located you want to edit. It is very important that the VM has no App Volumes agent installed!
    </p>
    
    <ul>
      <li>
        Assign a drive letter to the disk.
      </li>
    </ul>
    
    <p>
      Log in to the VM, go to disk management and add a drive letter to the App Volumes disk.
    </p>
    
    <ul>
      <li>
        Open Windows Explorer and browse to the Appstack volume.
      </li>
      <li>
        Create a new text-file and rename it to: allvolattached.bat. (in the documentation allvol<span style="text-decoration: underline;">s</span>attached.bat is mentioned, but it should be allvolattached.bat).
      </li>
    </ul>
    
    <div>
      <p>
        <a href="https://svenhuisman.com/wp-content/uploads/2015/06/Screen-Shot-2015-06-05-at-10.16.08.png"><img class="aligncenter  wp-image-4231" src="https://svenhuisman.com/wp-content/uploads/2015/06/Screen-Shot-2015-06-05-at-10.16.08.png" alt="AV volume" width="438" height="190" srcset="https://svenhuisman.com/wp-content/uploads/2015/06/Screen-Shot-2015-06-05-at-10.16.08.png 700w, https://svenhuisman.com/wp-content/uploads/2015/06/Screen-Shot-2015-06-05-at-10.16.08-350x152.png 350w, https://svenhuisman.com/wp-content/uploads/2015/06/Screen-Shot-2015-06-05-at-10.16.08-650x282.png 650w" sizes="(max-width: 438px) 100vw, 438px" /></a>
      </p>
      
      <ul>
        <li>
          Edit the batch-file and put the following command to it:
        </li>
      </ul>
    </div>
    
    <blockquote>
      <div>
        &#8220;C:\Program Files\Immidio\Flex Profiles\FlexEngine.exe&#8221; -uemrefreshshortcut
      </div>
    </blockquote>
    
    <div>
    </div>
    
    <div>
      <img class="aligncenter  wp-image-4232" src="https://svenhuisman.com/wp-content/uploads/2015/06/Screen-Shot-2015-06-05-at-10.15.57.png" alt="AV script" width="577" height="84" srcset="https://svenhuisman.com/wp-content/uploads/2015/06/Screen-Shot-2015-06-05-at-10.15.57.png 1498w, https://svenhuisman.com/wp-content/uploads/2015/06/Screen-Shot-2015-06-05-at-10.15.57-350x51.png 350w, https://svenhuisman.com/wp-content/uploads/2015/06/Screen-Shot-2015-06-05-at-10.15.57-1024x149.png 1024w, https://svenhuisman.com/wp-content/uploads/2015/06/Screen-Shot-2015-06-05-at-10.15.57-650x95.png 650w" sizes="(max-width: 577px) 100vw, 577px" />
    </div>
    
    <div>
      <ul>
        <li>
          Remove the drive-letter from the Appstack volume.
        </li>
      </ul>
      
      <p>
        <a href="https://svenhuisman.com/wp-content/uploads/2015/06/Screen-Shot-2015-06-05-at-10.16.44.png"><img class="aligncenter  wp-image-4233" src="https://svenhuisman.com/wp-content/uploads/2015/06/Screen-Shot-2015-06-05-at-10.16.44.png" alt="Remove drive letter" width="329" height="228" srcset="https://svenhuisman.com/wp-content/uploads/2015/06/Screen-Shot-2015-06-05-at-10.16.44.png 756w, https://svenhuisman.com/wp-content/uploads/2015/06/Screen-Shot-2015-06-05-at-10.16.44-350x243.png 350w, https://svenhuisman.com/wp-content/uploads/2015/06/Screen-Shot-2015-06-05-at-10.16.44-650x451.png 650w" sizes="(max-width: 329px) 100vw, 329px" /></a>
      </p>
      
      <ul>
        <li>
          Shutdown the VM and remove the disk from the VM (don’t delete it :-)).
        </li>
      </ul>
      
      <p>
        <a href="https://svenhuisman.com/wp-content/uploads/2015/06/Screen-Shot-2015-06-05-at-10.37.23.png"><img class="  wp-image-4230 aligncenter" src="https://svenhuisman.com/wp-content/uploads/2015/06/Screen-Shot-2015-06-05-at-10.37.23.png" alt="Remove disk from VM" width="501" height="254" srcset="https://svenhuisman.com/wp-content/uploads/2015/06/Screen-Shot-2015-06-05-at-10.37.23.png 1388w, https://svenhuisman.com/wp-content/uploads/2015/06/Screen-Shot-2015-06-05-at-10.37.23-350x178.png 350w, https://svenhuisman.com/wp-content/uploads/2015/06/Screen-Shot-2015-06-05-at-10.37.23-1024x519.png 1024w, https://svenhuisman.com/wp-content/uploads/2015/06/Screen-Shot-2015-06-05-at-10.37.23-650x330.png 650w" sizes="(max-width: 501px) 100vw, 501px" /></a>
      </p>
      
      <p>
        If a user now logs on, the shortcuts will be refreshed once all Appstacks are loaded. VMware will probably fix this soon, but for now this is a decent workaround.
      </p>
      
      <p>
        Update:
      </p>
      
      <p>
        An easier way that accomplish a shortcut-refresh at user-login is to put the same command in the startup folder:
      </p>
      
      <p>
        <em><a href="https://svenhuisman.com/wp-content/uploads/2015/06/Startup-immidio.png"><img class="aligncenter  wp-image-4276" src="https://svenhuisman.com/wp-content/uploads/2015/06/Startup-immidio.png" alt="Startup-immidio" width="254" height="338" srcset="https://svenhuisman.com/wp-content/uploads/2015/06/Startup-immidio.png 342w, https://svenhuisman.com/wp-content/uploads/2015/06/Startup-immidio-263x350.png 263w" sizes="(max-width: 254px) 100vw, 254px" /></a></em>
      </p>
      
      <p>
        This will only refresh the shortcuts at login, not when Appstacks are mounted while a user is already logged in.
      </p>
      
      <p>
        &nbsp;
      </p>
    </div>
    
    <div>
    </div>
  </div>
</div>