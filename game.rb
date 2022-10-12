require_relative 'item'

class Game < Item
  attr_accessor :multi_player, :last_played_at

  def initialize(publish_date, multi_player, last_played_at)
    super(id, publish_date)
    @multi_player = multi_player
    @last_played_at = last_played_at
  end

  def can_be_archived?
    super && (DateTime.now - @last_played_at).to_i / 365 > 2
  end
end
