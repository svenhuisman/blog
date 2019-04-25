---
id: 596
title: VMware VMDK Recovery Tool (ESX 3.5 Update 3)
date: 2008-12-09T11:51:19+02:00
author: Sven Huisman
layout: post
guid: http://virtualfuture.info/?p=596
permalink: /2008/12/vmware-vmdk-recovery-tool-esx-35-update-3/
categories:
  - Virtual Infrastructure
tags:
  - ESX 3.5
  - esxi
  - VMDK recovery tool
  - VMware
---
I was searching for information about the new experimental tool for ESX 3.5 **VMDK Recovery Tool** and I found a great <a title="VMDK Recovery Tool" href="http://kb.vmware.com/selfservice/microsites/search.do?language=en_US&cmd=displayKC&externalId=1007243" target="_blank">knowledgebase article</a> at VMware. VMDK Recovery Tool is a tool to recover VMDK files if they become deleted, or if the VMFS datastore gets deleted or corrupted. There are some limitations to the tool:

  * <div>
      The tool is experimental. Experimental means that the tool is not supported and might not work as expected in all customer environments.
    </div>

  * <div>
      The tool is not available for ESXi.
    </div>

  * <div>
      You cannot restore from multiple block list files.
    </div>

Unfortunately, currently at home I only have ESXi running and I have no customer running U3 already. Anyone who tried VMDK Recovery Tool yet?