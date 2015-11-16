require 'rails_helper'

RSpec.describe Event, type: :model do
  let(:event) { build(:event) }

  it 'should create a valid event object' do
    expect(event).to be_valid
  end

  context 'display_name' do
    it 'should display the date and name' do
      event.name = 'FooBar Fest'
      expect(event.display_name).to eq('FooBar Fest')
    end
    it 'should display venue name when name is blank' do
      event.name = nil
      expect(event.display_name).to eq("#{event.start_date} - #{event.venue.name}")
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
