---
layout: page
title: Math
permalink: /math
---

<style>

#pikachu-title {
    top: -40px;
}

#title-content {
    margin-bottom: 35px;
}
@media only screen and (max-width: 600px) {
    #pikachu-title {
        top: 0px;
    }
    #title-content {
        margin-bottom: 0px;
    }
}
</style>

<h2 id = "page-title"><img id = "pikachu-title" src = "{{site.baseurl}}/assets/gifs/pikachu-snoozing.webp">{{page.title}}</h2>
<p id = "title-content">Random bits of Math, mainly from my <a href = "https://zakuarbor.github.io/blog/">blog</a></p>

---

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
