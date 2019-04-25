---
id: 2287
title: Free Load balancing for VMware View with Citrix Netscaler VPX Express
date: 2012-02-21T17:54:51+02:00
author: Sven Huisman
layout: post
guid: http://virtualfuture.info/?p=2287
permalink: /2012/02/free-load-balancing-for-vmware-view-with-citrix-netscaler-vpx-express/
categories:
  - Virtual Desktop
tags:
  - Connection Server
  - Load Balancer
  - load balancing
  - Netscaler VPX
  - PCoIP
  - Security Server
  - VMware View
---
A load balancer for VMware View is not a requirement in a VMware View infrastructure with less than 2000 users. Even when there are multiple VMware View Connection servers for high availability, a single VMware View Connection server can handle up to 2000 connections so it’s not a big deal that the sessions are not evenly balanced. You do however want to have multiple VMware View Connection servers for high availability and to be able to access multiple VMware View Connection servers from a single point of access. A load balancer provides that functionality but is often expensive and gives additional functionality not needed for smaller deployments, like SSL Offloading. There is however a free “Enterprise-ready” load balancer available from Citrix: Netscaler VPX Express. There is a 5 Mbit throughput limit, but that is not an issue and in this article I explain why.

**DISCALAIMER**: I’m not a netscaler or “load-balancing” expert nor am I a networking guru. I’ve researched and tested the described solution and it works. I’ve not tested this solution with a large amount of users (yet). If you think information in this article is incorrect or if you think you know a better configuration or solution, please let me know.

<!--more-->

**VMware View and High availability**

In a VMware View infrastructure there are a couple of components that you want to be high available. First of all there is the **vCenter server**, which is out of scope for this article. It is not a requirement in most cases for the vCenter to be high available because users can connect to a virtual desktop once the View agent in the virtual desktop has been registered to a VMware View connection server. The vCenter server needs to be online to be able to power on/off, deploy and refresh virtual desktops. Once virtual desktops are powered on and registered, they are available for users to connect. VMware vSphere HA will be able to provide high availability for vCenter. Alternatively VMware vCenter heartbeat can be used.

To be able to connect to a virtual desktop a **VMware View Connection server** needs to be available. It is highly recommended to have at least two connection servers in a VMware View Infrastructure. It doesn’t matter to which connection server a user connects to, the configuration is the same and stays the same because of the LDAP replication taking place between all the connection servers. A user connects to a VMware View connection with a VMware View client. This is where a load balancer is recommended. A load balancer will be able to provide a single point of access to connect to one of the available VMware View Connection servers. For example, a user always connects to “view.company.corp” and the load balancer takes care of the connection to “CS01.company.corp” or “CS02.company.corp”. The load balancer also checks the health of the connection servers so it will not service connections to VMware View connection servers which are unavailable. An alternative is to use **DNS Round Robin** (DNS-RR) but the downside of DNS-RR is that it will not check if one of the connection servers is unavailable and a client could could get a “connection failed”:

[<img style="background-image: none; padding-left: 0px; padding-right: 0px; display: inline; padding-top: 0px; border-width: 0px;" title="View-connection-failed" src="https://svenhuisman.com/wp-content/uploads/2012/02/View-connection-failed_thumb.png" border="0" alt="View-connection-failed" width="338" height="132" />](https://svenhuisman.com/wp-content/uploads/2012/02/View-connection-failed.png)

Microsoft Network Load Balancing (NLB) is not recommended to use for load balancing. Ask your network specialist for details, but in short: it will pollute your network, switches don’t like it, static ARP required on switches, overhead, strange behavior after VMotion and angry networking guys can be the result of using Microsoft NLB.

Once the connection has been made and the user starts a session to a virtual desktop, the VMware View client connects directly to the virtual desktop (a secure connection through a connection server is also possible, but best practice for internal clients is a direct PCoIP connection to the desktops).

When using VMware View Security servers for external access to the virtual desktops the session to the virtual desktop will always be tunneled through a VMware View security server.

In short: do you need a load balancer for VMware View Connection servers and VMware View Security servers if you have less than 2000 users? **No**, you could use DNS RR create a single point of access to the users, the user could get a connection failed when one of the servers is not available, when a user tries a second time the connection will succeed (most likely).

To improve user experience (to guarantee a successful connection all the time for the users) you can add a load balancer which is able to check the health of the servers and services. I have found an excellent load balancer in Citrix Netscaler VPX express, which is available for **free**. It comes with a throughput limit of 5 Mbit, but that is not an issue for internal connection servers (where the session will go directly to the virtual desktop) or security servers (where the session will be tunneled through a connection server).

**Citrix Netscaler VPX Express**

The Citrix Netscaler VPX Express is a virtual appliance available for Citrix Xenserver and VMware vSphere. It is has the same features as the standard Netscaler, only with a throughput limit of 5 Mbit. For an overview of the capabilities of the Netscaler, take a look at the <a href="http://www.citrix.com/English/ps2/products/feature.asp?contentID=1861039" target="_blank">Netscaler information page</a>. The feature I’m interested in is the load balancing functionality of this appliance. <a href="www.citrix.com/netscalervpxexpress" target="_blank">Download the Citrix NetScaler VPX Express for free</a> and deploy it using the <a href="http://support.citrix.com/servlet/KbServlet/download/20681-102-666057/NS-GettingStarted-Guide-EN.pdf" target="_blank">getting started guide</a>. You don’t want the Netscaler appliance to be a single point of failure so you need to set up an active-passive failover cluster. A Netscaler VPX Express license is valid for one year, so <span style="text-decoration: underline;">don’t forget to renew your license each year</span>!

**VMware View and load balancing**

What is important to know that VMware View uses two phases to establish a connections:

  * Phase 1: Initial connection establishment, login entitlement, etc…
  * Phase 2: Tunnel connection

[<img style="background-image: none; padding-left: 0px; padding-right: 0px; display: inline; padding-top: 0px; border: 0px;" title="connectionsequence" src="https://svenhuisman.com/wp-content/uploads/2012/02/connectionsequence_thumb.png" border="0" alt="connectionsequence" width="551" height="271" />](https://svenhuisman.com/wp-content/uploads/2012/02/connectionsequence.png)

Both phases needs to be handled by the same connection server and this is important to know when you are putting a load balancer in front of VMware View connection servers or security servers! There are two excellent video’s available which explain <a href="http://youtu.be/Lk5Fz8vuPXo" target="_blank">load balancing VMware View in general</a> and <a href="http://youtu.be/ZsRB7XMp29A" target="_blank">load balancing VMware View Security servers</a>. Important thing to remember is that PCoIP traffic does not need to go through the load balancer, even when tunneled through a VMware View security server. This means that you don’t have to worry about the 5 Mbit throughput limit of the Netscaler VPX Express.

**Load balancing with Citrix Netscaler VPX Express**

Setting up load balancing with the Netscaler VPX appliance can be done in many different ways. However, as this free version has certain limitations, like throughput limit, max. SSL connections, etc, you don’t want to put a heavy load on the netscaler VPX and you definitely do not want to route PCoIP traffic through the netscaler VPX. This leaves us with two methods: default ip based or Direct Server Return mode (DSR mode, MAC based). To be honest, I first tested the DSR mode because I wanted the traffic from both phases of connection to be redirected directly to a connection or security server. However, this added the complexity of adding a loopback adapter to each server and enable forwarding on the network interfaces. And in the end, using the default method works very good, for internal connection servers (PCoIP directly to virtual desktops) and external security servers (PCoIP tunneled directly through security server). So KISS (Keep It Simple Stupid).

**Setup internal VMware View connection servers**

Setting up the internal VMware View connection for load balancing is straight forward because the best practice is to use direct connections for PCoIP sessions anyway. Make sure the “Use PCoIP Secure Gateway for PCoIP connections to desktop” is not checked.

[<img style="background-image: none; padding-left: 0px; padding-right: 0px; display: inline; padding-top: 0px; border: 0px;" title="connserver" src="https://svenhuisman.com/wp-content/uploads/2012/02/connserver_thumb.png" border="0" alt="connserver" width="374" height="206" />](https://svenhuisman.com/wp-content/uploads/2012/02/connserver.png)

**Setup VMware View Security servers**

This picture shows the setup of a load balancer in front of security servers:

[<img style="background-image: none; padding-left: 0px; padding-right: 0px; display: inline; padding-top: 0px; border: 0px;" title="loadbalancing-sec" src="https://svenhuisman.com/wp-content/uploads/2012/02/loadbalancing-sec_thumb.png" border="0" alt="loadbalancing-sec" width="503" height="150" />](https://svenhuisman.com/wp-content/uploads/2012/02/loadbalancing-sec.png)

The View Security servers are placed in the DMZ and have a mapped external ip-address. The load balancer is also placed in the DMZ and has a mapped external ip-address and a DNS record which can be resolved by external clients. This means you need an external ip-address for each security server plus one for the load balancer. So the minimum is three. When installing the VMware View Security servers, set the external URL and the PCoIP External URL to the own external ip-address (not the external load balancer address). See the picture below:

[<img style="background-image: none; padding-left: 0px; padding-right: 0px; display: inline; padding-top: 0px; border: 0px;" title="sec-server" src="https://svenhuisman.com/wp-content/uploads/2012/02/sec-server_thumb.png" border="0" alt="sec-server" width="375" height="309" />](https://svenhuisman.com/wp-content/uploads/2012/02/sec-server.png)

**Setup Netscaler for Connection and Security servers**

Because the Netscaler setup for load balancing VMware View Connection servers is the same as for Security servers, I will describe this once for both. **This does not mean you can (or need to) load balance the connection servers which are connected to security servers!**

After the basic setup of the netscaler, these are the steps for load balancing VMware View Connection servers:

**Step 1: create a virtual server for the connection/security server**

Netscaler > Load Balancing > Servers > Add…

[<img style="background-image: none; padding-left: 0px; padding-right: 0px; display: inline; padding-top: 0px; border: 0px;" title="ns-server" src="https://svenhuisman.com/wp-content/uploads/2012/02/ns-server_thumb.png" border="0" alt="ns-server" width="209" height="244" />](https://svenhuisman.com/wp-content/uploads/2012/02/ns-server.png)

**Step 2: Create a Monitor for each connection/security server**

Netscaler > Load Balancing > Monitors > Add…

  * Type: HTTP
  * Destination IP: 192.168.1.1
  * Destination port: 443
  * Check Secure

[<img style="background-image: none; padding-left: 0px; padding-right: 0px; display: inline; padding-top: 0px; border: 0px;" title="ns-monitor" src="https://svenhuisman.com/wp-content/uploads/2012/02/ns-monitor_thumb.png" border="0" alt="ns-monitor" width="368" height="254" />](https://svenhuisman.com/wp-content/uploads/2012/02/ns-monitor.png)

Special parameters:

  * HTTP Request: HEAD /?page=noclient.jsp
  * Respond codes: 200

[<img style="background-image: none; padding-left: 0px; padding-right: 0px; display: inline; padding-top: 0px; border-width: 0px;" title="ns-monitor-2" src="https://svenhuisman.com/wp-content/uploads/2012/02/ns-monitor-2_thumb.png" border="0" alt="ns-monitor-2" width="365" height="251" />](https://svenhuisman.com/wp-content/uploads/2012/02/ns-monitor-2.png)

**Step 3: Create a service for each VMware View Connection/Security server**

Netscaler > Load Balancing > Services > Add…

  * Protocol: ANY
  * Server: SS01
  * Port: *
  * Monitors: SS01-HTTPS

[<img style="background-image: none; padding-left: 0px; padding-right: 0px; display: inline; padding-top: 0px; border: 0px;" title="NS-service" src="https://svenhuisman.com/wp-content/uploads/2012/02/NS-service_thumb.png" border="0" alt="NS-service" width="364" height="254" />](https://svenhuisman.com/wp-content/uploads/2012/02/NS-service.png)

**Step 4: Create a virtual server**

Netscaler > Load Balancing > Virtual Servers > Add…

  * Protocol: ANY
  * IP Address: 192.168.1.9
  * Port: *
  * Services: Select the corresponding services

Method and Persistence:

  * Method: Least Connection
  * Persistence: SOURCEIP
  * Time-out: 5
  * IPv4 Netmask: 255.255.255.255

[<img style="background-image: none; padding-left: 0px; padding-right: 0px; display: inline; padding-top: 0px; border: 0px;" title="virtualserver1" src="https://svenhuisman.com/wp-content/uploads/2012/02/virtualserver1_thumb.png" border="0" alt="virtualserver1" width="354" height="291" />](https://svenhuisman.com/wp-content/uploads/2012/02/virtualserver1.png)

It’s important to select sourceip for persistence. See also <a href="http://kb.vmware.com/kb/1032661" target="_blank">VMware KB 1032661</a>. The time-out of 5 minutes is important because I noticed the connection to the connection/security server will time out when the default of 2 minutes is used. It seems that there is a keep-alive to the connection/security server every 3 or 4 minutes or so. When setting this to 5 minutes on the load balancer, you don’t have to re-authenticate when you want to switch desktops or connect USB-devices.

And that’s it!