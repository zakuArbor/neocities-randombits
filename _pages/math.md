---
layout: page
title: Math
permalink: /math
---

## {{page.title}}

Random bits of Math, mainly from my [blog](https://zakuarbor.github.io/blog/)

<ul>
{% for post in site.posts %}
{% unless post.categories contains 'reviews' %}
{% if post.categories contains 'math' or post.categories contains 'physics' %}
<li><a href = '..{{post.url}}'>[{{post.date | date: "%Y-%m-%d"}}] {{ post.title }}</a></li>
{% endif %}
{% endunless %}
{% endfor %}
</ul>

---

## Course Reviews                                                               
                                                                                
---                                                                             
                                                                                
<ul>                                                                            
{% for post in site.posts %}                                                    
{% if post.categories contains 'reviews' and post.categories contains 'university' and post.categories contains 'math' or post.categories contains 'physics' %}
<li><a href = '..{{post.url}}'>{{ post.title }}</a></li>                        
{% endif %}                                                                     
{% endfor %}                                                                    
</ul>       
