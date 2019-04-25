---
id: 1637
title: 'vSphere cluster: max 4 ESX hosts per “location” because of HA limitations?'
date: 2010-02-03T11:48:27+02:00
author: Matthijs Haverink
layout: post
guid: https://svenhuisman.com/?p=1637
permalink: /2010/02/vsphere-cluster-max-4-esx-hosts-per-location-because-of-ha-limitations/
categories:
  - Virtual Infrastructure
tags:
  - Cluster
  - demote
  - Duncan Epping
  - dynamic
  - fixed
  - HA
  - primary
  - promote
  - Remon Lam
  - roles
  - secondary
  - VMinfo.nl
  - VMware
  - vSphere
  - yewllow-bricks.com
---
<p style="text-align: left;">
  Not a lot of info is found when you Google for manually selecting/fixing the primary HA nodes in a VMware VI or vSphere environment. Of course Duncan Epping has a couple of extremely interesting posts on <a href="http://www.yellow-bricks.com" target="_blank">Yellow-Bricks.com</a> concerning HA even when it comes down to selecting or promoting the HA status of ESX nodes (a must read!), but I want more &#8230;
</p>

<span style="text-decoration: underline;">Let’s start with what I assume to know about HA:</span>

&#8211; HA works with primary and secondary HA nodes  
&#8211; The primary nodes are aware of the states and configs of all nodes in an HA cluster  
&#8211; The secondary nodes depend on the primary nodes  
&#8211; There is an supported limit of 5 primary HA nodes per cluster  
&#8211; The first 5 ESX hosts that are added in a HA cluster are initially defined as primary HA nodes  
&#8211; All the other hosts that are added to the HA cluster are configured as secondary HA nodes  
&#8211; There’s a way to configure a HA node as primary or secondary, however it’s not possible to configure an ESX host as a “fixed” primary HA node:  
<!--more-->

  * _/opt/vmware/aam/bin/Cli_

_AAM> promotenode <EsxNodeName>_ (Configure host as a primary HA node)

  * _/opt/vmware/aam/bin/Cli_ 

_AAM> demotenode <EsxNodeName>_   (Configure host as a secondary HA node)

&#8211; One primary HA node is the _Active Primary HA node_; this node coordinates the restarts of the VM’s that went down with “crashed” host.  
&#8211; When the _Active Primary HA node_ goes down, another primary is (s)elected as _Active Primary HA node_” and takes over the coordinating role.  
&#8211; **A new primary is chosen when another primary is disconnected from the cluster in one of these situations:**

  * ** (Re)configuring HA on a host**
  * **Disconnecting a host from the cluster (manually or by failure)**
  * **Removing a host from the cluster**
  * **In case of a HA failure**
  * **Putting a host into maintenance mode**

Especially when you read the last bullet we can establish that HA roles are really dynamic in a VI/vSphere environment. **_This means that you have no control over the physical location of the primary and secondary roles._**

<span style="text-decoration: underline;">And this is what my post is about:</span>

This situation freaks me out because when you have a larger environment with a couple of _possible failure domains_ as I’d like to call them (represented by any physically separated group of hosts within an HA cluster like different blade chassis or different server rooms) you want to have control over the placement of these HA roles.

And as I stated earlier <a href="http://www.yellow-bricks.com" target="_blank">Duncan Epping</a> has some interesting articles like the <a href="http://www.yellow-bricks.com/vmware-high-availability-deepdiv/" target="_blank">HA deep dive</a> and the <a href="http://www.yellow-bricks.com/2009/08/07/primary-and-secondary-nodes-pick-one/" target="_blank">Primary and Secondary nodes, pick one!</a> which describe how to select a role for a host but this selection is not static; whenever a primary host is disconnected (Maintenance mode, Reconfigure HA and so on) there is a reelection and you lose control over the role placement.

So what if all 5 primaries HA nodes are on the same “possible failure domain” (say blade chassis) and that goes down? Well you just lost all your HA nodes that know what to do in case of a host-failure, so HA won’t work!

<p style="text-align: center;">
  <a class="wpGallery" href="https://svenhuisman.com/wp-content/uploads/2010/02/HA-wrong-and-correct-situation.png" target="_self"></a>
</p>

<p style="text-align: center;">
  <a href="https://svenhuisman.com/wp-content/uploads/2010/02/HA-wrong-and-correct-situation21.png" target="_blank"><img class="aligncenter size-large wp-image-1657" title="HA wrong and correct situation2" src="https://svenhuisman.com/wp-content/uploads/2010/02/HA-wrong-and-correct-situation2-1024x493.png" alt="HA wrong and correct situation2" width="400" height="192" /></a>
</p>

We’ll have to nuance the drama a bit: if 5 hosts of a “10 ESX host cluster” go down, you have a major issue anyway, if HA works or not, because you lost half of your capacity.

But you do have to realize that if HA is configured correctly, the 5 remaining hosts have some resources available, you have your primaries separated over the 2 locations and you have defined the start-up rules for the most important VM’s, these important VM’s will be booted up.

If you have the same situation as above but with all 5 primary HA nodes down because they were physically grouped, HA won’t work and none of the crashed VM’s will be booted up automatically!

<a href="http://www.yellow-bricks.com/2009/09/15/future-ha-developments-vmworld-bc3197/" target="_blank">During VMworld 2009 Marc Sevigny from VMware explained</a> that they were looking into an option which would enable you to pick your primary hosts.This would solve the problem but until then the only solution is to keep your clusters limited to a total of 8 ESX hosts , 4 ESX hosts per “possible failure domain”.

I’m curious if I’m the only one running into this challenge; please let me know!

P.S. Special kudo’s go to <a href="http://www.twitter.com/lammyVM" target="_blank">Remon Lam</a> from <a href="http://www.vminfo.nl" target="_blank">vminfo.nl</a> who discovered this &#8220;feature&#8221; and reviewed the article .