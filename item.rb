require 'Date'
class Item
  attr_reader :publish_date
  attr_accessor :genre, :author, :source, :label, :archived
  
  def initialize(genre, author, source, label, publish_date)
    @id = id || Random.rand(1..1000)
    @genre = genre
    @author = author
    @source = source
    @label = label
    @publish_date = publish_date
    @archieved = archived
  end

  private

  def can_be_archieved?
    Date.today.year - Date.parse(@publish_date).year > 10
  end

  public

  def move_to_archieve
    @archieved = can_be_archieved?
  end
end
