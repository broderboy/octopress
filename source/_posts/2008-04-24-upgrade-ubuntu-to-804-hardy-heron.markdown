--- 
layout: post
title: Upgrade Ubuntu to 8.04 Hardy Heron
wordpress_url: http://beta.timbroder.com/2008/04/24/upgrade-ubuntu-to-8-04-hardy-heron/
date: 2008-04-24 14:09:00 -04:00
comments: true
---
Hardy Heron came out this morning and ubuntu.com is very much down for the count
<br /><br />
You can Still update though, click <a href="http://72.14.205.104/search?q=cache:maBlktBTwPAJ:www.ubuntu.com/getubuntu/upgrading+upgrade+ubuntu&hl=en&ct=clnk&cd=1&gl=us&client=firefox-a">here</a> for the Google Cache version.<br /><br />

Happy Updating!
<br /><br />

New Features in this release:
<br /><br /><a href="https://wiki.ubuntu.com/UbiquityPreserveHome">Install on an existing filesystem without overwriting /home</a><br /> When I moved from feisty to gutsy, I decided to do a fresh install. One of the things I had to do was back up my home folder, and when I finished installing gutsy I just copied it back onto my computer. This new feature will allow people to install the new version of Ubuntu without it overwriting their home folder.I'm sure this will come in very handy for people who like trying out different distro's.<br /> <span class="fullpost"><br /> <span style="font-weight: bold"><a href="https://wiki.ubuntu.com/DesktopTeam/Specs/HardyHardwareDetection">Hardy Hardware Detection</a><br /> </span>This is more of a bug fix than a new feature. Gutsy already has excellent hardware support and the plan for hardy is even better and more robust detection of hardware. Sounds good to me.
<br /><br /><a href="https://wiki.ubuntu.com/DesktopTeam/Specs/GdmFaceBrowser">GDM Face Browser</a><br /> </span>One of the changes I made to my gutsy is the GDM. I replaced the old one with something that allows me to just click on a picture of my username and login. This will hopefully be the default for hardy.

<br /><br /><a href="https://wiki.ubuntu.com/X/AutodetectMonitorFrequency"><span style="font-weight: bold">Auto Detection of Monitor Frequency</span></a><br /> While I was testing gutsy beta I had to manually configure xorg.conf to get it to the right resolution. It wasn't fun. This should be a thing of the past with hardy as it will automatically detect everything for you. Huzzah!
<br /><br /><a href="https://wiki.ubuntu.com/AptAuthenticationReliability"><span style="font-weight: bold">Apt Authentication Reliability</span></a><br /> Have you ever had an update fail for no reason? Well it actually fails because of 'transient network failures'. The aim is to make hardy more robust against these errors.
<br /><br /><a href="https://wiki.ubuntu.com/DesktopTeam/Specs/RestrictedManagerRewrite">Redesign Restricted-Manager Code</a><br /> They want to expand the role of the restricted manager and change it so that other distro's can share the joy.<span style="font-weight: bold"><br /> </span><a href="https://wiki.ubuntu.com/HardyFullDiskHandling"><br /> <span style="font-weight: bold">Handling Full Disks</span></a><br /> I've never had this problem with Ubuntu, but if your disk gets full, things can get quite ugly. They plan to add a notification and disk clean-up tool when your running low on space.

<br /><br /><a href="https://wiki.ubuntu.com/DesktopTeam/Specs/HardyDesktopEffects"><span style="font-weight: bold">Desktop Effects</span></a><br /> Make compiz fusion more robust and easier to use.
<br /><br /><a href="https://wiki.ubuntu.com/DesktopTeam/Specs/HardyTheme"><span style="font-weight: bold">New Theme</span></a><br /> Hardy Heron will be getting a shiny new theme, I hope they move away from the brown theme and choose something lighter and more fresh.
<br /><br /><a href="https://wiki.ubuntu.com/EasyFileSharing">Easy File Sharing</a><br /> To allow people to easily share files over a network. Not more I can say about this.
<br /><br /><a href="https://blueprints.launchpad.net/ubuntu/+spec/multi-monitor-config"><span style="font-weight: bold">Dual/Multi Monitor Support</span></a><br /> Currently you have to manually tweak Ubuntu if you want to use more than one monitor. They want to fix this for hardy.
<br /><br /><a href="https://wiki.ubuntu.com/DesktopTeam/Specs/Prefetch"><span style="font-weight: bold">Integrate Prefetch into Ubuntu</span></a><br /> I noticed a slightly increased start up time in gutsy compared to feisty. Hardy will use file prefetch and other optimisations to speed up boot time.

<br /><br /><a href="https://wiki.ubuntu.com/Automatix/Ubuntu_Team_Collaboration?highlight=%20automatix%20#81830218674224151">Automatix-Ubuntu Team Collaboration</a><br /> Automatix was extremely helpful for me in feisty. Although I don't use it in gutsy, its good that they are collaborating with the automatix team.
<br /><br /><a href="https://wiki.ubuntu.com/SingleClickInstall"><span style="font-weight: bold">Single Click Install</span></a><br /> Installing software is already pretty straightforward in Ubuntu. They want to make it even easier to install third party applications. I'm not complaining.
<br /><br /><a href="https://wiki.ubuntu.com/HardyAppArmor"><span style="font-weight: bold">Apparmor Integration</span></a><br /> This is already a part of gutsy, the plan is to increase integration to make Ubuntu even safer.
<br /><br /><a href="https://blueprints.launchpad.net/ubuntu/+spec/ubuntu-firewall"><span style="font-weight: bold">Firewall</span></a><br /> Make it easier for users to configure their firewall.
<br /><br /><a href="https://blueprints.launchpad.net/ubuntu/+spec/third-party-apt"><span style="font-weight: bold">Third Party Apt</span></a><br /> Now when you install third party apps, you have to manually add the software repository to the sources.list. This spec makes it easy for users to install third party software and have it update automatically.

<br /><br /><a href="https://wiki.ubuntu.com/DesktopTeam/Specs/ExitStrategy"><strong>Revamped Logout Screen</strong></a><br /> They want to streamline the options you have when you click that big red button, to make things less confusing.
<br /><br /><a href="https://blueprints.launchpad.net/ubuntu/+spec/better-integrated-wine"><span style="font-weight: bold">Better Integrated Wine</span></a><br /> Better Wine will make it easier for Windows users to convert, thus helping to solve <a href="https://blueprints.launchpad.net/bugs/1">bug #1</a>.
<br /><br /><a href="https://wiki.ubuntu.com/Xorg7.3Integration"><span style="font-weight: bold">Xorg 7.3</span></a><br /> This is one of the features that missed the gutsy deadline. This should make manual configuration of xorg.conf obsolete. Another much anticipated feature is Bullet Proof X, which will go into a graphical safe mode if anything goes wrong with X.
<br /><br /><a href="https://wiki.ubuntu.com/SlickBoot"><span style="font-weight: bold">Slick Boot</span></a><br /> To improve the boot and shutdown process and also make the things look nicer.
