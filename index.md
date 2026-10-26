---
layout: default
title: Overview
---

<h2>Overview</h2>
<div class="content">
  {% include about_summary.html %}
  {% if site.luma_calendar_url %}
  <p>
    <a href="{{ site.luma_calendar_url | escape }}" class="btn btn-primary" id="luma-subscribe-button" target="_blank" rel="noopener">Subscribe for event updates →</a>
  </p>
  {% endif %}
</div>

{% if site.luma_calendar_id %}
<dialog class="luma-subscribe-dialog" id="luma-subscribe-dialog" aria-labelledby="luma-subscribe-title">
  <div class="luma-subscribe-dialog__header">
    <h2 id="luma-subscribe-title">Subscribe for event updates</h2>
    <form method="dialog">
      <button class="luma-subscribe-dialog__close" aria-label="Close">×</button>
    </form>
  </div>

  <iframe
    src="https://luma.com/embed/calendar/{{ site.luma_calendar_id | escape }}/events"
    title="Ruby Wellington Luma calendar"
    width="100%"
    height="450"
    frameborder="0"
    allowfullscreen
    loading="lazy"></iframe>
  {% if site.luma_calendar_url %}
  <p><a href="{{ site.luma_calendar_url | escape }}" target="_blank" rel="noopener">Open the calendar on Luma ↗</a></p>
  {% endif %}
</dialog>
<script>
  const lumaSubscribeButton = document.getElementById("luma-subscribe-button");
  const lumaSubscribeDialog = document.getElementById("luma-subscribe-dialog");

  if (lumaSubscribeButton && lumaSubscribeDialog && typeof lumaSubscribeDialog.showModal === "function") {
    lumaSubscribeButton.addEventListener("click", (event) => {
      event.preventDefault();
      lumaSubscribeDialog.showModal();
    });
  }
</script>
{% endif %}

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
