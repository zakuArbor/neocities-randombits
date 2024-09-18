---
layout: micro
title:  "Mixing Number and String"
date: 2024-09-18
categories: [micro, programming]
permalink: micro/2024/09/:title
---


A [recent post](https://tmendez.dev/posts/rng-git-hash-bug/) has gotten somewhat popular on the web and is something many of us could
somewhat relate with. In the case of many including the author, the issue stems from how YAML treats strings and numbers. As a rule of
thumb, I would always suggest avoiding any potential confusion by always adding the quotes around a string to ensure the value is treated
as a string as intended. The crux of the post was how their Git commit inconveniently happened to be `556474e378` which is very rare 
to obtain. Recall that scientific notation is in the form of `\d+(\.\d+)?E-?\d+` such as 8.5E-10 to refer to 8.5 x 10<sup>-10</sup>.
The issue that one may encounter when mixing numbers and strings is that things can go very unexpected like the author did whereby
`556474e378` was treated as 556474 x 10<sup>378</sup>. While I do not have any specific examples in mind when I have encountered such issues, 
I definitely have encountered this issue before where I mixed up a string and a number and obtained an undesired behavior. However, 
I do not think I ever encountered an issue where my numbers were interpreted as scientific notations.
