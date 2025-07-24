---
layout: math-default                                                                   
title: Rational Inequality - Consider if x is negative
description: Solving a rational inequality problem
categories: [micro, math, inequalities]                                                
permalink: /blog/:title
---

Someone posted on a group chat a snippet from his course notes:

> i.e., it is WRONG if you try to do: $\frac{1}{x} \ge 2 \iff 1 \ge 2x$

and it was not clear to them as to why that is. 

This seems like an innocent attempt to solve the inequality and it is not entirely incorrect to do so. But when working with rational inequality, one needs to consider 
the signedness of x (i.e. is x negative or positive). The inequality could change depending on whether x is positive or negative.

To give a clearer picture, take a look at the graph of $\frac{1}{x}$ and notice how the function behaves differently when x is before or after the vertical asymptote.

Here's my crack at the problem, hopefully I didn't mess up:

if $x> 0:$

$$
\begin{align*}
\frac{1}{x} &\ge 2 \\
\iff 1 &\ge 2x \\
\iff x &\le \frac{1}{2}
\end{align*}
$$

if x = 0: Not possible (DNE)

if $x < 0$:

$$
\begin{align*}
\frac{1}{x} &\ge 2 \\
\implies \frac{1}{(-x')} &\ge 2, \quad x' > 0 \text{ & } x=-x' \\
\implies -1 &\ge 2x' \\
\implies \frac{-1}{2} &\ge x'
\end{align*}
$$

Recall $x'> 0$, but we found $x'\le \frac{-1}{2} < 0$ . This is a contradiction and therefore $x' \not \lt 0$

We have the following:

- $x \lt \frac{1}{2}$
  
- $x\ne 0$
  
- $x \not \lt 0$
  

$\therefore x \in (0, \frac{1}{2}]$
