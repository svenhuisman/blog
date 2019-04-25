---
id: 23008
title: 'VMware Identity Manager change expired password bug'
date: 2017-03-28T11:45:27+02:00
author: Sven Huisman
layout: post
guid: http://SvenHuisman.com/?p=23008
permalink: /2017/03/vmware-identity-manager-change-expired-password-bug/
categories:
  - Virtual Desktop
tags:
  - bug
  - Identity Manager
  - Linux
  - VMware
  - Workspace ONE
---
If you use VMware Identity Manager (IDM) to provide access to your apps and desktops to your users, it&#8217;s important to remember that IDM is a virtual appliance based on Suse Linux. Why? Case-sensitive usernames is not an issue in Windows domains. But with Linux systems it does make a difference. Today I discovered that when a user has an expired domain password and logs on to the VMware Identity Manager portal, it matters if the user has uppercases in the username and if this uppercases are also used during login. If not, the password change is unsuccessful. In my opinion, a bug in IDM.

Here is an example to illustrate this bug:

In Active Directory, I created a user with username: SvenHuisman (capital S and capital H in the username). The user must change the password at next logon.

[<img class="aligncenter size-full wp-image-23009" src="https://svenhuisman.com/wp-content/uploads/2017/03/AD-user.png" alt="" width="347" height="340" />](https://svenhuisman.com/wp-content/uploads/2017/03/AD-user.png)

I log in to the IDM portal with username &#8220;svenhuisman&#8221; (all lowercases):

[<img class="aligncenter size-large wp-image-23010" src="https://svenhuisman.com/wp-content/uploads/2017/03/idm1.png" alt="" width="323" height="429" srcset="https://svenhuisman.com/wp-content/uploads/2017/03/idm1.png 323w, https://svenhuisman.com/wp-content/uploads/2017/03/idm1-264x350.png 264w" sizes="(max-width: 323px) 100vw, 323px" />](https://svenhuisman.com/wp-content/uploads/2017/03/idm1.png)

I get the message: Password has expired. Please set a new password.

[<img class="aligncenter size-large wp-image-23011" src="https://svenhuisman.com/wp-content/uploads/2017/03/idm2.png" alt="" width="325" height="473" srcset="https://svenhuisman.com/wp-content/uploads/2017/03/idm2.png 325w, https://svenhuisman.com/wp-content/uploads/2017/03/idm2-240x350.png 240w" sizes="(max-width: 325px) 100vw, 325px" />](https://svenhuisman.com/wp-content/uploads/2017/03/idm2.png)

So I enter the old password and two times the new password:

[<img class="aligncenter size-large wp-image-23012" src="https://svenhuisman.com/wp-content/uploads/2017/03/idm3.png" alt="" width="317" height="471" srcset="https://svenhuisman.com/wp-content/uploads/2017/03/idm3.png 317w, https://svenhuisman.com/wp-content/uploads/2017/03/idm3-236x350.png 236w" sizes="(max-width: 317px) 100vw, 317px" />](https://svenhuisman.com/wp-content/uploads/2017/03/idm3.png)

&#8220;Your old password is incorrect&#8221;. That&#8217;s strange, right?

[<img class="aligncenter size-large wp-image-23013" src="https://svenhuisman.com/wp-content/uploads/2017/03/idm4.png" alt="" width="309" height="499" srcset="https://svenhuisman.com/wp-content/uploads/2017/03/idm4.png 309w, https://svenhuisman.com/wp-content/uploads/2017/03/idm4-217x350.png 217w" sizes="(max-width: 309px) 100vw, 309px" />](https://svenhuisman.com/wp-content/uploads/2017/03/idm4.png)

Let&#8217;s try again, but now with username &#8220;SvenHuisman&#8221;:

[<img class="aligncenter size-large wp-image-23014" src="https://svenhuisman.com/wp-content/uploads/2017/03/idm5.png" alt="" width="313" height="424" srcset="https://svenhuisman.com/wp-content/uploads/2017/03/idm5.png 313w, https://svenhuisman.com/wp-content/uploads/2017/03/idm5-258x350.png 258w" sizes="(max-width: 313px) 100vw, 313px" />](https://svenhuisman.com/wp-content/uploads/2017/03/idm5.png)

Again the message &#8220;Password has expired&#8221;:

[<img class="aligncenter size-large wp-image-23015" src="https://svenhuisman.com/wp-content/uploads/2017/03/idm6.png" alt="" width="314" height="467" srcset="https://svenhuisman.com/wp-content/uploads/2017/03/idm6.png 314w, https://svenhuisman.com/wp-content/uploads/2017/03/idm6-235x350.png 235w" sizes="(max-width: 314px) 100vw, 314px" />](https://svenhuisman.com/wp-content/uploads/2017/03/idm6.png)

After entering the old password and two times the new password, I&#8217;m able to login (and the expired password is changed):

[<img class="aligncenter size-large wp-image-23016" src="https://svenhuisman.com/wp-content/uploads/2017/03/idm7.png" alt="" width="650" height="251" srcset="https://svenhuisman.com/wp-content/uploads/2017/03/idm7.png 799w, https://svenhuisman.com/wp-content/uploads/2017/03/idm7-350x135.png 350w, https://svenhuisman.com/wp-content/uploads/2017/03/idm7-768x297.png 768w, https://svenhuisman.com/wp-content/uploads/2017/03/idm7-650x251.png 650w" sizes="(max-width: 650px) 100vw, 650px" />](https://svenhuisman.com/wp-content/uploads/2017/03/idm7.png)

I reported this as a bug with VMware support. I will let you know when I get feedback and when (or if) this will be fixed.