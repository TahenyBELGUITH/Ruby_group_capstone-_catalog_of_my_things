require 'Date'
class Item
  attr_reader :publish_date, :genre, :author, :source, :label, :archived

  def initialize(publish_date)
    @id = id || Random.rand(1..1000)
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
