module Jekyll
  class EventSetsGenerator < Generator
    safe true
    priority :low

    def generate(site)
      all = site.collections["events"].docs.sort_by(&:date)

      upcoming = all.select { |e| e.data["upcoming"] }
      past     = all.reject { |e| e.data["upcoming"] }.reverse

      # Prefer the next announced event, but fall back to the next upcoming event
      next_event = upcoming.find { |e| e.data["announced"] } || upcoming.first

      site.config["next_event"]      = next_event
      site.config["upcoming_events"] = upcoming
      site.config["past_events"]     = past
    end
  end
end
