require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { build(:user) }

  it 'should create a valid user object' do
    expect(user).to be_valid
  end

  context 'email' do
    it 'should be required' do
      user.email = nil
      expect(user).to be_invalid
    end

    it 'should be unique' do
      create(:user, email: user.email)
      expect(user).to be_invalid
    end
  end
end
