require 'rails_helper'

RSpec.describe Lineup, type: :model do

  let(:lineup) { FactoryGirl.build(:lineup) }

  it 'should create a valid lineup object' do
    expect(lineup).to be_valid
  end

end
