---
layout: page
title: "Categories"
permalink: /categories/
---

# Categories

Hopefully this will make the site less crazy.

**List of Categories:**

<div class="tags">
{% for category in site.categories %}
    {% capture category_name %}{{ category | first }}{% endcapture %}
    
    <a href ="#{{ category_name | slugize }}">{{ category_name }}</a>
{% endfor %}

</div>

---

{% for category in site.categories %}
  <div class="archive-group">
    {% capture category_name %}{{ category | first }}{% endcapture %}
    <div id="#{{ category_name | slugize }}"></div>
    <p></p>

    <a name="{{ category_name | slugize }}"></a>
    <h3 class="category-head">{{ category_name }}</h3>
    {% for post in site.categories[category_name] %}
    <article class="archive-item">
      <h4><a href="{{ site.baseurl }}{{ post.url }}">{% if post.title and post.title != "" %}{{post.title}}{% else %}{{post.excerpt |strip_html}}{%endif%}</a></h4>
    </article>
    {% endfor %}
  </div>
{% endfor %}

