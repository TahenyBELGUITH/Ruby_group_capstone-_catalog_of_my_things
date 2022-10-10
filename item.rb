class Item
  attr_writer :genre, :author, :source, :label

  def initialize(publish_date, archieved)
    @id = Round(1..100)
    @publish_date = publish_date
    @archieved = archieved
  end

  private

  def can_be_archieved?
    @publish_date > 10
  end

  public

  def move_to_archieve
    can_be_archieved? ? @archieved = true : return
  end
end
