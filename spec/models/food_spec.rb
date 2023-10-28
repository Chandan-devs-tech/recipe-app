require 'rails_helper'

RSpec.describe Food, type: :model do
  it 'Should allow the food with name, measurement_unit, price , quantity' do
    user = User.new(name: 'Marial', email: 'marial@gmail.com', password: '123456')
    food = Food.new(name: 'Tomato', measurement_unit: 'kg', price: 5, quantity: 1, user:)
    expect(food).to be_valid
  end

  it 'Should not allow Food without name' do
    user = User.new(name: 'Marial', email: 'marial@gmail.com', password: '123456')
    food = Food.new(measurement_unit: 'kg', price: 5, quantity: 1, user:)
    expect(food).not_to be_valid
  end

  it 'Should not allow Food without measurement unit' do
    user = User.new(name: 'Marial', email: 'marial@gmail.com', password: '123456')
    food = Food.new(name: 'Tomato', price: 5, quantity: 1, user:)
    expect(food).not_to be_valid
  end

  it 'Should not allow Food without price unit' do
    user = User.new(name: 'Marial', email: 'marial@gmail.com', password: '123456')
    food = Food.new(name: 'Tomato', measurement_unit: 'kg', quantity: 1, user:)
    expect(food).not_to be_valid
  end

  it 'Should not allow Food without quantity' do
    user = User.new(name: 'Marial', email: 'marial@gmail.com', password: '123456')
    food = Food.new(name: 'Tomato', measurement_unit: 'kg', price: 5, user:)
    expect(food).not_to be_valid
  end

  it 'Should not allow Food without user' do
    User.new(name: 'Marial', email: 'marial@gmail.com', password: '123456')
    food = Food.new(name: 'Tomato', measurement_unit: 'kg', price: 5, quantity: 1)
    expect(food).not_to be_valid
  end
end
