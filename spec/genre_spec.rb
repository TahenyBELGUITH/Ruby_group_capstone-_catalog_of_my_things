require_relative '../genre'

describe Genre do
  before :each do
    @genre = Genre.new('test')
  end
  context 'When it get Valid parameter' do
    it 'check is instance of class' do
      expect(@genre).to be_an_instance_of(Genre)
    end

    it 'check name type' do
      expect(@genre.name.class).to be String
    end
  end
end
