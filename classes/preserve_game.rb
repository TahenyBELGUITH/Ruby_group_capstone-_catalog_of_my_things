require 'json'
require_relative 'game'
require_relative 'author'

class PreserveGame
  attr_reader :games, :authors

  def initialize
    @games = []
    @authors = []
  end

  def load_games
    return unless File.exist?('./storage/games.json')

    games_loaded = JSON.parse(File.read('./storage/games.json'))
    games_loaded.each do |game|
      new_game = Game.new(game['publish_date'], game['multi_player'], game['last_played_at'])
      new_author = @authors.select { |author| author.id == game['author_id'] }[0]
      new_game.add_author = (new_author)
      @games << new_game
    end
  end

  def load_authors
    return unless File.exist?('./storage/authors.json')

    authors_loaded = JSON.parse(File.read('./storage/authors.json'))
    authors_loaded.each do |author|
      new_author = Author.new(author['first_name'], author['last_name'], author['id'])
      @authors << new_author
    end
  end

  def save_game(game)
    game = { id: game.id, publish_date: game.publish_date, multi_player: game.multi_player,
             last_played_at: game.last_played_at, author_id: game.author.id }
    if File.exist?('./storage/games.json')
      games_loaded = JSON.parse(File.read('./storage/games.json'))
      games_loaded << game
      File.write('./storage/games.json', JSON.pretty_generate(games_loaded))
    else
      File.write('./storage/games.json', JSON.pretty_generate([game]))
    end
  end

  def save_author(author)
    author = { id: author.id, first_name: author.first_name, last_name: author.last_name }
    if File.exist?('./storage/authors.json')
      authors_loaded = JSON.parse(File.read('./storage/authors.json'))
      authors_loaded << author
      File.write('./storage/authors.json', JSON.pretty_generate(authors_loaded))
    else
      File.write('./storage/authors.json', JSON.pretty_generate([author]))
    end
  end
end
