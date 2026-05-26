# [Ruby Wellington](https://wellington.ruby.nz) website

This was based on the [Christchurch website](https://github.com/rubynz/christchurch) - massive thanks to the Christchurch organisers.

This is designed to run on GitHub Pages, using Jekyll. It's a static site, so no
server-side processing is possible.

## Adding a new meetup

To add a new meetup, create a new file in the `_events/{year}` directory. The filename should be the date of the event plus a description, in the format `YYYY-MM-DD-whatever.md`. Copy the most recent event file and update the details.

## Running locally

To run this site locally, you'll need to have Ruby installed. Then, run:

```
bundle install
jekyll serve
```

## Importing from Meetup.com
