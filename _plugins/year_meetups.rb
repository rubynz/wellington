module Jekyll
  class YearMeetupsPage < Page
    def initialize(site, year, events, prev_year, next_year)
      @site = site
      @base = site.source
      @dir  = "meetups/#{year}"
      @name = "index.html"

      process(@name)
      read_yaml(File.join(@base, "_layouts"), "year_meetups.html")

      data["year"]      = year
      data["title"]     = "#{year} Meetups"
      data["events"]    = events.sort_by { |e| e.date }.reverse
      data["prev_year"] = prev_year
      data["next_year"] = next_year
    end
  end

  class YearMeetupsGenerator < Generator
    safe true
    priority :low

    def generate(site)
      events_by_year = site.collections["events"]
        .docs
        .group_by { |e| e.date.year.to_s }

      years = events_by_year.keys.sort

      years.each_with_index do |year, i|
        prev_year = i > 0 ? years[i - 1] : nil
        next_year = i < years.length - 1 ? years[i + 1] : nil
        site.pages << YearMeetupsPage.new(site, year, events_by_year[year], prev_year, next_year)
      end
    end
  end
end
