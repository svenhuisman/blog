---
id: 1097
title: InstallFree Bridge Suite 1.9.0.5 Released
date: 2009-04-09T08:27:19+02:00
author: Sven Huisman
layout: post
guid: http://virtualfuture.info/?p=1097
permalink: /2009/04/installfree-bridge-1905-release/
categories:
  - Virtual Applications
tags:
  - Application Virtualization
  - Installfree
  - InstallFree Bridge
  - installfreeguru.com
---
<a title="InstallFree" href="http://www.installfree.com" target="_blank">InstallFree</a> released a new version of their application virtualization product: the InstallFree Bridge Suite 1.9.0.5. Some cool new features are in this release, self provision of applications for example, where end users can select and provision their own applications. The next step is to allow end users to package/encapsulate their own applications. This was <a title="Self encapsulate" href="https://svenhuisman.com/2008/09/installfree-new-feature/" target="_blank">demonstrated</a> at VMWorld 2008 in Las Vegas, but is still not a current feature.

If you don&#8217;t know what InstallFree is or can do, tak a look at this <a title="InstallFree introduction video" href="http://www.installfree.com/portals/42159/demos/INTRO/intro.html" target="_blank">introduction video</a>.

If you do know what InstallFree is and you&#8217;ve worked with the product or want to work with it, you should definitely take a look at the independent user forum: <a title="Installfreeguru.com" href="http://www.installfreeguru.com/" target="_blank">InstallFreeguru.com</a>. There isn&#8217;t a lot of info to find there yet, but it&#8217;s a good initiative and I will keep a close eye on the questions posted in the forum.

Here is the complete list of new features (taken from the release notes):<!--more-->

1. HTTP/HTTPS Download – The Bridge Download Manager support download of Bridge components (AODs, Base, Engines, etc) over HTTP and HTTPS.

2. Self Provisioning of IFV Applications – Provides end users with the ability to select and provision their own virtual applications.  
a. IFMC administrator can define Application Containers, Application Packages, Expansions and Updates available for end-user self provisioning.  
b. Users are presented with a Self Provisioning portal enabling them to select their own IFV Applications.  
c. Customer can use the Encapsulator Edit AOD tool to customize the Self Provisioning portal to correspond with the organization brand.

3. Host Interconnectivity Policies (IF ADM) – Host Interconnectivity policies define the level of connectivity and interoperability of virtual application with the host OS and other virtual applications.  
a. Host Interconnectivity Policies are in ADM format. Administrator may use the IFMC ADM control to modify the level of interconnectivity.  
b. Examples for Host Interconnectivity Policies: Clipboard control, local drives access, access native applications from IFV Applications, and presentation of native application file extensions in IFV Applications.

4. Application ADM files – Enforce existing ADM files on virtual applications.  
a. IFMC administrator can upload ADM files and assign then to IFV Applications.  
b. Once assigned, the ADM files are transformed into Policy AODs that can be enforced on IFV Applications.

5. AOD Versions – AOD Versions enables IFMC administrators to upload multiple AODs under the same application CLS ID. The features addresses 2 needs:  
a. Edit AODs – Administrators can edit existing AODs using the Encapsulator Edit AOD tool, and then upload them under the same application CLS ID. This way, users can migrate from old AOD to a new one without losing their customization and personalization (as UserData stays the same).  
b. Different Languages – AOD versions enable upload of AODs in different languages under the same application CLS ID. IFMC administrators can then define default AOD per language.  
AOD versions and languages can be modified per AD entity and/or application instance.

6. System AODs – In addition to BrowserLaunhc AOD, System AODs hold SELaunch and SelfProvision AODs.  
a. When users are provisioned with self provision applications, SelfProvision AOD is automatically assigned to users. There is no need to manually assign SelfProvision AOD to users.  
b. When users are defined to work with SELaunch AOD, it is automatically assigned to users. There is no need to manually assign SELaunch AOD to users.

7. Bridge and Engine controls – Bridges and Engines parameters are managed by a new control. The new control provides easier and broader support of Bridges and Engines parameters.

8. OS Support &#8211; Added support of Server 2003 SP2. Improved support of Server 2003 R2 and Vista OS