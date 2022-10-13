require_relative './game'
require_relative './author'

def add_game
  puts 'Is it multiplayer [Y / N]'
  multi_player = gets.chomp.downcase == 'y'
  puts 'Enter last played at in format (YYYY-MM-DD)'
  last_played_at = Date.parse(gets.chomp)
  puts 'Enter the publish date in format (YYYY-MM-DD)'
  publish_date = Date.parse(gets.chomp)
  puts "Enter author details\n"
  puts 'Enter first name'
  first_name = gets.chomp
  puts 'Enter last name'
  last_name = gets.chomp
  game = Game.new(publish_date, multi_player, last_played_at)
  author = Author.new(first_name, last_name)
  game.author = author
  @games.push(game)
  puts 'Game created successfully'
end

def list_all_games
  return puts 'No games found' if @games.empty?

  @games.each_with_index do |game, index|
    puts "#{index + 1}) Author: #{game.author.first_name} #{game.author.last_name}"
    puts "Multiplayer: #{game.multi_player}, Last played: #{game.last_played_at}, Publish date: #{game.publish_date}"
  end
end

def list_all_authors
  return puts 'No Authors found' if @games.empty?

  @games.each_with_index { |game, index| puts "#{index + 1}) Author: #{game.author.first_name} #{game.author.last_name}" }
end
