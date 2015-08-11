require 'rails_helper'

RSpec.describe Tour, type: :model do

  let(:tour) { FactoryGirl.build(:tour) }

  it 'should create a valid tour object' do
    expect(tour).to be_valid
  end

  context 'name' do
    it 'should be required' do
      tour.name = nil
      expect(tour).to be_invalid
    end
  end

end
