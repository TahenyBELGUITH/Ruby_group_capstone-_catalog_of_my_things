require_relative './classes/music_options'
require_relative './classes/book_options'
require_relative './classes/game_options'
require_relative './classes/preserve_game'
require './data_storage'
require 'fileutils'
require 'json'

class App
  def initialize
    @books = []
    @albums = []
    @preserve_game = PreserveGame.new
    @preserve_game.load_authors
    @preserve_game.load_games
    @options = [
      'List all books',
      'List all music albums',
      'List of games',
      'List all genres (e.g "Comedy", "Thriller")',
      'List all labels (e.g. "Gift", "New")',
      'List all authors (e.g. "Stephen King")',
      'Add a book',
      'Add a music album',
      'Add a game',
      'Exit'
    ]
  end

  def run
    read_book_data
    read_albums_data
    loop do
      @options.each_with_index do |option, index|
        puts "[#{index + 1}]- #{option}"
      end
      user_input
    end
  end

  def user_input
    print 'Please choose an option [1-10] '
    user_choice = gets.chomp.to_i
    operations(user_choice)
  end

  def operations(user_choice)
    case user_choice
    when 1 then list_all_books
    when 2 then list_all_music_albums
    when 3 then list_all_games(@preserve_game)
    when 4 then list_all_genres
    when 5 then list_all_labels
    when 6 then list_all_authors(@preserve_game)
    else operations_two(user_choice)
    end
  end

  def operations_two(user_choice)
    case user_choice
    when 7 then add_book
    when 8 then add_music_album
    when 9 then add_game(@preserve_game)
    when 10 then exit_app
    else p 'Please choose a number between 1-10'
    end
  end

  def exit_app
    p 'Thank you for using this app. Have a good day!'
    exit(true)
  end
end
