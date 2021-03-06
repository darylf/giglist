require 'rails_helper'

RSpec.describe Artist, type: :model do
  let(:artist) { build(:artist) }

  it 'should create a valid artist object' do
    expect(artist).to be_valid
  end

  context 'name' do
    it 'should be required' do
      artist.name = nil
      expect(artist).to be_invalid
    end

    it 'should be unique' do
      create(:artist, name: artist.name)
      expect(artist).to be_invalid
    end
  end
end
