require_relative "slugify"

module Jekyll
  class CompanyPage < Page
    def initialize(site, name, slug, supported, staff_talks)
      @site = site
      @base = site.source
      @dir  = "companies/#{slug}"
      @name = "index.html"

      process(@name)
      read_yaml(File.join(@base, "_layouts"), "company.html")

      data["company_name"] = name
      data["title"]        = name
      data["supported"]    = supported.sort_by(&:date).reverse
      data["staff_talks"]  = staff_talks.sort_by { |t| t["event"].date }.reverse
    end
  end

  class CompaniesIndexPage < Page
    def initialize(site, companies)
      @site = site
      @base = site.source
      @dir  = "companies"
      @name = "index.html"

      process(@name)
      read_yaml(File.join(@base, "_layouts"), "companies_index.html")

      data["title"]     = "Companies"
      data["companies"] = companies.sort_by { |c| c["name"] }
    end
  end

  class CompaniesGenerator < Generator
    safe true
    priority :low
    include WellingtonSlugify

    def generate(site)
      companies = {}  # slug => { name, slug, supported: [], staff_talks: [] }

      site.collections["events"].docs.each do |event|
        # Track supporter companies
        (event.data["supporters"] || []).each do |supporter|
          name = supporter["name"]
          next unless name
          slug = slugify(name)
          companies[slug] ||= { "name" => name, "slug" => slug, "supported" => [], "staff_talks" => [] }
          companies[slug]["supported"] << event unless companies[slug]["supported"].include?(event)
        end

        # Track staff talks (speaker's company)
        (event.data["talks"] || []).each do |talk|
          (talk["speakers"] || []).each do |speaker|
            name = speaker["company"]
            next unless name
            slug = slugify(name)
            companies[slug] ||= { "name" => name, "slug" => slug, "supported" => [], "staff_talks" => [] }
            companies[slug]["staff_talks"] << { "talk" => talk, "speaker" => speaker, "event" => event }
          end
        end
      end

      companies.each do |_slug, company|
        site.pages << CompanyPage.new(site, company["name"], company["slug"], company["supported"], company["staff_talks"])
      end

      site.pages << CompaniesIndexPage.new(site, companies.values)
    end
  end
end
