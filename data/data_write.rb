def save_author
  authors = []
  @authors.each do |author|
    authors.push({ first_name: author.first_name, last_name: author.last_name, id: author.id })
  end

  File.write('./storage/authors.json', JSON.generate(authors))
end
