---
id: 682
title: 'VMware vCenter &#038; SQL server best practices [updated 15/4/09]'
date: 2009-01-26T21:56:05+02:00
author: Matthijs Haverink
layout: post
guid: http://virtualfuture.info/?p=682
permalink: /2009/01/vmware-vcenter-sql-server-best-practices/
categories:
  - Virtual Infrastructure
tags:
  - Best Practice
  - license server
  - Running VC in a VM
  - SQL
  - vCenter
  - Virtual Center
  - VM
  - VMware
---
**<span style="text-decoration: underline;">VMware vCenter & SQL : Best Practice</span>**

This month I started on a new project and I noticed again a different approach from a colleague to the vCenter/SQL/Physical/Virtual issue. And of course there has been written a lot about this issue but I couldn&#8217;t find my exact view anywhere else so I thought I&#8217;d open up a discussion here by presenting the Best Practice in my humble opinion.

There are 4 critical decisions you have to make concerning the vCenter server for your VI:

**_1. vCenter server : physical or virtual.  
2. SQL Database (server) : locally or detached.  
3. Redundancy options : make it redundant and if so; how?  
4. License server : locally or detached.  
_** 

<!--more-->

  
<span style="text-decoration: underline;"><strong>1. Virtualize your vCenter server. Reasons :</strong></span>

1.1. You&#8217;re automatically making it Highly Available. When the physical machine is down, HA still works so your vCenter Server is protected against hardware failures.

1.2. _Eat your own dog food;_ you trust your company/customers to run production on your Virtual Infrastructure, why the h\*** wouldn&#8217;t you?

<div>
  <span style="text-decoration: underline;"></p> 
  
  <div>
    <strong></strong>
  </div>
  
  <p>
    </span></div> 
    
    <p>
      <span style="text-decoration: underline;"><strong>2. Install the SQL databaseserver and the database on a different server (cluster) as your vCenter Server. Reason :</p> 
      
      <p>
        </strong></span>
      </p>
      
      <p>
        2.1 Performance. When hosting a larger environment the database server will get pretty busy and you don&#8217;t want your VC and it&#8217;s database server getting strangled in a performance struggle.
      </p>
      
      <p>
        <strong>Take notice</strong> that this is concerning larger environments. If you have a smaller environment and use the SQL Server 2005 Express Edition, off course you keep the VC and database on the same server.
      </p>
      
      <div>
        <span style="text-decoration: underline;"></p> 
        
        <div>
          <strong></strong>
        </div>
        
        <p>
          </span></div> 
          
          <p>
            <span style="text-decoration: underline;"><strong>3. Redundancy options: Use HA and have a backup VM or physical machine available.</p> 
            
            <p>
              </strong></span>
            </p>
            
            <p>
              3.1 Options to really cluster the vCenter server is overkill when you ask me. I still consider it &#8220;just a management server&#8221;; the most important function : HA, works without VC intervention.
            </p>
            
            <p>
              3.2 If your VC or database really gets corrupted you still have a serious issue since you won&#8217;t be able to find your VM&#8217;s, besides that DRS doesn&#8217;t function either. Therefore you should have a way to get your VC back quickly.
            </p>
            
            <div>
              <span style="text-decoration: underline;"></p> 
              
              <div>
                <strong></strong>
              </div>
              
              <p>
                </span></div> 
                
                <p>
                  <span style="text-decoration: underline;"><strong> </p> 
                  
                  <p>
                    </strong> 
                  </p>
                  
                  <p>
                    </span>
                  </p>
                  
                  <p>
                     
                  </p>
                  
                  <p>
                    4.1 No performance impact and running it locally reduces the danger of network failure to interfere.<br /> <span style="text-decoration: underline;"><strong></strong></span>
                  </p>
                  
                  <div>
                    <span style="text-decoration: underline;"></p> 
                    
                    <div>
                      <strong></strong>
                    </div>
                    
                    <p>
                      </span></div> 
                      
                      <p>
                        <span style="text-decoration: underline;"><strong>Take notice: virtualizing your vCenter Server is fully supported by VMware but there are some additional considerations:</p> 
                        
                        <p>
                          </strong></span>
                        </p>
                        
                        <p>
                          <em>A. Make sure its resources are guaranteed. Make use of reservations/shares !</em>
                        </p>
                        
                        <p>
                          <em>B. Make sure the autostart policy for the VC VM is set with the highest priority (This in case your ESX cluster went down for whatever reason) !</em>
                        </p>
                        
                        <p>
                          <em>C. Think of the other resources needed for your VC to function : DNS, AD, DB. Make sure these are always up for your VC. So if they run virtual, set the autostart policies and prioritize it like this : 1. DNS, 2. AD, 3. DB.</em>
                        </p>
                        
                        <p>
                          <em>D. Disable DRS for VC [edit thx to Vikash/Duncan]<br /> </em><strong></strong><br /> <strong>Please take notice.</strong> These are best practices based on my own experience, experience of others and VMware whitepapers. Most relevant white papers with more details :<br /> Running VC in a VM : <a href="http://www.vmware.com/pdf/vi3_vc_in_vm.pdf">http://www.vmware.com/pdf/vi3_vc_in_vm.pdf</a> <br /> VC SQL Database Performance : <a href="http://www.vmware.com/files/pdf/vc_database_performance.pdf">http://www.vmware.com/files/pdf/vc_database_performance.pdf</a>.
                        </p>
                        
                        <p>
                          Off course I&#8217;m not the first one writing about this so check out the following sources, which I&#8217;ve have also used, for more info about running VC virtual:
                        </p>
                        
                        <p>
                          Making VC Highly Available @ Yellow-Bricks : <a href="http://www.yellow-bricks.com/2008/11/19/make-virtualcenter-highly-available-with-vmware-vi3/">http://www.yellow-bricks.com/2008/11/19/make-virtualcenter-highly-available-with-vmware-vi3/</a>
                        </p>
                        
                        <p>
                          VC Physical or Virtual @ VMGuy : <a href="http://vmguy.com/wordpress/?p=67">http://vmguy.com/wordpress/?p=67</a> (btw, that wordpress template is soooo 2008 :P)
                        </p>
                        
                        <p>
                          VC Database Best Practices @ Scott Low : <a href="http://blog.scottlowe.org/2008/09/18/po2061-vmware-virtualcenter-25-database-best-practices/">http://blog.scottlowe.org/2008/09/18/po2061-vmware-virtualcenter-25-database-best-practices/</a>
                        </p>
                        
                        <p>
                          VC Virtual ? @ Rich Brambly (VMETC) : <a href="http://vmetc.com/2007/12/28/should-virtual-center-run-as-a-virtual-machine/">http://vmetc.com/2007/12/28/should-virtual-center-run-as-a-virtual-machine/</a>
                        </p>
                        
                        <p>
                          Physical/Virtual discussion @ VIOps : <a href="http://viops.vmware.com/home/message/1359">http://viops.vmware.com/home/message/1359</a>
                        </p>
                        
                        <p>
                           Mgmt Cluster : <a title="http://www.dailyhypervisor.com/2009/04/14/vmware-virtual-center-physical-or-virtual" href="http://www.dailyhypervisor.com/2009/04/14/vmware-virtual-center-physical-or-virtual/" target="_blank">http://www.dailyhypervisor.com/2009/04/14/vmware-virtual-center-physical-or-virtual/</a>  [Edit 15/4/2009]
                        </p>
                        
                        <p>
                          <strong>Again, I&#8217;m trying to open up a discussion here so feel free to comment !</strong>
                        </p>