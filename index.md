---
layout: default
---

{% include about.html %}

## Meetups

{% for event in site.events reversed %}
<div class="event-summary">
  <h3>
    <span class="date">{{ event.date | date: "%b %-d, %Y" }}</span>
    <a href="{{ event.url }}">{{ event.title }}</a>
  </h3>

  <div class="time">
    {{ event.time }}
    &middot;
    <a href="https://google.com/maps/search/{{ event.location }}" target="_blank">{{ event.location }}</a>
  </div>
  <p>{{ event.content | strip_html | truncatewords: 50 }}</p>
</div>
{% endfor %}
