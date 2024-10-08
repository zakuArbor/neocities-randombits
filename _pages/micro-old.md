---
layout: page
title: µBlog
permalink: micro-old
---


<a name = "edit-gifs">
<div class = 'bits'><h2 class = 'title'>Editing GIFS and Creating 88x31 Buttons</h2><p class = 'date'>2024-08-18</p>

Lately I have been learning how to edit GIFS and it is painstaking difficult to remove a background from a GIF without using an 
AI tool, especially when the image has over 70 frames. There is likely an easier way to edit GIFs but I had to manually edit over 50 
frames, erasing the clouds from a GIF using the eraser tool frame by frame which took some time to finish. <br/>

<b>Original:</b>

<div class="tenor-gif-embed" data-postid="26494068" data-share-method="host" data-aspect-ratio="2.19178" data-width="100%"><a href="https://tenor.com/view/flying-pikachu-transparent-balloon-pikachu-pokemon-yellow-pikachu-pokemon-gif-26494068">Flying Pikachu Transparent Balloon Pikachu Sticker</a>from <a href="https://tenor.com/search/flying+pikachu+transparent-stickers">Flying Pikachu Transparent Stickers</a></div> <script type="text/javascript" async src="https://tenor.com/embed.js"></script>

<b>Result:</b>

<img src = "{{ site.baseurl }}/assets/gifs/flying-pikachu-3.gif">

However, if you are not editing a GIF 
but rather trying to incorporate the GIF into your 88x31 buttons, it turns out to be quite simple. Following the instructions from 
<a href = "https://www.youtube.com/watch?v=3XfrnY4mb5o">a video on Youtube</a>, I managed to create a few simple 88x31 buttons that have 
features cats, coffee, and the two programs I am or finished studying (i.e. doing a 2nd degree):

<div class = "quick-badges">
<div><img src = "pixel button for coffee" src = "{{ site.baseurl }}/assets/buttons/coffee-powered.gif"></div>
<div><img src = "pixel button for chi cat cs major" src = "{{ site.baseurl }}/assets/buttons/cs-cat.gif"></div>
<div><img src = "pixel button for confused cat in math" src = "{{ site.baseurl }}/assets/buttons/math-major.gif"></div>
</div>

To resize the gifs, I used <a href = "https://ezgif.com/resize">ezgif resize tool</a> to set the height to be 31px since I didn't know 
how to resize GIFs on GIMP as it would open a bunch of layers. I guess I could have used ffmpeg but using an online tool is just more 
convenient and easier. I do wonder if there are other standard anti-pixel button sizes aside from 80x15 pixels because a height of 
31 pixels is quite limiting. It's amazing what the community has been able to do with such limiting number of pixels.

<div class = "quick-badges">
<div><img src = "pixel button for C Programming" src = "{{ site.baseurl }}/assets/buttons/c.png"></div>
<div><img src = "pixel button for Perl" src = "{{ site.baseurl }}/assets/buttons/perl.png"></div>
<div><img src = "pixel button for Bash" src = "{{ site.baseurl }}/assets/buttons/bash.png"></div>
<div><img src = "pixel button for LATEX" src = "{{ site.baseurl }}/assets/buttons/latex.png"></div>
</div>

For instance, the Bash button I have made has the subtitle "THE BOURNE-AGAIN SHELL" which is very hard to make out. I am assuming the standard 
practice is to render the button as a GIF and display the text on the next frame. That way users would be able to see the full-text.

</div>
<hr class = 'bits-hr'/>

<a name = "extern">
<div class = 'bits'><h2 class = 'title'>multiple definition of `variable` ... first defined here</h2><p class = 'date'>2024-08-10</p>
Randomly I decided to compile some old projects I worked on and I was surprised to see a few 
compilation errors in an assembler I wrote years back. As it has been many years since I last touched most of the projects I looked at, I was 
pleased to see the compiler catching obvious mistakes I had made in the past. Though this did come to a surprise as to why the compiler I used 
years ago never complained such obvious mistakes. The solution and reason for the last compilation error was not immediate to me:

<pre><code>$ make
gcc -o assembler assembler.c symbol_table.c parser.c  -fsanitize=address -lasan
/usr/bin/ld: /tmp/cc1MoBol.o:(.bss+0x0): multiple definition of `table'; /tmp/cc0B4XxW.o:(.bss+0x0): first defined here
/usr/bin/ld: /tmp/cc1MoBol.o:(.bss+0x81): multiple definition of `__odr_asan.table'; /tmp/cc0B4XxW.o:(.bss+0x40): first defined here</code></pre>

At first I thought I may had made a stupid mistake and defined the struct called <i>table</i> twice but all I could find was <code>symbol_table.h</code>, the file that declared the variable, 
being included by <code>assembler.c</code> and <code>parser.c</code>. This led to the conclusion there must have been a compiler behavioral change between GCC 9 and 
GCC 14. After a quick googling and going through going through the <a href = "https://gcc.gnu.org/gcc-10/changes.html">Release Notes</a>, it turns out that starting from 
GCC 10, <code>GCC now defaults to -fno-common</code>:

<blockquote>GCC now defaults to -fno-common. As a result, global variable accesses are more efficient on various targets. In C, global variables with multiple tentative definitions now result in linker errors. With -fcommon such definitions are silently merged during linking.
</blockquote>

In the <a href = "https://gcc.gnu.org/gcc-10/porting_to.html">Porting to GCC 10</a> webpage, the developers of GCC notes:

<blockquote>
A common mistake in C is omitting extern when declaring a global variable in a header file. If the header is included by several files it results in multiple definitions of the same variable
</blockquote>

To resolve this issue, one can either silently ignore their mistake and compile with <code>-fcommon</code> or to correctly declare the global variable with the <code>extern</code> keyword.

</div><hr class = 'bits-hr'/>

<a name = "framework-power">
<div class = 'bits'><h2 class = 'title'>Delusional Dream of a OpenPower Framework Laptop</h2><p class = 'date'>2024-08-04</p>
Framework is a company that makes modular and repairable laptops that has captured the interests of tech enthusiasts over the past 4 years. 
Currently Framework laptops are limited to x86-64 architecture supporting Intel and later AMD CPUs in 2023. Although Framework laptops are not 
entirely open source, they have <a href = "https://github.com/FrameworkComputer">open source a decent chunk of their work</a> from my understanding and 
which allows third party development of components and makes partnership possible for other companies such as 
<a href = "https://frame.work/ca/en/blog/introducing-a-new-risc-v-mainboard-from-deepcomputing" alt = "Framework announcement of introducing a RISC-V mainboard">
DeepComputing to release a mainboard that runs a RISC-V CPU
</a>. While the new mainboard will not be usable for everyday applications, it is a step forward to a more open ecosystem and this is an exciting step for both 
Framework, RISC-V and the broader open-advocate community. This announcement makes me wonder the possibility of OpenPower running on a Framework laptop. 
Similarly to RISC-V, there isn't an easily accessible way to obtain a consumer product running on OpenPower (aside from Raptor Computing with their 
extremely expensive machines). There is the 
<a href = "https://www.powerpc-notebook.org/en/" alt = "PowerPC NoteBook Community Page">
PowerPC Notebook project
</a> ran by a group of volunteers who are trying to develop an open source PowerPC notebook to the hands of hobbyists. It would be interesting 
if OpenPower community could also partner with Framework to develop a mainboard once the project is complete and the software is more matured. 
However, this would be a difficult step as there is no dedicated company like DeepComputing that will pour resources into making this happen. 
The interest into OpenPower is low and overshadowed by the wider industry interest in expanding the ARM and RISC-V architecture to consumers. 
IBM made a huge mistake in open sourcing the POWER architecture too late. But one could always dream (even if it's delusional) :D
</div><hr class = 'bits-hr'/>


<a name = "2024-update">
<div class = 'bits'><h2 class = 'title'>2024 Update</h2><p class = 'date'>2024-08-04</p>
<b>Website</b><br/>
<p>
In the past year I have been very lazy as evident with my <a href = "https://zakuarbor.github.io/blog/" alt = "Personal Blog">lack of activity on my personal blog</a>.
I'm now trying to pick up blogging again. It's hard to believe that it's been almost an entire year since I created this neocity site, which has almost 0 updates since. 
I've been thinking about how to use this site since I already have a blog on GitHub Pages. Honestly, I forgot this corner existed, and it’s been bothering me that I couldn’t write my random, nonsensical thoughts because my main blog wouldn’t be a suitable medium until now.
So, I’ve decided that this corner will be a microblog where I can share random articles and thoughts. A microblog is different from a regular blog in that the content is much shorter. This space will allow me to quickly jot down something random. I hope that a collection of these random posts will evolve into a blog post or spark an idea for my final year thesis or project.
<p/>

<b>How are my studies going?</b><br/>
<p>
I’m still studying Mathematics, but I’ve lost much of my initial interest in the field after taking a few third-year courses. 
I ended up taking fewer Math courses, which puts my ability to graduate on time at risk. 
Listening to lectures and reading about abstract groups and rings made me really miss programming and computer science. 
<img src = "{{site.baseurl}}/assets/gifs/onion/study-confused.gif"/>
Despite this, there were still some Math courses I enjoyed, such as Combinatorics and Real Analysis. 
However, I didn’t last long in the follow-up Real Analysis courses that covered Stone-Weierstrass and Commutative C* Algebra. 
Feeling tired of abstract Mathematics, I decided to take a break and pursue an internship at a telecommunications enterprise.</p>

<img src = "{{ site.baseurl }}/assets/gifs/graph-retro-computer.webp" alt = "retro computer fiddling with excel"/>

<b>What am I doing Now?</b><br/>
<p>As mentioned, I am currently doing a year-long internship with a telecommunications enterprise. Although the job isn't very exciting, it's a welcome break from Mathematics. This would typically be a great chance to catch up on my Computer Science studies by delving into textbooks and online resources, but I’ve been quite lazy. Instead, I've been focusing on learning French, a language I've always wanted to master. I started learning French in elementary school, as it’s a requirement in Canada. While it might make more sense to learn my mother tongue, I’m opting to learn French, which might seem confusing to some. For context, I don't have an English name and was born in some Asian country but I am unable to communicate with others in my mother tongue.</p>

