require_relative 'music'
require_relative 'genre'
require 'json'
require 'fileutils'

def add_music_album
  print 'Enter album Name: '
  name = gets.chomp
  print 'Enter album genre: '
  genre = gets.chomp
  print 'Enter publish date: '
  publish_date = gets.chomp
  print 'Do it has Spotify? [Y/N]: '
  on_spotify = gets.chomp.downcase == 'y' || gets.chomp.downcase == 'n'
  is_on_spotify = on_spotify == 'y' ? 'y' : 'n'
  new_album = MusicAlbum.new(name, publish_date, is_on_spotify)
  new_genre = Genre.new(genre)
  new_genre.add_item(new_album)
  @albums.push(new_album)
  puts 'Music add successfully!!'
end

def list_all_music_albums
  @albums.each_with_index do |album, index|
    puts "[#{index + 1}] - Album: #{album.name},  Publish_date: #{album.publish_date} , is_spotify: #{album.on_spotify}"
  end
  puts ''
end

def list_all_genres
  @albums.each_with_index { |album, index| puts "[#{index + 1}]-#{album.genre.name}" }
  puts ''
end

def write_albume_to_file
  albums = []
  @albums.each do |music|
    music_album = {
      'id' => music.id,
      'name' => music.name,
      'publish_date' => music.publish_date,
      'on_spotify' => music.on_spotify
    }
    albums.push(music_album)
  end

  File.write('./storage/albums.json', JSON.generate(albums), mode: 'w')
end

def read_albums_data
  return unless File.exist?('./storage/albums.json')

  albums = File.read('./storage/albums.json')
  albums = JSON.parse(albums)
  albums.each do |music|
    new_album = MusicAlbum.new(music['name'], music['publish_date'], music['on_spotify'])
    @albums.push(new_album)
  end
end
