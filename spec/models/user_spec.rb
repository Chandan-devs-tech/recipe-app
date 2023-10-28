require 'rails_helper'

RSpec.describe User, type: :model do
  it 'Should allow the user with name, email and password' do
    user = User.new(name: 'Leah', email: 'leah@gmail.com', password: '123456')
    expect(user).to be_valid
  end

  it 'Should not allow User without name' do
    user = User.new(email: 'leah@gmail.com', password: '123456')
    expect(user).not_to be_valid
  end

  it 'Should not allow User without email' do
    user = User.new(name: 'Leah', password: '123456')
    expect(user).not_to be_valid
  end

  it 'Should not allow User without password' do
    user = User.new(name: 'Leah', email: 'leah@gmail.com')
    expect(user).not_to be_valid
  end
end
