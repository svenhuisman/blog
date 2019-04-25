---
id: 1986
title: Hands-on with Ericom AccessNow for VMware View
date: 2011-07-04T13:00:48+02:00
author: Sven Huisman
layout: post
guid: https://svenhuisman.com/?p=1986
permalink: /2011/07/hands-on-with-ericom-accessnow-for-vmware-view/
image: /wp-content/uploads/2011/07/Kinect.jpg
categories:
  - Virtual Desktop
tags:
  - Ericom
  - VDI
  - View
  - VMware
---
Do you remember when you first saw <a href="http://www.xbox.com/en-US/Kinect" target="_blank">Microsoft’s Xbox Kinect</a> in action? Playing games without a controller! It looked kind of dumb at first, people standing in front of a TV making exaggerated and weird moves, but when you tried Kinect yourself for the first time, it was fun to do and it worked pretty well. However, after a while it turns out that Kinect is a 1.0 version with it’s own limitations and you’ll have to wait for a year before new games will come out that use all the capabilities of the Kinect.

This is kind of the feeling I have now about <a href="http://www.ericom.com/html5_client_vmware_view.asp" target="_blank">Ericom AccessNow for VMware View</a>, the HTML5 client for VMware View. At first you think it’s probably not that good without a “real” VMware View client installed, but once you try it, you’re amazed how easy it is to setup and use it. After a short while, you&#8217;re starting to see the limitations the product still has and you’d rather wait for a next version which has more features and has a better user experience.

<!--more-->

It’s been on my to-do list for a couple of weeks now, but finally I had some time to play around and test with Ericom’s HTML5 client for VMware View. So why would I need AccessNow for VMware View? According to Ericom:

> &#8220;Ericom&#8217;s high performance HTML5 client is the first VDI solution to provide native support for Chromebooks, Safari, IE &#8211; virtually any browser using WebSockets and http protocols.&#8221;

In other words, all you need is a web-browser which is HTML5 compatible. It doesn’t require Flash, Java or any other software to be installed on the client.

**Installation and configuration**

Ericom AccessNow for VMware View is comprised of three installable components:

  * A collection of web resources (HTML files, CSS, JavaScript, images, etc.), which are installed on the View Connection server.
  * AccessNow server (WebSocket server) that is installed on the RDP hosts (the VDI desktops).
  * (Optional) Secure Gateway Service that provides secure, encrypted remote access to desktops and applications.

Installation was very easy. A simple “Next, Next, Finish” installation on the View Connection server and the VDI desktop. Keep in mind that only Windows 7 is supported as a virtual desktop. The Secure Gateway Service is optional, if you want to provide secure access to the virtual desktops. I haven’t installed it, because I was more interested in the User Experience.

No additional configuration is required, although you could tweak some settings like ports being used and change the default (self-signed) certificate usage.

**User Experience**

One of the advantages of using Ericom AccessNow for VMware View is that you just need a HTML5 compatible browser and don’t have to install a client. Since I use Internet Explorer 9 I immediately ran into the following error:

[<img style="background-image: none; padding-left: 0px; padding-right: 0px; display: inline; padding-top: 0px; border-width: 0px;" title="Websockets" src="https://svenhuisman.com/wp-content/uploads/2011/07/Websockets_thumb.png" border="0" alt="Websockets" width="395" height="126" />](https://svenhuisman.com/wp-content/uploads/2011/07/Websockets.png)

So I need to <span style="text-decoration: underline;">install</span> Google Chrome Frame if I want to use IE9 with Ericom AccessNow. I thought I didn&#8217;t have to install anything to use this product? Apparently, only the following browsers are supported:

  * Google Chrome 11 or higher
  * Apple Safari 5 or higher
  * Firefox 4 or higher
  * Microsoft IE 9 with Google Chrome Frame installed
  * Opera

And if you want to use Firefox or Opera, you have to enable WebSocket, because it’s disabled by default.

Back to my hands-on experience. I decided to install Google Chrome and this one worked immediately. I entered the Ericom address (<https://<viewConnectionserver/Ericom/view.html>), logged on and then the following screen was presented:

[<img style="background-image: none; padding-left: 0px; padding-right: 0px; display: inline; padding-top: 0px; border-width: 0px;" title="Ericom_logon" src="https://svenhuisman.com/wp-content/uploads/2011/07/Ericom_logon_thumb.png" border="0" alt="Ericom_logon" width="327" height="273" />](https://svenhuisman.com/wp-content/uploads/2011/07/Ericom_logon.png)

I pressed “Connect” and my desktop started. Here is a short video impression:

[swfobj src=&#8221;https://svenhuisman.com/wp-content/uploads/2011/07/Ericom.swf&#8221;]Ericom user experience

[/swfobj]

It works pretty well as you can see. So what are the disadvantages of this product?

  * You need a HTML5 compatible browser with WebSocket support. IE9 doesn’t have this by default.
  * USB redirection and audio are things you want to use in a VDI scenario. These don’t work with Ericom AccessNow.
  * Two-factor authentication, such as RSA SecurID are not yet supported.
  * This version is intended for use with devices that have a physical keyboard and mouse. I tested with an iPad and although it works, I can connect to a virtual desktop, I can’t use the on-screen keyboard of the iPad.

Now, what are the use cases of this product? If I think of situations where I can’t install a client, in a public internet-area or at a customer’s computer for example, most of the times there wouldn’t be a compatible browser available as well. One use case could be if you have a <a href="http://www.google.com/chromebook/" target="_blank">Google Chromebook</a>, on which you can’t install a VMware View client. Please comment on this blogpost if you can think of other use cases!

**Conclusion**

Unless you have a Google Chromebook or another device for which there is no <a href="http://www.vmware.com/products/view" target="_blank">VMware View</a> client, I don’t see the use case for Ericom AccessNow for VMware View. It’s like the Kinect for Microsoft Xbox, it’s nice that you can play games without a controller, but the technology is just not mature enough. I don’t use the Xbox very often, but when I do, I use a controller!

[<img style="background-image: none; padding-left: 0px; padding-right: 0px; display: inline; padding-top: 0px; border: 0px;" title="xboxcontroller" src="https://svenhuisman.com/wp-content/uploads/2011/07/xboxcontroller_thumb.jpg" border="0" alt="xboxcontroller" width="154" height="109" />](https://svenhuisman.com/wp-content/uploads/2011/07/xboxcontroller.jpg)