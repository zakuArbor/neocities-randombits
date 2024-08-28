---
layout: micro
title: Executing Script Loophole
date: 2024-08-28
categories: [micro, script, linux]
permalink: micro/2024/08/:title
---

I recently came across an [article](https://lwn.net/Articles/982085/) discussing an attempt to close a loophole bypassing the normal 
execution permission bit. Exploiting a program suid and euid to gain high privilige is a commonly known technique called privilege 
escalation. This article does not cover this but it introduces a flaw in the current way Linux handles the execution of scripts. I 
do not know why privilige escalation came to my mind but as I wrote nonesense, I shall keep it here for now. The article gives a neat 
example where a script does not have execution bit but is still executable by invoking the script via an interpreter.

```
$ ls -l evil-script.py 
-rw-r--r--. 1 zaku zaku 86 Aug 28 00:20 evil-script.py
$ ./evil-script.py
bash: ./evil-script.py: Permission denied
$ python3 evil-script.py 
Evil script has been invoked. Terror shall fill this land
```

As you can see, the script has no execute bit set. However, the script is still executable by feeding the script to the interpreter.
I have never considered this a security loophole but after reading the article, I realized there are some concerns of allowing scripts 
to be executable bypassing the file's permission. I have always made the habit of running many of the interpreted scripts non-executable 
and fed them to the interpreter due to laziness (I know it's a one time thing to set the execute bit but I am just lazy to run `chmod`).

The article covers some promising approaches so I do expect a solution to be merged into the kernel sometime in the near future which will 
force me to change my habits once the interpreters make the change. Though if interpreters do make this patch, I do expect quite a few 
production and CI/CD servers to be impacted as there will always be someone like me who are lazy to set the execute bit on our scripts.

One benefit of closing this loophole is to force users to deliberately make the conscious choice to set the execute bit similar to how we have to 
set the flatpaks we download as executables (at least from my personal experience) before we can execute the flatpaks.
