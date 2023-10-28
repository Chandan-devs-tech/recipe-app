require 'rails_helper'

RSpec.describe Recipe, type: :model do
  it 'Should allow a recipe with name, description, preparation time and cook time' do
    user = User.new(name: 'Marial', email: 'marial@gmail.com', password: '123456')
    recipe = Recipe.new(name: 'Beryani', description: 'Onion , Rice, Tomato and yougurt are needed',
                        preparation_time: 1, cook_time: 2, user:)
    expect(recipe).to be_valid
  end

  it 'Should not allow Recipe without name' do
    user = User.new(name: 'Marial', email: 'marial@gmail.com', password: '123456')
    recipe = Recipe.new(description: 'Onion , Rice, Tomato and yougurt are needed', preparation_time: 1,
                        cook_time: 2, user:)
    expect(recipe).not_to be_valid
  end

  it 'Should not allow Recipe without description' do
    user = User.new(name: 'Marial', email: 'marial@gmail.com', password: '123456')
    recipe = Recipe.new(name: 'Beryani', preparation_time: 1, cook_time: 2, user:)
    expect(recipe).not_to be_valid
  end

  it 'Should not allow Recipe without preparation time' do
    user = User.new(name: 'Marial', email: 'marial@gmail.com', password: '123456')
    recipe = Recipe.new(name: 'Beryani', description: 'Onion , Rice, Tomato and yougurt are needed', cook_time: 2,
                        user:)
    expect(recipe).not_to be_valid
  end

  it 'Should not allow Recipe without cooking time' do
    user = User.new(name: 'Marial', email: 'marial@gmail.com', password: '123456')
    recipe = Recipe.new(name: 'Beryani', description: 'Onion , Rice, Tomato and yougurt are needed',
                        preparation_time: 1, user:)
    expect(recipe).not_to be_valid
  end

  it 'Should not allow Recipe without user' do
    User.new(name: 'Marial', email: 'marial@gmail.com', password: '123456')
    recipe = Recipe.new(name: 'Beryani', description: 'Onion , Rice, Tomato and yougurt are needed',
                        preparation_time: 1, cook_time: 2)
    expect(recipe).not_to be_valid
  end
end
