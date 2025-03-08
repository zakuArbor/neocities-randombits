---
layout: micro
title:  "Compiling and Running AARCH64 on x86-64 (amd64)"
date: 2025-03-07
categories: [micro, c/c++, linux, gcc]
published: true
permalink: micro/2025/02/:title
---

Cross-compilation targetting ARM architecture does not work out of the box in Fedora unlike what it would seem on Ubuntu based on what I am reading online. 
Nonetheless, the unofficial packages for arm gnu gcc toolchain works like a charm unlike the official toolchain. 
While I have not done my due diligence to figure out how to cross-compile on Fedora properly as I tried to cross-compile right before I sleep. 
My impatience and tiredness, I did not manage to get the official toolchain from the ARM website to work 
as it would complain about missing some libraries. I cannot recall if this was from the official ARM toolchain or from Fedora's official package but I get 
issues like the following:

```
$ aarch64-linux-gnu-gcc test.c -o test -static
test.c:1:10: erreur fatale: stdio.h : Aucun fichier ou dossier de ce nom
    1 | #include <stdio.h>
      |          ^~~~~~~~~
compilation terminée.
```

[lantw44](https://copr.fedorainfracloud.org/coprs/lantw44/)'s build of the AArch64 and the 32-bit ARMV7 GNU toolchain worked flawlessly.

Installing [AArch64 Linux GNU Toolchain](https://copr.fedorainfracloud.org/coprs/lantw44/aarch64-linux-gnu-toolchain/), one can now compile their C code for 64-bit ARMv8 
with `aarch64-linux-gnu-gcc`:


```
$ aarch64-linux-gnu-gcc test.c -o test -static
$ file test
test: ELF 64-bit LSB executable, ARM aarch64, version 1 (GNU/Linux), statically linked, BuildID[sha1]=fc8921dfcad1a2a6aeeda3ebdff5d0c296dda865, for GNU/Linux 3.7.0, with debug_info, not stripped
```

To run the binary on your AMD64 Fedora Machine, you can simply use QEMU on user mode: `qemu-aarch64-static` for statis binaries
```
$ qemu-aarch64-static ./test
char is unsigned
```

If you compiled the binary as a dynamically linked binary, then you'll need to use `qemu-aarch64`. However, this will require more work:
```
$ qemu-aarch64 ./test
qemu-aarch64: Could not open '/lib/ld-linux-aarch64.so.1': No such file or directory
$ qemu-aarch64 -L /usr/aarch64-linux-gnu/sys-root/ ./test
char is unsigned
```

You will need to provide the path of aarch64 system root: `-L /usr/aarch64-linux-gnu/`. If you don't have sysroot, you probably can just install one of the following: `dnf provides */ld-linux-aarch64.so.1`
I probably could get the official ARM toolchain or official Fedora's package to work if I fiddled with the compilation flags but I found `lantw44` didn't require 
much work to get things to work out of the box.
