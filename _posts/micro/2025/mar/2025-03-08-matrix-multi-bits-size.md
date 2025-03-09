---
layout: micro
title:  "The Bit Size of the Resulting Matrix"
date: 2025-03-07
categories: [micro, c/c++]
published: true
permalink: micro/2025/02/:title
---

Recently I have started reading [Performance Analysis and Tuning](https://github.com/dendibakh/perf-book), and a passage made me ponder more time than I would 
like to admit:

> Intel’s AMX extension, supported in server processors since 2023, multiplies 8-bit matrices of shape 16x64 and 64x16, accumulating into a 32-bit 16x16 matrix.

If you understand how matrix multiplication works, it is obvious as to why two non-square matrices results in a square matrix and also why 16x64 matrix must be 
multiplied by some matrix that has 64 rows. However, what my brain was stuck on was why the entries in the resulting matrix had to be 32-bit long and 
not 16 bits for instance.

It was only when I got my calculator that I understood why which shows my lack of experience working with bits since in Mathematics class, we never need to care 
about how many bits a number needs to be represented.

If we assume unsigned 8-bit integer, the highest number that can be represented is $2^8 - 1 = 255$ or $1111\ 1111_2$. Multiplying 255 by itself would obviously result 
in a larger number and therefore would require more than 8 bits to store the product. 255 * 255 = 65025 which can be represented in binary as:

$$
1111\ 1111\ 0000\ 0001_2
$$

To represent the largest possible product between two 8-bit unsigned integer requires 16 bits. But due to how matrix multiplication works, each entry of the resulting 
matrix multiplication is the sum of 64 individual products. For an entry $c_{ij}$ in the resulting matrix:

$$
c_{ij} = \sum_{k=1}^{64} a_{ik}b_{kj} \text{, for i,j = 1, ..., 16}
$$

If we were to add the largest possible product 64 times, then it would be 64 * 65025 = 4 161 600 which far exceeds the maximum range that an unsigned 16-bit integer 
can represent ($1111\ 1111\ 1111\ 1111_2 = 65\ 536$). Therefore each entry in the resulting matrix must be represented by at least 22 bits to taken into account of the 
largest possible entry from the product between the two 8-bit matrices. However, as we prefer to have sizes that naturally aligns with a power of 2, 32 bits would be 
the amount of bits required to store the product between 8-bit matrices of the shape 16x64 and 64x16.
