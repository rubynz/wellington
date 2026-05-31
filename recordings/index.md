---
layout: default
title: Recordings
---
# Recordings

<div class="content">
  These are all the talks with recordings.

  We record most talks and put them on the <a href="https://www.youtube.com/@rubywellingtonmeetup" target="_blank">Ruby Wellington YouTube channel</a> within about a week of the event.
</div>

{% assign sorted_events = site.events | sort: "date" | reverse %}

{% for event in sorted_events %}
  {% assign recorded_talks = event.talks | where_exp: "talk", "talk.recording_url" %}
  {% if event.event_recording_url or event.event_recording_urls or recorded_talks.size > 0 %}
<div class="recorded-event">
  <h2>
    <a href="{{ event.url }}">{{ event.title }}</a>
    <br />
    <span class="subtitle">{{event.time}} {{ event.date | date: "%b %-d, %Y" }}</span>
  </h2>

  {% if event.event_recording_url or event.event_recording_urls %}
  {% include event_recordings.html event=event %}
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
