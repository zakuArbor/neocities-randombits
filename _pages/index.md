---
layout: page
title: "Random Bits"
date: 2024-08-22
permalink: /
---
<!--<h2><img src = "{{site.baseurl}}/assets/gifs/pikachu-wave.gif" style = "float:left; margin-right: 1em;">Welcome to yet another random website</h2>-->
<h2 id = "page-title"><img id = "pikachu-title" src = "{{site.baseurl}}/assets/gifs/pikachu-wave.gif">Welcome to yet another random website</h2>
A random website in cyberspace (or the wired) written by a random human on planet Earth. 
Random bits is a personal outlet to talk about random bits of things that is going in my mind and life.

### Latest µBlog 
<ul>
{% assign i = 0 %}
{% for post in site.posts %}
    {% if post.categories contains 'micro'%}
        {% assign i = i | plus: 1 %}
        {% if i == 5 %}
            {% break %}
        {% endif %}
        {% assign shorturl = post.id | split: "/" | last %}
        <li><a href = '..{{ post.url }}'>[{{ post.date | date: "%Y-%m-%d" }}] {{ post.title }}</a></li>
    {% endif %}
{% endfor %}
</ul>

### Latest Blog 
* [[June 22] Polluting the Web With a Useless 5 argument main function](https://zakuarbor.github.io/blog/useless-main/)
* [[May 27] A Quick and Flawed Look Into Spatial Locality and TLB](https://zakuarbor.github.io/blog/regret-tlb-cacheline/)
* [[May 08] Splitting Files On Linux](https://zakuarbor.github.io/blog/split-files/)
* [[Jan 14] Real Analysis 1](https://zakuarbor.github.io/blog/math3001/)

### Change Log
* 2024-08-22: redesigned microblog section to utilize Jekyll more effectively
* 2024-08-18: Added banner gif and more 88x31 buttons
* 2024-08-12: Copied over every Math webpages from <a href = "https://zakuarbor.github.io/blog/">personal blog</a>
* 2024-08-12: Migrated website to Jekyll

<b>Last Major Edit:</b> {{ page.date | date: "%Y-%m-%d" }}
