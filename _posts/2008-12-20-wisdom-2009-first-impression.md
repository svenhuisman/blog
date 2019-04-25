---
id: 634
title: Wisdom 2009 first impression
date: 2008-12-20T21:45:27+02:00
author: Matthijs Haverink
layout: post
guid: https://svenhuisman.com/?p=634
permalink: /2008/12/wisdom-2009-first-impression/
categories:
  - Workspace Management
tags:
  - Jobs
  - Schedules
  - Tasks
  - Wisdom
---
yesterday I&#8217;ve installed the new release <a title="RES Wisdom 2009" href="https://www.ressoftware.com/page.aspx?id=183&l=EN" target="_blank">RES Wisdom 2009</a> on my test environment. As you can see in an earlier post my expections of the new release were very high! First thing that impressed me was even though it was a huge update (a lot of new features were added) the installation process was still as easy as when adding a patch. This how it should be with every type of software but my expeience is that most of the times when you want to upgrade to a new version it takes a whole lot more than adding an update package!

What I am most greatful about&#8230; The interface didn&#8217;t change a lot. This way I can still easily navigate through the console.

Cool Stuff summary:

&#8211; Create Run Books (combine projects and modules and schedule them)

&#8211; Create\Delete\Snapshot ESX Virtual Machines

&#8211; Powershell tasks (really cool when you know how to use it 🙂 )

&#8211; Exchange tasks (create mailbox, and sent -mail)

&#8211; Added several (missing) conditions

As a summary I would like to add &#8220;It&#8217;s getting more mature&#8221;

In the rest of this post you&#8217;ll find my experience with the new features&#8230; 

<!--more-->Than I started looking for new features (because they are most fun to play with). First thing I saw were &#8220;Run Books&#8221;, because they are in the root of the management console. What I found out that I was able to create recurring jobs from modules and projects. This is very cool this way you can schedule roll out proces for a specific Citrix server or workstation, by combing modules and projects that aren&#8217;t linked together. I will use this feature as an extension of the normal job scheduling features already in Wisdom 2007. By the way they added a wake on lan feature to schedule jobs for turned off machines (not spectacular but useful in a workstation environment)

<div id="attachment_638" style="width: 310px" class="wp-caption alignnone">
  <a href="https://svenhuisman.com/wp-content/uploads/2008/12/runbook.jpg"><img aria-describedby="caption-attachment-638" class="size-medium wp-image-638" src="https://svenhuisman.com/wp-content/uploads/2008/12/runbook-300x227.jpg" alt="Create new run book" width="300" height="227" /></a>
  
  <p id="caption-attachment-638" class="wp-caption-text">
    Create new run book
  </p>
</div>

Next feature I was looking for were the new buitlin tasks for usage within modules. It occurred to me RES has added an new structure to the tasks window, to make tasks even more synoptic and combining the old view of queries and tasks. I had to get used to it, but after an hour of playing I can say it works better and quicker.

<div id="attachment_639" style="width: 309px" class="wp-caption alignnone">
  <a href="https://svenhuisman.com/wp-content/uploads/2008/12/tasks.jpg"><img aria-describedby="caption-attachment-639" class="size-medium wp-image-639" src="https://svenhuisman.com/wp-content/uploads/2008/12/tasks-299x300.jpg" alt="Tasks selection screen" width="299" height="300" /></a>
  
  <p id="caption-attachment-639" class="wp-caption-text">
    Tasks selection screen
  </p>
</div>

As you can see I&#8217;ve expanded the most import two tabs with the newest tasks in it. A cool feature is of course adding, deleting, managing, querying and shapshotting an ESX virtual machine. This can save a lot of work within for example a DTAP environment. And another col feature when you schedule for example a job that cannot be scheduled during office hours but you have to know when the project or module ends, you can sent an e-mail to a specified adress. This way you can keep track of the progress.

As you can see lots of new stuff to play with, I hope you&#8217;re or will be just as exited as I am. When I discover more indepth cool stuff I&#8217;ll keep you posted!