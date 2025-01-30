---
layout: page
title: Random Links
permalink: /link
---

## {{page.title}}

Random links that I found interesting. I'll try to limit my commentary to a few sentences and be more organized. 
I'll try to avoid having a large daunting list like my [former prof](https://www.cs.toronto.edu/~arnold/)

---

**[The invalid 68030 instruction that accidentally allowed the Mac Classic II to successfully boot up](https://www.downtowndougbrown.com/2025/01/the-invalid-68030-instruction-that-accidentally-allowed-the-mac-classic-ii-to-successfully-boot-up/)**

An interesting read despite only understanding the gist of it. Essentially, the writer stumbled an issue that was displaying a Sad Mac with an indication that a 
bus error has occurred when trying out a keystroke that I guess is supposed to invoke a debugger on an emulator running Macintosh Classic II. As the title suggested, 
it's a dive into how he realized there was an invalid instruction in Motorola MC68030 CPU that allowed the Mac Classic II to boot up. A redditor commented [quipped 
that this would be a clever DRM protection](https://www.reddit.com/r/programming/comments/1ibei57/comment/m9kkmkv/?utm_source=share&utm_medium=web3x&utm_name=web3xcss&utm_term=1&utm_content=share_button) 
since it's an undocumented or invalid instruction that only allows the rom of the Classic II to only run on MC68030. This was an interesting theory/joke.


**[The GPU, not the TPM, is the root of hardware DRM](https://mjg59.dreamwidth.org/70954.html)**

I always thought one could capture whatever is displayed on the screen and if one couldn't, one could circumvent the protection via software including modification 
of the Kernel. I always thought that the OS would have access to anything that it would display to your display but apparently that is not the case.

> the decoded video material is still stored in RAM that the OS has no access to, and the GPU composites it onto the outbound video stream

I am assuming the RAM that the OS has no access to would either be the vRAM or memory that the BIOS hid from the OS.

---

**[Why does Gnome fingerprint unlock not unlock the keyring?](https://mjg59.dreamwidth.org/68537.html)**

I always wondered why I always needed to unlock the keyring (i.e. enter a password) when I log onto my laptop using my fingerprint. Now I know why. 
The author's note on Apple probably refers to MacOS as iPhone requires a PIN Code to be entered after boot (i.e. Before First Unlock).

---

**[Reverse Engineering iOS 18 Inactivity Reboot](https://naehrdine.blogspot.com/2024/11/reverse-engineering-ios-18-inactivity.html)**

This was an interesting analysis as it contradicted the rumours that was spread by US law enforcement which I found to be a stretched claim anyways.
For context, US law enforcements were claiming that seized iOS 18.0 iPhones were able to communicate to other iPhones (including older phones) in a secured 
environment (with all phones being on airplane mode) to reboot causing forensics to lose valuable access since the phone won't be in After First Unlock (AFU).
For context, phones in AFU state have user data is decrypted, you can receieve messages and you would have access to the Wifi network.
This means there is more attack surface which the forensic investigators can exploit once a vulnerability is identified.


