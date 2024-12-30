<h1>August Edition</h1>

<ul>
{% assign currentMonth = "2024 Aug" | date: '%Y %b' %}
{% for post in site.posts %}
    {% if post.categories contains 'micro'%}
        {% assign postMonth = post.date | date: '%Y %b' %}
        {% if postMonth == currentMonth %}
        {% assign shorturl = post.id | split: "/" | last %}
        <li><a href = '..{{ post.url }}'>{{ post.title }}</a></li>
        {% endif %}
    {% endif %}
{% endfor %}
</ul>

{% for post in site.posts %}
    {% if post.categories contains 'micro'%}
        {% assign postMonth = post.date | date: '%Y %b' %}
        {% if postMonth == currentMonth %}
        {% assign shorturl = post.id | split: "/" | last %}
<hr class = "bits-hr">
<div class = "bits">
<h1 class = "title">{{ post.title }}</h1>
<div>
<p class = "date">{{ post.date | date: "%B %e, %Y" }}</p>
<div class="tags">
{% for category in post.categories %}
<a href="{{site.baseurl}}/categories/#{{category|slugize}}">{{category}}</a>
{% unless forloop.last %}&nbsp;{% endunless %}
{% endfor %}
</div>
</div>
{{ post.content }}
</div>
        {% endif %}
    {% endif %}
{% endfor %}
