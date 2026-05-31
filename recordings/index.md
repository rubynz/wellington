---
layout: default
title: Recordings
---
# Recordings

{% assign sorted_events = site.events | sort: "date" | reverse %}

{% for event in sorted_events %}
  {% assign recorded_talks = event.talks | where_exp: "talk", "talk.recording_url" %}
  {% if event.event_recording_url or event.event_recording_urls or recorded_talks.size > 0 %}
<div class="recording-event">
  <h2>
    <span class="date">{{ event.date | date: "%b %-d, %Y" }}</span>
    <a href="{{ event.url }}">{{ event.title }}</a>
  </h2>

  {% if event.event_recording_url %}
  <div class="event-recording">
    {% include video_embed.html url=event.event_recording_url title=event.title %}
    <a href="{{ event.event_recording_url }}" class="btn talk-link" target="_blank" rel="noopener">Watch on YouTube ↗</a>
  </div>
  {% elsif event.event_recording_urls %}
  <div class="event-recording">
    {% for url in event.event_recording_urls %}
    {% include video_embed.html url=url title=event.title %}
    <a href="{{ url }}" class="btn talk-link" target="_blank" rel="noopener">Watch on YouTube ↗</a>
    {% endfor %}
  </div>
  {% endif %}

  {% if recorded_talks.size > 0 %}
  <div class="event-talks">
    {% for talk in recorded_talks %}
    {% include talk_summary.html talk=talk %}
    {% endfor %}
  </div>
  {% endif %}
</div>
  {% endif %}
{% endfor %}
