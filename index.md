---
layout: default
---

<h2>Overview</h2>
<div class="content">
  <p>
    Ruby Wellington is an in-person meetup which runs about five times a year in the Wellington CBD.<br>
    <a href="https://www.ruby-lang.org/en/" target="_blank">Ruby</a> and it's associated ecosystem is our primary focus but our topics tend to be broad and appeal to a wide audience - everyone is welcome!
  </p>
  <p>
    We record most talks and put them on the <a href="https://www.youtube.com/@rubywellingtonmeetup" target="_blank">Ruby Wellington YouTube channel</a> within about a week.
  </p>
  <a href="/recordings" class="btn">See all recordings →</a>
  <p>
    For upcoming announcements and to RSVP, please join the event through <a href="https://www.meetup.com/rubywellington/" target="_blank">Meetup.com</a> and chat with us in the <a href="https://rubyau.slack.com/archives/C08AZUGJ6E4">#ruby-wellington</a> channel in the <a href="https://ruby.nz/#join-the-community" target="_blank">Ruby Oceania Slack</a>.
  </p>

  <a href="#about-us" class="btn">About Ruby Wellington →</a>
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

