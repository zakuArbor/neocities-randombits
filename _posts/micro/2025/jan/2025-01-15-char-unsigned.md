---
layout: micro
title:  "The Sign of Char in ARM"
date: 2025-01-15
categories: [micro, arm, C/C++]
published: true
permalink: micro/2025/01/:title
---

The following below has a value that is vague:

```c
char i = -1;
``` 

The issue with the above line is that the value of `i` is not immediately obvious as compilers for different architectures could treat this as `signed` or `unsigned`. 
The signedness of a data type can be simply thought as whether or not there is a dedicated sign bit that indicates whether or not the number is postive or negative.

In Robert Love's section on "Signedness of Chars" (Chapter 19 - Portability) of his book on the Linux Kernel Development, he notes that on some systems such as in ARM 
would treat `char` as `unsigned` which goes against the logic of us AMD64 (x86-64) programmers. Effectively, the value of `i` will be stored as 255 rather than -1. 
The reason for this is apparently due to performance.

Let's verify this on my Raspberry Pi 4 machine running Linux:
```c
char i = -1;
if (i == 255) {
    printf("char is unsigned\n");
}
if (i == -1) {
    printf("char is signed\n");
}
```

**Result:** `char is unsigned`

Therefore to make your code portable, one should ensure to explicitly state whether or not `char` is signed or unsigned instead of making assumptions if they know 
their `char` will lie outside of 0 to 127.

I heard rumours that Apple may treat the signedness of `char` as `signed` instead but I unfortunately do not have access to an Apple ARM development machine to 
verify this myself.

Maybe I'll examine this more in my [blog](https://zakuarbor.github.io/blog/sign-of-char/) by examining what is going on under the hood and compare this with amd64 and 
whether or not QNX makes this change as well.

**Note:** I purposely omitted how signed bit works and the 2's complement


