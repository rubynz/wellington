require_relative "slugify"

module Jekyll
  class PersonPage < Page
    def initialize(site, name, slug, talks, organised)
      @site = site
      @base = site.source
      @dir  = "people/#{slug}"
      @name = "index.html"

      process(@name)
      read_yaml(File.join(@base, "_layouts"), "person.html")

      data["person_name"] = name
      data["title"]       = name
      data["talks"]       = talks.sort_by { |t| t["event"].date }.reverse
      data["organised"]   = organised.sort_by(&:date).reverse
    end
  end

  class PeopleIndexPage < Page
    def initialize(site, people)
      @site = site
      @base = site.source
      @dir  = "people"
      @name = "index.html"

      process(@name)
      read_yaml(File.join(@base, "_layouts"), "people_index.html")

      data["title"]  = "People"
      data["people"] = people.sort_by { |p| p["name"] }
    end
  end

  class PeopleGenerator < Generator
    safe true
    priority :low

    def generate(site)
      people = {}  # slug => { name, slug, talks: [], organised: [] }

      site.collections["events"].docs.each do |event|
        (event.data["talks"] || []).each do |talk|
          (talk["speakers"] || []).each do |speaker|
            name = speaker["name"]
            next unless name
            slug = slugify(name)
            people[slug] ||= { "name" => name, "slug" => slug, "talks" => [], "organised" => [] }
            people[slug]["talks"] << { "talk" => talk, "event" => event }
          end
        end

        (event.data["organisers"] || []).each do |name|
          next unless name
          slug = slugify(name)
          people[slug] ||= { "name" => name, "slug" => slug, "talks" => [], "organised" => [] }
          people[slug]["organised"] << event
        end
      end

      people.each do |slug, person|
        talk_count = person["talks"].size
        organised_count = person["organised"].size
        person["talk_count"] = talk_count
        person["organised_count"] = organised_count
        person["total_count"] = talk_count + organised_count
        site.pages << PersonPage.new(site, person["name"], slug, person["talks"], person["organised"])
      end

      site.pages << PeopleIndexPage.new(site, people.values)
    end

    private

    include WellingtonSlugify
  end
end
