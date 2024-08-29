---
layout: micro
title: Splitting Pdfs into Even and Odd Pages
date: 2024-08-28
categories: [micro, printer, pdf, utilities]
permalink: micro/2024/08/:title
---

During the winter break I have obtained an old Xerox XE88 Workstation Printer released in the year of 2000, the year where the media were 
worried about Y2K causing havok to our digital infrastructure which never came to the scale we all feared thankfully. Though of course 
[a bug will eventually will creep and wreck havok](https://en.wikipedia.org/wiki/2024_CrowdStrike_incident)(i.e. Crowdstrike Falcon Update). 
But I digress, using this printer was filled with frustration as it is a relic from the past that is not meant to be used in 2024. 
Firstly, the printer requires a parallel port which no modern computer comes equip with. I have to drag out my last surviving desktop from my childhood that originally came with 
[Windows Me](https://en.wikipedia.org/wiki/Windows_Me) that we immediately switched to the glorious Windows XP that we all know, love and 
dearly miss. As it turns out a few months later after my first use of the printer, my PS/2 connected mouse stopped working. I do not know if 
the [PS/2 port](https://en.wikipedia.org/wiki/PS/2_port) is broken or if my PS/2 mouse is broken. I did manage to find another PS/2 mouse but as it was water damaged from a basement 
leak a few years ago, there was little chance it would work. Without a mouse made this task much harder, but I digress. 

<div class = "dual-image-container">
<img style = "width: 300px" src = "https://upload.wikimedia.org/wikipedia/commons/thumb/f/f4/Mini-Centronics_36_pin_with_Micro-Centronics_36_pin.jpg/1920px-Mini-Centronics_36_pin_with_Micro-Centronics_36_pin.jpg" alt = "Parallel Port and connector">
<img src = "https://upload.wikimedia.org/wikipedia/commons/thumb/5/54/PS2_keyboard_and_mouse_jacks.jpg/300px-PS2_keyboard_and_mouse_jacks.jpg">
<p class = "caption">Parallel Port</p>
<p class = "caption">PS/2 Port typically found in desktops from the 90s</p>
</div>

Placing aside the hardware struggles to operate such printer in 2024, the printer does not have duplex printing so I had run commands on my 
pdfs on my Linux machine before transferring the files to my Windows XP machine (thankfully there are USB ports on this desktop that work 
or else I would have to dust off my 3.5 inch floppy disks and CDs). To split pdfs into even and odd pages turns out to be a very simple 
command:

{% highlight bash %}
pdftk A="${file}" cat Aodd output "${file}-odd.pdf"
pdftk A="${file}" cat Aeven output "${file}-even.pdf"
{% endhighlight %}

As I am printing a bunch of papers on [Trusted Computing](https://en.wikipedia.org/wiki/Trusted_Computing), I needed to split a lot of PDFs 
so this task can get quite tedious so I wrote a simple shell script:
{% highlight bash %}
for file in *pdf; do
  pdftk A="${file}" cat Aodd output "${file}-odd.pdf"
  pdftk A="${file}" cat Aeven output "${file}-even.pdf"
done
{% endhighlight %}

