---
id: 20169
title: 'VMware Identity Manager Analytics connection test failed'
date: 2016-12-14T19:00:08+02:00
author: Sven Huisman
layout: post
guid: https://SvenHuisman.com/?p=20169
permalink: /2016/12/vmware-identity-manager-analytics-connection-test-failed/
categories:
  - Other posts
tags:
  - Identity Manager
  - VMware
  - Workspace ONE
---
VMware Identity Manager is a virtual appliance based on Suse enterprise 11. It should be working like a black-box and normally there is no need to get your hands dirty working the commandline interface, unless you&#8217;re upgrading the appliance. When you have implemented an Identity Manager cluster, there are more things that could break and need to be fixed. There is for example the rabbitmq-service which is configured as a cluster when you add more nodes. Whenever you are performing an upgrade, the rabbitmq-services need to be stopped on each node (and in a specific order) or this service can break.

There is also the Elasticsearch service, which is also configured as a cluster and is responsible for searching and creating reports. This service is the reason why VMware recommends at least 3 nodes in an Identity Manager cluster. If you have 2 nodes and 1 node goes down, the following limitations apply until the node is brought up again:

  * The dashboard does not display data.
  * Most reports are unavailable.
  * Sync log information is not displayed for directories.
  * The search field in the top-right corner of the administration console does not return any results.
  * Auto-complete is not available for text fields.

You can see if the Elasticsearch an the Rabbitmq services are running correctly on each node if you go to the system diagnostic webinterface. On the bottom there are:

  * Analytics Connection: Connection test successful (this is the Elasticsearch service)
  * Messaging Connection: Connection test successful (this is the rabbitmq service)

After upgrading to 2.8.0 I encountered the following:

[<img class="aligncenter wp-image-20170 size-full" src="https://svenhuisman.com/wp-content/uploads/2016/12/analyticsconnection.png" alt="analytics connection" width="419" height="207" srcset="https://svenhuisman.com/wp-content/uploads/2016/12/analyticsconnection.png 419w, https://svenhuisman.com/wp-content/uploads/2016/12/analyticsconnection-350x173.png 350w" sizes="(max-width: 419px) 100vw, 419px" />](https://svenhuisman.com/wp-content/uploads/2016/12/analyticsconnection.png)

So I had a problem with the Elasticsearch service. When you just booted the appliances, this could take a while to give a &#8220;connection test successful&#8221; message, but this was taking too long. I entered the commandline on the first node and entered:

curl -XGET &#8216;https://localhost:9200/_cluster/health?pretty=true&#8217;

[<img class="aligncenter wp-image-20171 size-large" src="https://svenhuisman.com/wp-content/uploads/2016/12/elasticsearch-red-1024x387.png" alt="elasticsearch red" width="650" height="246" srcset="https://svenhuisman.com/wp-content/uploads/2016/12/elasticsearch-red-1024x387.png 1024w, https://svenhuisman.com/wp-content/uploads/2016/12/elasticsearch-red-350x132.png 350w, https://svenhuisman.com/wp-content/uploads/2016/12/elasticsearch-red-768x290.png 768w, https://svenhuisman.com/wp-content/uploads/2016/12/elasticsearch-red-650x246.png 650w, https://svenhuisman.com/wp-content/uploads/2016/12/elasticsearch-red.png 1306w" sizes="(max-width: 650px) 100vw, 650px" />](https://svenhuisman.com/wp-content/uploads/2016/12/elasticsearch-red.png)

Status=red => this should be green!

VMware suggests that if Elasticsearch does not start correctly or its status is red, you should follow these steps to troubleshoot.

  1. Ensure port 9300 is open.  
    a. Update node details by adding the IP addresses of all nodes in the cluster to the /usr/local/horizon/scripts/updateiptables.hzn file:  
    ALL_IPS=&#8221;node1IPadd node2IPadd node3IPadd&#8221;  
    b. Run the following script on all nodes in the cluster.  
    /usr/local/horizon/scripts/updateiptables.hzn
  2. Restart Elasticsearch on all nodes in the cluster.  
    service elasticsearch restart
  3. Check logs for more details.  
    cd /opt/vmware/elasticsearch/logs  
    tail -f horizon.log

In my case, there are unassigned shards (unassigned_shards : 6). This is probably the reason why the status is not green. The documentation doesn&#8217;t suggest how to fix this, so I did the following:

First, let&#8217;s list all unassigned shards:

curl -XGET &#8216;https://localhost:9200/_cat/shards?h=index,shard,prirep,state,unassigned.reason&#8217; | grep UNASSIGNED

[<img class="aligncenter size-large wp-image-20173" src="https://svenhuisman.com/wp-content/uploads/2016/12/unassigned2-1024x257.png" alt="unassigned" width="650" height="163" srcset="https://svenhuisman.com/wp-content/uploads/2016/12/unassigned2-1024x257.png 1024w, https://svenhuisman.com/wp-content/uploads/2016/12/unassigned2-350x88.png 350w, https://svenhuisman.com/wp-content/uploads/2016/12/unassigned2-768x193.png 768w, https://svenhuisman.com/wp-content/uploads/2016/12/unassigned2-650x163.png 650w, https://svenhuisman.com/wp-content/uploads/2016/12/unassigned2.png 1479w" sizes="(max-width: 650px) 100vw, 650px" />](https://svenhuisman.com/wp-content/uploads/2016/12/unassigned2.png)

I decided to just delete the index &#8220;v3_2016-12-13 by entering:

curl -XDELETE &#8216;https://localhost:9200/v3_2016-12-13/&#8217;

[<img class="aligncenter size-large wp-image-20174" src="https://svenhuisman.com/wp-content/uploads/2016/12/delete-1024x32.png" alt="delete" width="650" height="20" srcset="https://svenhuisman.com/wp-content/uploads/2016/12/delete-1024x32.png 1024w, https://svenhuisman.com/wp-content/uploads/2016/12/delete-350x11.png 350w, https://svenhuisman.com/wp-content/uploads/2016/12/delete-768x24.png 768w, https://svenhuisman.com/wp-content/uploads/2016/12/delete-650x20.png 650w, https://svenhuisman.com/wp-content/uploads/2016/12/delete.png 1170w" sizes="(max-width: 650px) 100vw, 650px" />](https://svenhuisman.com/wp-content/uploads/2016/12/delete.png)

I then checked the status again:

[<img class="aligncenter size-large wp-image-20175" src="https://svenhuisman.com/wp-content/uploads/2016/12/green-1024x391.png" alt="green" width="650" height="248" srcset="https://svenhuisman.com/wp-content/uploads/2016/12/green-1024x391.png 1024w, https://svenhuisman.com/wp-content/uploads/2016/12/green-350x134.png 350w, https://svenhuisman.com/wp-content/uploads/2016/12/green-768x294.png 768w, https://svenhuisman.com/wp-content/uploads/2016/12/green-650x248.png 650w, https://svenhuisman.com/wp-content/uploads/2016/12/green.png 1355w" sizes="(max-width: 650px) 100vw, 650px" />](https://svenhuisman.com/wp-content/uploads/2016/12/green.png)

And it was now green!

I&#8217;m not sure if this is required, but I restarted the Horizon-workspace service: service horizon-workspace restart

After this, the connection test was successful again. I hope this helps others experiencing the same issue.