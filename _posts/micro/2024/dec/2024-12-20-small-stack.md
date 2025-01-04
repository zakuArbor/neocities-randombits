---
layout: micro
title:  "Stack Overflow: The Case of a Small Stack"
date: 2024-12-20
categories: [micro, stack, qnx, C]
permalink: micro/2024/12/:title
---

Years ago I was once asked by an intern to debug a mysterious crash that seemed so innocent. While I no longer recall what the code was about, we stripped the program to a single line in 
`main`. Yet the program still continued to crash.

**Source:**
{% highlight c %}
int main() {
    char buf[1024*1024*1024];
}
{% endhighlight %}

**Result:**
```
# ./prog-arm64 

Process 630803 (prog-arm64) terminated SIGSEGV code=1 fltno=11 ip=00000025333267f0 mapaddr=00000000000007f0 ref=000000443dd5dc50
Memory fault (core dumped) 
```

This bewildered all of the interns as it made absolutely no sense. Through our investigation, there was two things we noticed:
1. The program worked on our local machines but not on our target virtual machine
2. We were allocating an extremely large buffer in the stack which was unusual

It turns out the intern wanted to allocate a 1MiB buffer for some networking or driver related ticket. If I recall correctly, our target 
only had 512MB RAM so this could have explained the mysterious crash. But even 1MiB buffer on the stack was too large for our target:

**Source:**
{% highlight c %}
int main() {
	char buf[1024*1024];
}
{% endhighlight %}

**Result:**
```
# ./prog-arm64 

Process 696339 (prog-arm64) terminated SIGSEGV code=1 fltno=11 ip=0000004de7e7a7ec mapaddr=00000000000007ec ref=000000383b19fbe0
Memory fault (core dumped) 
```

One thing I purposely omitted was that our target was running QNX, a realtime operating system. If we were to take a look at the documentation:
> A process's main thread starts with an automatically allocated 512 KB stack
> -- [QNX SDP 8.0 - Stack Allocation](https://www.qnx.com/developers/docs/8.0/com.qnx.doc.neutrino.prog/topic/process_stack.html)

This shocked all of us since 1 MiB is not a large buffer in 2021 where we had plenty of memory on our own personal system at home. 

**Note 1:** The target used in the example was an aarch64le. This example will work on amd64 (x86_64) but requires you to add something such as a print statement

**Note 2:** QNX 8.0 was released to the general public in late 2023 or early 2024 so the actual target at the time when the question was asked was running either QNX 7.0 or QNX 7.1 (I do not recall which version)

The behavior for AMD64 (x86_64) as noted requires more fiddling to trigger a crash which came to my surprise. A slightly more detailed version will be released shortly on my [blog](https://zakuarbor.github.io/blog/small-stack/) 
which will include a very brief reason as to why AMD64 doesn't crash if nothing extra is added like a call to `puts`.
