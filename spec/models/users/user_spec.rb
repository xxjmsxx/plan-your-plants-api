require 'rails_helper'

RSpec.describe "User Validations", type: :model do
  it 'is valid with valid attributes' do
    user = build(:user)
    expect(user).to be_valid
  end

  it 'is not valid without a username' do
    user = build(:user, username: nil)
    expect(user).to_not be_valid
  end

  it 'is not valid without an email' do
    user = build(:user, email: nil)
    expect(user).to_not be_valid
  end

  it 'is not valid without a password' do
    user = build(:user, password: nil)
    expect(user).to_not be_valid
  end

  it 'is not valid if password does not match password_confirmation' do
    user = build(:user, password_confirmation: 'different')
    expect(user).to_not be_valid
  end
end
