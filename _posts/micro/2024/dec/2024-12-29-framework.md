---
layout: micro
title:  "New Laptop: Framework 16"
date: 2024-12-29
categories: [micro]
published: false
permalink: micro/2024/10/:title
---

Ever since [Linus Tech Tips (LTT)](https://www.youtube.com/watch?v=0rkTgPt3M4k) introduced Framework, a repairable and modular laptop, back in 2021, I always wanted one for myself. I always loved the idea of modular electronics 
ever since [PhoneBloks](https://www.onearmy.earth/project/phonebloks) introduced their idea of modular phones. Electronics that are modular are usually highly repairable due to the fact that one can easily swap a faulty 
component with a new component instead of going to a repair shop or dumping the phone into the garbage. The appeal of bringing the desktop experience of being able to upgrade various parts such as the CPU, RAM and storage to the laptop 
was very appealing. Electronics of the past were much easier to repair and upgrade but these days laptops are designed to not be easily upgradable such as the use of soldered RAM. 
Laptops are also designed to not be as repairable as it once was with the use of integrating more components into the SoC which allows manufacturers to significantly design a more 
compact and sleeker device. There are lots of benefits of SoC than just compactness, it also can help with power efficiency and speed as it can be optimized to have fast access to both the 
CPU and memory. While there could be engineering reasons to soldered RAM, it is likely to also encourage consumers to purchase a new laptop instead.

![An image of the Framework laptop]({{site.baseurl}}/assets/products/framework-parts.png)

<p class = "caption">A Framework laptop and its various parts. Source: <a href = "https://frame.work/ca/en">Framework</a></p>

The Framework laptop is great but every criticism you have heard about the Framework laptop holds true. Cost is the biggest issue with Framework laptops. As Framework is a small company, it cannot build in scale unlike the other OEMs. You will be paying an extremely hefty price to obtain a modular laptop. You could get a laptop 
from other OEMs with better specs for way less than what Framework offers. The laptop is not suitable for the regular consumers and is way more expensive than a luxurious laptop (aka Macbooks). There are other issues with the Framework 
laptop but I consider this to not be the cost of Framework but rather the cost of modularity. As I mentioned earlier, there are tradeoffs between modularity and integrating everything into 
an SoC. When you are getting a Framework laptop, you are buying the laptop for its modularity and repairability. For instance, when you buy a Framework 16 for instance, you can see the 
outlines of the various sliders around the keyboard and touchpad. In addition, you can clearly see the outlines of each expansion card on the laptop.

On a very positive note, you can swap the expansion cards to fit your needs and for those who care about colors, you can easily swap the colors of the screen bezel and the panels surrounding 
the keyboard such as adding a numpad, swapping the keyboard for an RGB keyboard, or getting an LED matrix panel. The flexibility to change the expansion cards was the biggest appeal 
of the laptop for me as you get to choose which IO ports will be HDMI, USB-As, or USB-Cs (with some restrictions).

I should keep this more brief as this is a microblog ... Anyhow, now that I have access to my first dedicated GPU, I can now play video games that isn't Minesweeper, Solitaire, 
Starcraft (Broodwar) and PC ports of old games like Final Fantasy 7. Ever since players were forced to move onto Counterstrike 2, I was no longer able to play CounterStrike with my old Lenovo Gen 7 X1 Carbon 
laptop. I was surprised by how noisy the laptop can be when playing Counterstrike 2 though that is likely due to my inexperience playing videogames that requires a dedicated GPU (and 
I am playing on a laptop which is probably not the best idea if you want to play videogames). 
Here's the specs:

<pre class="highlight" style="background-color: #1b1b1b; padding: .5rem; line-height: 1.25em">$ neofetch
<font color="#2A7BDE"><b>             .&apos;,;::::;,&apos;.</b></font>                <font color="#2A7BDE"><b>zaku</b></font>@<font color="#2A7BDE"><b>fedora</b></font> 
<font color="#2A7BDE"><b>         .&apos;;:cccccccccccc:;,.</b></font>            ----------- 
<font color="#2A7BDE"><b>      .;cccccccccccccccccccccc;.</b></font>         <font color="#2A7BDE"><b>OS</b></font>: Fedora Linux 40 (Workstation Edition) x86_64 
<font color="#2A7BDE"><b>    .:cccccccccccccccccccccccccc:.</b></font>       <font color="#2A7BDE"><b>Host</b></font>: Laptop 16 (AMD Ryzen 7040 Series) AJ 
<font color="#2A7BDE"><b>  .;ccccccccccccc;</b></font><b>.:dddl:.</b><font color="#2A7BDE"><b>;ccccccc;.</b></font>     <font color="#2A7BDE"><b>Kernel</b></font>: 6.11.4-201.fc40.x86_64 
<font color="#2A7BDE"><b> .:ccccccccccccc;</b></font><b>OWMKOOXMWd</b><font color="#2A7BDE"><b>;ccccccc:.</b></font>    <font color="#2A7BDE"><b>Uptime</b></font>: 5 hours, 46 mins 
<font color="#2A7BDE"><b>.:ccccccccccccc;</b></font><b>KMMc</b><font color="#2A7BDE"><b>;cc;</b></font><b>xMMc</b><font color="#2A7BDE"><b>:ccccccc:.</b></font>   <font color="#2A7BDE"><b>Packages</b></font>: 2254 (rpm), 12 (flatpak) 
<font color="#2A7BDE"><b>,cccccccccccccc;</b></font><b>MMM.</b><font color="#2A7BDE"><b>;cc;</b></font><b>;WW:</b><font color="#2A7BDE"><b>:cccccccc,</b></font>   <font color="#2A7BDE"><b>Shell</b></font>: bash 5.2.26 
<font color="#2A7BDE"><b>:cccccccccccccc;</b></font><b>MMM.</b><font color="#2A7BDE"><b>;cccccccccccccccc:</b></font>   <font color="#2A7BDE"><b>Resolution</b></font>: 1920x1080 
<font color="#2A7BDE"><b>:ccccccc;</b></font><b>oxOOOo</b><font color="#2A7BDE"><b>;</b></font><b>MMM0OOk.</b><font color="#2A7BDE"><b>;cccccccccccc:</b></font>   <font color="#2A7BDE"><b>DE</b></font>: GNOME 46.6 
<font color="#2A7BDE"><b>cccccc:</b></font><b>0MMKxdd:</b><font color="#2A7BDE"><b>;</b></font><b>MMMkddc.</b><font color="#2A7BDE"><b>;cccccccccccc;</b></font>   <font color="#2A7BDE"><b>WM</b></font>: Mutter 
<font color="#2A7BDE"><b>ccccc:</b></font><b>XM0&apos;</b><font color="#2A7BDE"><b>;cccc;</b></font><b>MMM.</b><font color="#2A7BDE"><b>;cccccccccccccccc&apos;</b></font>   <font color="#2A7BDE"><b>WM Theme</b></font>: Adwaita 
<font color="#2A7BDE"><b>ccccc;</b></font><b>MMo</b><font color="#2A7BDE"><b>;ccccc;</b></font><b>MMW.</b><font color="#2A7BDE"><b>;ccccccccccccccc;</b></font>    <font color="#2A7BDE"><b>Theme</b></font>: Adwaita [GTK2/3] 
<font color="#2A7BDE"><b>ccccc;</b></font><b>0MNc.</b><font color="#2A7BDE"><b>ccc</b></font><b>.xMMd</b><font color="#2A7BDE"><b>:ccccccccccccccc;</b></font>     <font color="#2A7BDE"><b>Icons</b></font>: Adwaita [GTK2/3] 
<font color="#2A7BDE"><b>cccccc;</b></font><b>dNMWXXXWM0:</b><font color="#2A7BDE"><b>:cccccccccccccc:,</b></font>      <font color="#2A7BDE"><b>Terminal</b></font>: gnome-terminal 
<font color="#2A7BDE"><b>cccccccc;</b></font><b>.:odl:.</b><font color="#2A7BDE"><b>;cccccccccccccc:,.</b></font>       <font color="#2A7BDE"><b>CPU</b></font>: AMD Ryzen 9 7940HS w/ Radeon 780M Graphics (16) @ 5.263GHz 
<font color="#2A7BDE"><b>:cccccccccccccccccccccccccccc:&apos;.</b></font>         <font color="#2A7BDE"><b>GPU</b></font>: AMD ATI c4:00.0 Phoenix1 
<font color="#2A7BDE"><b>.:cccccccccccccccccccccc:;,..</b></font>            <font color="#2A7BDE"><b>GPU</b></font>: AMD ATI Radeon RX 7600/7600 XT/7600M XT/7600S/7700S / PRO W7600 
<font color="#2A7BDE"><b>  &apos;::cccccccccccccc::;,.</b></font>                 <font color="#2A7BDE"><b>Memory</b></font>: 7192MiB / 31386MiB 
</pre>

On OpenBlender Benchmark:
```
monster: 130.805407
junkshop: 85.742239
classroom:64.374681
```

Which is significantly better than what my X1 Carbon achieved (where higher numbers are better).
