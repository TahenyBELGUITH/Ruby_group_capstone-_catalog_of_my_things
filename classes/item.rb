require 'Date'
class Item
  attr_reader :publish_date, :genre, :author, :source, :label, :archived

  def initialize(publish_date, id: rand(1..2000), archived: true)
    @id = id
    @archived = archived
    @publish_date = publish_date
  end

  private

  def can_be_archieved?
    Date.today.year - Date.parse(@publish_date).year > 10
  end

  public

  def move_to_archieve
    @archieved = can_be_archieved?
  end

  # book,music,game
  def add_genre(genre)
    @genre = genre # 1 rel
    genre.items.push(self) unless genre.items.include?(self) # many rela
  end

  def add_author(author)
    @author = author # 1 rel
    author.items.push(self) unless author.items.include?(self) # many rela
  end

  def add_label(label)
    @label = label # 1 rel
    label.items.push(self) unless label.items.include?(self) # many rela
  end
end
