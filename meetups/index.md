---
layout: default
title: All Meetups
---

# All Meetups <span class="count">{{ site.events | size }}</span>

{% assign years = site.events | sort: "date" | reverse | group_by_exp: "event", "event.date | date: '%Y'" %}

<ul class="year-list">
{% for year in years %}
  <li><a href="/meetups/{{ year.name }}/">{{ year.name }} <span class="count">{{ year.items | size }}</span></a></li>
{% endfor %}
</ul>
