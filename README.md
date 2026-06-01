# [Ruby Wellington](https://wellington.ruby.nz) website

This was based on the [Christchurch website](https://github.com/rubynz/christchurch) - massive thanks to the Christchurch organisers.

This is designed to run on GitHub Pages, using Jekyll. It's a static site, so no
server-side processing is possible.

## Running locally

To run this site locally, you'll need to have Ruby installed. Then, run:

```
bundle install
jekyll serve
```

## Adding a new meetup

To add a new meetup, create a new file in the `_events/{year}` directory. The filename should be the date of the event plus a description, in the format `YYYY-MM-DD-whatever.md`. Copy the most recent event file and update the details.

We rely heavily on event frontmatter metadata to build a catalog of meetups, speakers, companies and organisers. For modern events, the frontmatter is used heavily in the rendering of the meetup page to avoid common boilerplate.

### Event flags

| Field | Type | Description |
|---|---|---|
| `legacy` | boolean | Shows body as "Description"; hides "About Ruby Wellington" section. This is only intended for old imported meetups |
| `upcoming` | boolean | Marks event as upcoming; shows RSVP button and "Details & RSVP" in summary |
| `announced` | boolean | Combined with `upcoming`, enables the RSVP button on the event title |

### Event metadata

| Field | Type | Description |
|---|---|---|
| `title` | string | Event title |
| `time` | string | Start time, e.g. `"5:30pm"` |
| `location` | string | Venue address (links to Google Maps) |
| `access` | string | Accessibility/access notes for the venue |
| `introduction` | markdown string | Shown above details list (rendered as markdown) |
| `notes` | string | Short notes shown in details list - typically this is where data corrections sit |
| `description` | string | Used in OG/Twitter share metadata |

### Links

| Field | Type | Description |
|---|---|---|
| `meetup_link` | string | URL to Meetup.com event page |
| `original_discussion` | string | URL to Google Groups discussion thread |

### Schedule

| Field | Type | Description |
|---|---|---|
| `schedule` | array | List of `{when, what}` items shown in details |

### Talks

| Field | Type | Description |
|---|---|---|
| `talks` | array | List of talks |
| `talks[].title` | string | Talk title |
| `talks[].description` | markdown string | Talk description |
| `talks[].speakers` | array | List of `{name, title, company}` |
| `talks[].recording_url` | string | YouTube URL for the talk recording |
| `talks[].slide_url` | string | URL to slides |
| `event_recording_url` | string | Single YouTube URL for a whole-event recording |
| `event_recording_urls` | array | Multiple YouTube URLs for a whole-event recording |

### People

| Field | Type | Description |
|---|---|---|
| `organisers` | array of strings | Names of organisers (linked to people pages) |

### Supporters

| Field | Type | Description |
|---|---|---|
| `supporters` | array | List of supporting companies |
| `supporters[].name` | string | Company name (linked to company page) |
| `supporters[].description` | markdown string | Description shown on event page - typically about the organisation or their contribution |
| `supporters[].url` | string | External URL; renders a "Website" button |
