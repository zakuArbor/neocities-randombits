---
layout: micro
title: "multiple definition of `variable` ... first defined here"
categories: [micro,gcc,c]
date: 2024-08-10
shorturl: multiple-def
permalink: micro/2024/08/multiple-def
---

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

