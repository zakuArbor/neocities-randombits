---
layout: micro
title: Replacing main()
date: 2024-08-24
categories: [micro, gcc, c]
permalink: micro/2024/08/:title
---

Any beginner C programmer will know that the first function executed in any program is the `main()` function. However, that is not the entire 
truth. Just like how we have learned the Bohr and Lewis diagrams in Chemistry in Highschool, this is an oversimplification.  From my knowledge, 
the first function executed once the loader runs in a binary is `_start()`.

Without going into any details, we can replace `main()` with another function such as `foo()` (sorry for the lack of creativity).

{% highlight c %}
#include <stdio.h>
#include <stdlib.h>

int foo() {
  printf("Called foo\n");
  exit(0);
}

int main() {
  printf("Called main\n");
  return 0;
}
{% endhighlight %}

If we compile with `-e <entry>` where `<entry>` is the name of the function replacing `main()`, we can see the following results:
```
$ gcc foo.c -e foo
$ ./a.out 
Called foo
```

We can also observe from `objdump` and `nm` to see where the `start_address` of the C code is (here I am making a distinction between the 
first entry point of the C code and the binary).

<pre class = "highlight"><code><font color="#D0CFCC"><b>$ </b></font> objdump -f ./a.out | grep start
start address <font color="#C01C28"><b>0x0000000000401136</b></font>
<font color="#D0CFCC"><b>$ </b></font>nm ./a.out | grep foo
<b><font color="#C01C28">0000000000401136 T</font></b> foo</code></pre>

### Few Notes
1. You must define `main()` even if it's not going to be used. [CPP Reference](https://en.cppreference.com/w/c/language/main_function) states 
this explicitly:
> Every C program coded to run in a hosted execution environment contains the definition (not the prototype) of a function named main, which is the designated start of the program. 

    Neglecting to define `main` results in an error like the following:
```
$ gcc foo.c
/usr/bin/ld: /usr/lib/gcc/x86_64-redhat-linux/14/../../../../lib64/crt1.o: in function `_start':
(.text+0x1b): undefined reference to `main'
collect2: error: ld returned 1 exit status
```

2. The C program entry must call `exit()` to terminate if it is not `main()` or else a segfault will occur
```
$ ./a.out 
Called foo
Segmentation fault (core dumped)
```

    a backtrace via gdb won't give much information as to why. Probably best to consult with glibc. Essentially it is likely due to the fact 
that `_start` calls `exit` to terminate the program which probably does some cleaning via `atexit` and set the exit status `$?` to some value.
```
(gdb) bt 
#0  0x0000000000000001 in ?? ()
#1  0x00007fffffffdd46 in ?? ()
#2  0x0000000000000000 in ?? ()
```

### Random Links for later Research
* https://vishalchovatiya.com/posts/crt-run-time-before-starting-main/
* https://www.gnu.org/software/hurd/glibc/startup.html
