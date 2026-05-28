module WellingtonSlugify
  def slugify(str)
    str.downcase
       .gsub(/[àáâãäå]/, "a").gsub(/[èéêë]/, "e")
       .gsub(/[ìíîï]/, "i").gsub(/[òóôõö]/, "o")
       .gsub(/[ùúûü]/, "u").gsub(/[ý]/, "y")
       .gsub(/ñ/, "n").gsub(/ç/, "c").gsub(/ß/, "ss")
       .gsub(/[^a-z0-9]+/, "-").gsub(/^-|-$/, "")
  end
end
