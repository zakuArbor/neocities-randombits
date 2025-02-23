---
layout: micro
title:  "top and Kernel Threads"
date: 2025-02-23
categories: [micro, c/c++, linux]
published: true
permalink: micro/2025/02/:title
---

Recently I was curious if I am able to trick `top` to believing a userspace thread is a kernel thread. For context, a **kernel thread** unlike its userspace counterpart 
only exists within kernel space and lacks an address space. Another note is that kernel threads can only be created by other kernel threads such as forking the `kthreadd` process 
(PID 2) via the `clone()` systemcall. Kernel threads can be spawned by `struct task_struct *kthread_create()`.

There are lots of kernel threads running on your system such as `ksoftirq` or `kworker` threads as seen below:
```
$ ps -ef | grep -E "UID|\[" | head
UID          PID    PPID  C STIME TTY          TIME CMD
root           2       0  0 févr.20 ?     00:00:00 [kthreadd]
root           3       2  0 févr.20 ?     00:00:00 [pool_workqueue_release]
root           4       2  0 févr.20 ?     00:00:00 [kworker/R-rcu_gp]
root           5       2  0 févr.20 ?     00:00:00 [kworker/R-sync_wq]
root           6       2  0 févr.20 ?     00:00:00 [kworker/R-slub_flushwq]
root           7       2  0 févr.20 ?     00:00:00 [kworker/R-netns]
root          10       2  0 févr.20 ?     00:00:00 [kworker/0:0H-events_highpri]
root          13       2  0 févr.20 ?     00:00:00 [kworker/R-mm_percpu_wq]
root          14       2  0 févr.20 ?     00:00:00 [rcu_tasks_kthread]
```

Do you notice any pattern among kernel threads?

* kernel thread CMD name is enclosed in square brackets `[]`
* kernel threads have a parent id of 0 or 2

Based on the provided information, one would come to the conclusion that it is not possible. Based on one of the comments on [Stack Overflow](https://stackoverflow.com/questions/12213445/identifying-kernel-threads), 
they seem to have suggested that `ps` and `top` distinguish whether a process is a kernel thread based on whether it has a `cmdline` (i.e. `/proc/<pid>/cmdline`).

For instance, let's look at a kernel thread `kworker/R-btrfs-worker`, the `cmdline` file for this kernel thread should be empty as suggested above
```
$ ps -e | grep kworker | grep btrfs-worker
   1339 ?        00:00:00 kworker/R-btrfs-worker
$ cat /proc/1339/cmdline | wc -l
0
```

If we were to look on [Github](https://github.com/mmalecki/procps/blob/fe4c4a7314f32907b9f558ad0d8b8d0ff1cc76be/top.c#L229), it would appear that the user appears to be correct.
```c
/* if a process doesn't have a cmdline, we'll consider it a kernel thread
      -- since displayed tasks are given special treatment, we must too */
```

**Note:** I want to stress the user did not say relying on an empty `cmdline` is a reliable way to determine if a process is a kernel thread.

However, this is for procps-3.2.9 which was released at least more than 15 years ago. A lot has changed since then and there are better ways to determine whether a thread is 
a kernel thread or not as listed by the various answers on stackoverflow. 

I did not dig deep into the implementation of `top` to understand whether it really does rely on this cheap heurestic but if we were to look at `htop`, it takes advantage of checking 
whether or not [`PF_KTHREAD` bit flag is set](https://github.com/htop-dev/htop/blob/899c6b69424eef550e9e9dc4fb3d8e613772a379/linux/LinuxProcessTable.c#L1670):
```c
if (lp->flags & PF_KTHREAD) {
    proc->isKernelThread = true;
}
```

where in [`sched.h`](https://elixir.bootlin.com/linux/v6.13.3/source/include/linux/sched.h#L1695):
```c
#define PF_KTHREAD		0x00200000	/* I am a kernel thread */
```

Taking a look at a more [recent implementation of `top`](https://gitlab.com/procps-ng/procps/-/blob/v4.0.5/library/readproc.c?ref_type=tags#L1343) suggests that this cheap heurestic won't be effective of checking whether or not `cmdline` is set won't work:
```c
if (PT->hide_kernel && (p->ppid == 2 || p->tid == 2)) {
```

where kernel threads are now identified by checking whether or not the process is `kthreadd` (tid 2) or its children. To conclude, my original idea to trick `top` will not suffice.
