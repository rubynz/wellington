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

{% assign other_upcoming = site.upcoming_events | where_exp: "e", "e.url != site.next_event.url" | slice: 0, 2 %}
{% if other_upcoming.size > 0 %}
<h2>Upcoming Meetup{% if other_upcoming.size > 1 %}s{% endif %}</h2>
{% for event in other_upcoming %}
{% include event_summary.html event=event %}
{% endfor %}
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

