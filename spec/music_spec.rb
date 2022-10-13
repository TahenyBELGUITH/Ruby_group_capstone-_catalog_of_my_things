require_relative '../classes/music'
require 'date'

describe MusicAlbum do
  before :each do
    @music = MusicAlbum.new(Date.parse('2020-02-02'), true)
  end
  context 'When enter valid value ' do
    it 'return Class object ' do
      expect(@music).to be_an_instance_of(MusicAlbum)
    end

    it 'check the Date type' do
      expect(@music.publish_date).to eq Date.new(2020, 0o2, 0o2)
    end

    it 'Check the id type' do
      expect(@music.id.class).to eq Integer
    end
  end
end
