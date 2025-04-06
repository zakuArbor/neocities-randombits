---
layout: micro
title:  "Row Major v.s Column Major: A look into Spatial Locality, TLB and Cache Misses"
date: 2025-03-16
categories: [micro, c/c++]
published: true
permalink: micro/2025/03/:title
---

Memory is often the bottleneck of programs. When writing programs, it is important to consider how data is structured based on their data accesses patterns. A classic example is 
accessing a matrix via row or column major i.e. going through a matrix by row or by column order.

**Theory:** Accessing a matrix by row-major will benefit from spatial locality as the next few elements will be accessed in the subsequent iterations and thus benefit from cacheline 
populating the next few elements on each cache miss. As column-major accesses elements that are spread apart, it will not benefit from the cache as much as the stride is sufficiently
large enough that the CPU is less likely to retrieve the next subsequent elements within the column. Therefore, column-major accesses will suffer from higher cache and TLB misses so 
we should expect more cache accesses and page walks.

**Theoretical/Expected Results:**

<table>
<thead>
    <tr>
    <th>Events</th>
    <th>Row-Major</th>
    <th>Col-Major</th>
    </tr>
</thead>
<tbody>
    <tr>
    <td>Cache Accesses</td>
    <td>Low</td>
    <td>High</td>
    </tr>
    <tr>
    <td>Cache Misses</td>
    <td>Low</td>
    <td>High</td>
    </tr>
    <tr>
    <td>TLB Acceses</td>
    <td>Low</td>
    <td>High</td>
    </tr>
    <tr>
    <td>TLB Misses</td>
    <td>Low</td>
    <td>High</td>
    </tr>
</tbody>
</table>

**Results:** Running `perf stat -e dTLB-load,dTLB-load-misses,cache-misses,cache-references ./row_<major|col>`:

<table>
<thead>
    <tr>
    <th>Events</th>
    <th>Row-Major</th>
    <th>Col-Major</th>
    </tr>
</thead>
<tbody>
    <tr>
    <td>Cache References</td>
    <td>164,724,829</td>
    <td>1 559,702,701</td>
    </tr>
    <tr>
    <td>Cache Misses</td>
    <td>164,010</td>
    <td>1,071,496,040</td>
    </tr>
    <tr>
    <td>dTLB Loads</td>
    <td>2,271,442</td>
    <td>274,596,480</td>
    </tr>
    <tr>
    <td>TLB Misses</td>
    <td>2,232,796</td>
    <td>273,704,958</td>
    </tr>
</tbody>
</table>

As expected, we do observe column major suffering greatly from its inability to utilize spatial locality. We can observe large magnitudes of cache 
accesses and dTLB loads compared to row major whereby cache is missed 68.7% of the time. This there translates to more than double the runtime performance slowdown 
(almost 3 times on my machine):

```
hyperfine --warmup 1 -i --export-markdown runtime.md ./row_major ./column_major
Benchmark 1: ./row_major
  Time (mean ± σ):      3.629 s ±  0.146 s    [User: 2.597 s, System: 1.011 s]
  Range (min … max):    3.519 s …  4.006 s    10 runs

Benchmark 2: ./column_major
  Time (mean ± σ):     10.793 s ±  0.290 s    [User: 9.716 s, System: 1.024 s]
  Range (min … max):   10.412 s … 11.201 s    10 runs

Summary
  ./row_major ran
    2.97 ± 0.14 times faster than ./column_major
```

