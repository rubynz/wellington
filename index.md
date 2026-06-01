---
layout: default
title: Overview
---

<h2>Overview</h2>
<div class="content">
  {% include about_summary.html %}
</div>

{% if site.next_event %}
<h2>Next Meetup</h2>
{% include event_summary.html event=site.next_event %}
{% endif %}

<h2>Recent Meetups</h2>
{% assign recent_events = site.past_events | slice: 0, 2 %}
{% for event in recent_events %}
{% include event_summary.html event=event %}
{% endfor %}

<a href="/meetups" class="btn">See all meetups →</a>

<h2 id="about-us">About us</h2>
<div class="content">
  {% include about.html %}
</div>

