require 'rails_helper'

RSpec.describe Event, type: :model do

  let(:event) { FactoryGirl.build(:event) }

  it 'should create a valid event object' do
    expect(event).to be_valid
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
