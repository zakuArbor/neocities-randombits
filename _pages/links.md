---
layout: page
title: Random Links
permalink: /link
---

<h2 id = "page-title"><img id = "pikachu-title" src = "{{site.baseurl}}/assets/gifs/pikachu-hi.webp">{{page.title}}</h2>

Random links that I found interesting. I'll try to limit my commentary to a few sentences and be more organized. 
I'll try to avoid having a large daunting list like my [former prof](https://www.cs.toronto.edu/~arnold/)

---

[Lessons from open source in the Mexican government](https://lwn.net/Articles/1013776/)

The article is interesting as it highlights the difficulty of introducing open-source to governments who are not known to be the most tech-savvy nor have the 
interest to diversify their technological dependence to big-tech. The article has a few interesting quotes that I would like to share:

> Another part of the project was to move away from Oracle and to PostgreSQL. That change led to various threats and intimidation from the company when it learned of the change
>
> [...] all of the large proprietary software companies ""are big bullies"". He has been called into the US embassy and been threatened because Mexico was using technology that was not from the US; 
>
> [...] Various companies use the US government to bully other countries, but they also use license audits as a reaction to projects that move to open-source software

The fact that companies threaten their customers comes to no surprise. While it may sound shocking initially, if one was to recall history, the pattern of big companies
abusing their power and even involving the government at times is a consistent pattern throughout history. Although extreme, look at the Banana war or the invasion 
of Hawaii for instance.

This I also find unsurprising:
> The team took advantage of the shift to restructure the database ""because we found that our storage provider was being a little bit naughty"", storing the data three or four times in order to charge more money. 
>
> [...]  When you make decisions that take money out of people's pockets, they ""start getting really nasty"". 

---

**[Tracking You from a Thousand Miles Away! Turning a Bluetooth Device into an Apple AirTag Without Root Privileges](https://nroottag.github.io/)**

This is a paper that demonstrates a way to track the location of a bluetooth device such as your Linux machine utilizing Apple's AirTag network. The irony is 
that iPhones can be utilized to track and stalk Android devices. What makes this paper interesting is its effectiveness and how wide spread 
its targets are as it can target Linux, Windows, and Android. 
The paper does suggest this attack would work for Apple devices as well by exploiting known vulnerabilities. The paper's threat model assumes the device has been 
infected via various methods such as extending an App's functionality to be malicious which could be utilized by advertisers, social media companies and music apps 
to track their user's locations.

---

**[bmpuzzle: Embed files within the padding of bitmap images](https://xiokka.neocities.org/projects/bmpuzzle/)**

As the title suggests, you can exploit padding that occurs for bmp images to embed files. Quite elegant and is much more discreet that concatenating a file 
on an image or [Stegasploit](https://stegosploit.info/), a way to encode files into PNG and JPEG images by utilizing the nature of polyglot and the use of 
some complicated iterative encoder. The reason why I like the suggested solution of embedding files onto the padding is that it's both simple and more discreet 
as it does not increase the size of the image and does not require the need for a complex iterative encoder to encode the image. 
Though there are constraints to what files you can encode as you would require a very tall image if you wish to encode anything large.

---

**[La fin de Windows 10 : une opportunité pour Linux ?](https://linuxfr.org/users/usawa/journaux/la-fin-de-windows-10-une-opportunite-pour-linux)**

There has been some optimistism of a great migration to Linux due to the approaching end of Windows 10 forcing millions of PCs without TPM to either be thrown out
or be migrated to Linux (or BSD). This articles highlights the difficulty of this dream.

---

**[C23: un memset_explicit() qui carbure](https://linuxfr.org/users/tarnyko/journaux/c23-un-memset_explicit-qui-carbure)**

When working with senisitive information such as password, it is often good practice to zero out or fill the memory with garbage values when the informtion is 
no longer needed. This helps prevent leaks of sensitive information. What is often the case, the variable holding the sensitive information is often not ever 
reused again and therefore the compiler will often ignore this call to zero out the sensitive information. The article was an interesting read as I forgot about 
the existence of optimization. The author provides a [multiplatform solution](https://github.com/Tarnyko/suave_code_samples/tree/master/C/C23/memset_explicit) to 
this problem.

---

**[The invalid 68030 instruction that accidentally allowed the Mac Classic II to successfully boot up](https://www.downtowndougbrown.com/2025/01/the-invalid-68030-instruction-that-accidentally-allowed-the-mac-classic-ii-to-successfully-boot-up/)**

An interesting read despite only understanding the gist of it. Essentially, the writer stumbled an issue that was displaying a Sad Mac with an indication that a 
bus error has occurred when trying out a keystroke that I guess is supposed to invoke a debugger on an emulator running Macintosh Classic II. As the title suggested, 
it's a dive into how he realized there was an invalid instruction in Motorola MC68030 CPU that allowed the Mac Classic II to boot up. A redditor [quipped 
that this would be a clever DRM protection](https://www.reddit.com/r/programming/comments/1ibei57/comment/m9kkmkv/?utm_source=share&utm_medium=web3x&utm_name=web3xcss&utm_term=1&utm_content=share_button) 
since it's an undocumented or invalid instruction that only allows the rom of the Classic II to only run on MC68030. This was an interesting theory/joke.

---

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


