require 'rails_helper'

RSpec.describe Venue, :type => :model do

  let(:venue) { FactoryGirl.build(:venue) }

  it 'should create a valid venue object' do
    expect(venue).to be_valid
  end

  context 'name' do
    it 'should be required' do
      venue.name = nil
      expect(venue).to be_invalid
    end
  end

end
