---
id: 222
title: 'Hint : VI Backup products don&#8217;t like bashrc customization !'
date: 2008-08-06T16:26:14+02:00
author: Matthijs Haverink
layout: post
guid: http://virtualfuture.info/?p=222
permalink: /2008/08/hint-vi-backup-products-dont-like-bashrc-customization/
categories:
  - Scripts
tags:
  - backup
  - BASHRC
  - Matthijs Haverink
  - no value for $TERM and no -T specified
  - TPUT
  - Veeam Backup
  - Vizioncore
  - VMware
  - vRanger Pro
---
**Yesterday** and today my colleague <a href="http://www.linkedin.com/pub/7/656/8b3" target="_blank">Rob Mokkink</a> and I were getting very negative feelings towards the <a href="http://www.vizioncore.com/vRangerPro.html" target="_blank">VizionCore vRanger Pro</a> and <a href="http://www.veeam.com/vmware-esx-backup.html" target="_blank">Veeam Backup </a>products, but like often, the _problem existed behind the keyboard_. But we prefer to call it an &#8220;_undescribed feature_&#8221; of these products.

We downloaded the latest versions of both products to see which product would fit best in our current environment and connecting to the Virtual Center servers went flawless but with neither of the 2 products we could connect to our ESX hosts. Errors that occured were errors that nobody experienced before, according to the product support forums.<!--more-->

**VizionCore vRanger :** hanging _add host_ screen. Using the GUI or the client made no difference, as soon as we kicked off the add hosts command it hang, permanently.

**Veeam Backup** : &#8220;no value for $TERM and no -T specified&#8221;

**Finally we found out** that the problem was that we had used TPUT to customize the BASHRC so that when the user root logged on, the shell appeared in <span style="color: #ff0000;"><strong>red</strong></span>. We used this feature to attend (so called) administrators on the fact that they now had _GOD_ _POWER_ and should know what they were doing:

> <pre class="MsoPlainText" style="margin: 0cm 0cm 0pt;"><span style="color: #999999;">#IF USER IS ROOT THE TERMINAL IS RED </span></pre>
> 
> <pre class="MsoPlainText" style="margin: 0cm 0cm 0pt;"><span style="color: #999999;">function setprompt </span></pre>
> 
> <pre class="MsoPlainText" style="margin: 0cm 0cm 0pt;"><span style="color: #999999;">{ </span></pre>
> 
> <pre class="MsoPlainText" style="margin: 0cm 0cm 0pt;"><span style="color: #999999;">  local RED="\[$(tput setaf 1)\]"</span></pre>
> 
> <pre class="MsoPlainText" style="margin: 0cm 0cm 0pt;"><span style="color: #999999;">  local RESET="\[$(tput sgr0)\]"</span></pre>
> 
> <pre class="MsoPlainText" style="margin: 0cm 0cm 0pt;"><span style="color: #999999;">  if [ `id -u` = 0 ] # check if user is root </span></pre>
> 
> <pre class="MsoPlainText" style="margin: 0cm 0cm 0pt;"><span style="color: #999999;">  then PS1="$RED[\u@\h:\W]$RESET "</span></pre>
> 
> <pre class="MsoPlainText" style="margin: 0cm 0cm 0pt;"><span style="color: #999999;">  else</span></pre>
> 
> <pre class="MsoPlainText" style="margin: 0cm 0cm 0pt;"><span style="color: #999999;">  PS1="[\u@\h:\W]$RESET "</span></pre>
> 
> <pre class="MsoPlainText" style="margin: 0cm 0cm 0pt;"><span style="color: #999999;">fi</span></pre>
> 
> <pre class="MsoPlainText" style="margin: 0cm 0cm 0pt;"><span style="color: #999999;">}</span></pre>
> 
> <pre class="MsoPlainText" style="margin: 0cm 0cm 0pt;"><span style="color: #999999;">setprompt</span></pre>
> 
> <pre class="MsoPlainText" style="margin: 0cm 0cm 0pt;"><span style="color: #999999;"><span style="text-decoration: line-through;">EOF2</span></span></pre>
> 
> <pre class="MsoPlainText" style="margin: 0cm 0cm 0pt;"><span style="color: #999999;">### END /ETC/BASHRC CONFIGURATION ###</span></pre>

**And as you might now you**, both products use SUDO to log on to the ESX hosts as root so they got the customized shell and that apparently caused the problem.

**So the conclusion** is that BASHRC customization is cool, but can cause &#8220;interesting problems&#8221;; so use with caution when using third party tooling !