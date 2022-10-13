require 'json'

def read_authors
  return [] unless File.exist?('./storage/authors.json')

  JSON.parse(File.read('./storage/authors.json')).map do |author|
    Author.new(author['first_name'], author['last_name'], author['id'])
  end
end
