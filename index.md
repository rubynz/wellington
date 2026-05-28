---
layout: default
---

{% include about.html %}

## Upcoming & Recent Meetups

{% assign recent_events = site.events | sort: "date" | reverse | slice: 0, 5 %}
{% for event in recent_events %}
{% include event_summary.html event=event %}
{% endfor %}

[See all meetups →](/meetups/)
