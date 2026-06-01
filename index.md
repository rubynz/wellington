---
layout: default
title: Overview
---

<h2>Overview</h2>
<div class="content">
  {% include about_summary.html %}
</div>

<h2>Next Meetup</h2>
<div class="content">
</div>

<h2>Upcoming Meetups</h2>
<div class="content">
</div>

<h2>Recent Meetups</h2>

{% assign recent_events = site.events | sort: "date" | reverse | slice: 0, 3 %}
{% for event in recent_events %}
{% include event_summary.html event=event %}
{% endfor %}

<a href="/meetups" class="btn">See all meetups →</a>

<h2 id="about-us">About us</h2>
<div class="content">
  {% include about.html %}
</div>

