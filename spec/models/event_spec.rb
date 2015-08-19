require 'rails_helper'

RSpec.describe Event, type: :model do
  let(:event) { build(:event) }

  it 'should create a valid event object' do
    expect(event).to be_valid
  end

  context 'display_name' do
    it 'should display the date and name' do
      event.name = 'FooBar Fest'
      event.start_date = '2000-01-01'
      expect(event.display_name).to eq('2000-01-01 - FooBar Fest')
    end
    it 'should display venue name when name is blank' do
      good_value = "#{event.start_date} - #{event.venue.name}"
      event.name = nil
      expect(event.display_name).to eq(good_value)
    end
  end

  context 'start_date' do
    it 'should be required' do
      event.start_date = nil
      expect(event).to be_invalid
    end
  end

  context 'venue' do
    it 'should be required' do
      event.venue = nil
      expect(event).to be_invalid
    end
  end
end
