---
layout: micro
title:  "The Issue With Default in Switch Statements with Enums"
date: 2025-07-04
categories: [micro, c/c++] 
published: true
permalink: micro/2025/07/:title
---

Reading the coding standards at a company I recently joined revealed to me the issue with default label within the switch statement and why it's prohibitted when its being 
used to enumerate through an `enum`. `default` label is convenient to handle any edge cases and it's often used to handle errors. However, when working with enums, it is often 
the case that the prpogrammer intends to handle all possible values in the enum and would turn on `-Wswitch` or `-Werror=switch`.

Let's suppose I have an enum to represent the different suite in a deck of cards:
```c
#include <stdio.h>

enum Suit {
  Diamonds,
  Hearts,
  Clubs,
  Spades
};
```

and my break statement looks like the following:
```c
  switch(suit) {
    case Diamonds:
      printf("Diamonds\n");
      break;
    case Hearts:
      printf("Hearts\n");
      break;
    case Clubs:
      printf("Clubs\n");
      break;
  }
}
```

The code above is missing the `Spades` suite so if we were to compile with `-Wswitch`:

```
$ LC_MESSAGES=C gcc -Wswitch /tmp/test.c
/tmp/test.c: In function ‘main’:
/tmp/test.c:12:3: warning: enumeration value ‘Spades’ not handled in switch [-Wswitch]
   12 |   switch(suit) {
      |   ^~~~~~
```

**Note:** `LC_MESSAGES=C` is just to instruct GCC to default to traditional C English language behavior since my system is in French

But if we were to add the `default` case:

```
switch(suit) {
    case Diamonds:
      printf("Diamonds\n");
      break;
    case Hearts:
      printf("Hearts\n");
      break;
    case Clubs:
      printf("Clubs\n");
      break;
    default:
}
```

Then we will no longer see the error
```
$ LC_MESSAGES=C gcc  -Wswitch /tmp/test.c
$ 
```

However, we can get around this issue by being more specific with our warning flag using `-Wswitch-enum`:
```
$ LC_MESSAGES=C gcc  -Wswitch-enum /tmp/test.c
/tmp/test.c: In function ‘main’:
/tmp/test.c:12:3: warning: enumeration value ‘Spades’ not handled in switch [-Wswitch-enum]
   12 |   switch(suit) {
      |   ^~~~~~
```

Note that `-Wall` won't catch this error:
```
$ LC_MESSAGES=C gcc  -Wall /tmp/test.c
$ 
```
